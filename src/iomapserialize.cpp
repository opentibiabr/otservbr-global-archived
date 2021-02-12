/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2021 Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "iomapserialize.h"
#include "game.h"
#include "bed.h"

void IOMapSerialize::loadHouseItems(Map* map)
{
	int64_t start = OTSYS_TIME();

	DBResult_ptr result = Database::getInstance().storeQuery("SELECT `data` FROM `tile_store`");
	if (!result) {
		return;
	}

	do {
		unsigned long attrSize;
		const char* attr = result->getStream("data", attrSize);

		PropStream propStream;
		propStream.init(attr, attrSize);

		uint16_t x, y;
		uint8_t z;
		if (!propStream.read<uint16_t>(x) || !propStream.read<uint16_t>(y) || !propStream.read<uint8_t>(z)) {
			continue;
		}

		Tile* tile = map->getTile(x, y, z);
		if (!tile) {
			continue;
		}

		uint32_t item_count;
		if (!propStream.read<uint32_t>(item_count)) {
			continue;
		}

		while (item_count--) {
			loadItem(propStream, tile);
		}
	} while (result->next());
	std::cout << "> Loaded house items in: " << (OTSYS_TIME() - start) / (1000.) << " seconds" << std::endl;
}

bool IOMapSerialize::saveHouseItems()
{
	int64_t start = OTSYS_TIME();

	//Start the transaction
	DBTransaction transaction(&g_database());
	if (!transaction.begin()) {
		return false;
	}

	//clear old tile data
	if (!g_database().executeQuery("DELETE FROM `tile_store`")) {
		return false;
	}

	DBInsert stmt(&g_database(), "INSERT INTO `tile_store` (`house_id`, `data`) VALUES ");

	std::stringExtended query(1024);
	PropWriteStream stream;
	for (auto& it : g_game().map.houses.getHouses()) {
		//save house items
		House* house = &it.second;
		for (HouseTile* tile : house->getTiles()) {
			saveTile(stream, tile);

			size_t attributesSize;
			const char* attributes = stream.getStream(attributesSize);
			if (attributesSize > 0) {
				query.clear();
				query << house->getId() << ',' << g_database().escapeBlob(attributes, attributesSize);
				if (!stmt.addRow(query)) {
					return false;
				}
				stream.clear();
			}
		}
	}

	if (!stmt.execute()) {
		return false;
	}

	//End the transaction
	bool success = transaction.commit();
	std::cout << "> Saved house items in: " <<
			  (OTSYS_TIME() - start) / (1000.) << " seconds" << std::endl;
	return success;
}

bool IOMapSerialize::loadContainer(PropStream& propStream, Container* container)
{
	while (container->serializationCount > 0) {
		if (!loadItem(propStream, container)) {
			std::cout << "[Warning - IOMapSerialize::loadContainer] Unserialization error for container item: " << container->getID() << std::endl;
			return false;
		}
		container->serializationCount--;
	}

	uint8_t endAttr;
	if (!propStream.read<uint8_t>(endAttr) || endAttr != 0) {
		std::cout << "[Warning - IOMapSerialize::loadContainer] Unserialization error for container item: " << container->getID() << std::endl;
		return false;
	}
	return true;
}

bool IOMapSerialize::loadItem(PropStream& propStream, Cylinder* parent)
{
	uint16_t id;
	if (!propStream.read<uint16_t>(id)) {
		return false;
	}

	Tile* tile = nullptr;
	if (parent->getParent() == nullptr) {
		tile = parent->getTile();
	}

	const ItemType& iType = Item::items[id];
	if (iType.moveable || !tile || iType.isCarpet() || iType.isFilledBath()) {
		//create a new item
		Item* item = Item::CreateItem(id);
		if (item) {
			if (item->unserializeAttr(propStream)) {
				Container* container = item->getContainer();
				if (container && !loadContainer(propStream, container)) {
					delete item;
					return false;
				}

				parent->internalAddThing(item);
				item->startDecaying();
			} else {
				std::cout << "WARNING: Unserialization error in IOMapSerialize::loadItem()" << id << std::endl;
				delete item;
				return false;
			}
		}
	} else {
		// Stationary items like doors/beds/blackboards/bookcases
		Item* item = nullptr;
		if (const TileItemVector* items = tile->getItemList()) {
			for (Item* findItem : *items) {
				if (findItem->getID() == id) {
					item = findItem;
					break;
				} else if (iType.isDoor() && findItem->getDoor()) {
					item = findItem;
					break;
				} else if (iType.isBed() && findItem->getBed()) {
					item = findItem;
					break;
				}
			}
		}

		if (item) {
			if (item->unserializeAttr(propStream)) {
				Container* container = item->getContainer();
				if (container && !loadContainer(propStream, container)) {
					return false;
				}

				g_game().transformItem(item, id);
			} else {
				std::cout << "WARNING: Unserialization error in IOMapSerialize::loadItem()" << id << std::endl;
			}
		} else {
			//The map changed since the last save, just read the attributes
			std::unique_ptr<Item> dummy(Item::CreateItem(id));
			if (dummy) {
				dummy->unserializeAttr(propStream);
				Container* container = dummy->getContainer();
				if (container) {
					if (!loadContainer(propStream, container)) {
						return false;
					}
				} else if (BedItem* bedItem = dynamic_cast<BedItem*>(dummy.get())) {
					uint32_t sleeperGUID = bedItem->getSleeper();
					if (sleeperGUID != 0) {
						g_game().removeBedSleeper(sleeperGUID);
					}
				}
			}
		}
	}
	return true;
}

void IOMapSerialize::saveItem(PropWriteStream& stream, const Item* item)
{
	const Container* container = item->getContainer();

	// Write ID & props
	stream.write<uint16_t>(item->getID());
	item->serializeAttr(stream);

	if (container) {
		// Hack our way into the attributes
		stream.write<uint8_t>(ATTR_CONTAINER_ITEMS);
		stream.write<uint32_t>(container->size());
		for (auto it = container->getReversedItems(), end = container->getReversedEnd(); it != end; ++it) {
			saveItem(stream, *it);
		}
	}

	stream.write<uint8_t>(0x00); // attr end
}

void IOMapSerialize::saveTile(PropWriteStream& stream, const Tile* tile)
{
	const TileItemVector* tileItems = tile->getItemList();
	if (!tileItems) {
		return;
	}

	std::forward_list<Item*> items;
	uint16_t count = 0;
	for (Item* item : *tileItems) {
		const ItemType& it = Item::items[item->getID()];

		// Note that these are NEGATED, ie. these are the items that will be saved.
		if (!(it.isFilledBath() || it.moveable || it.isCarpet() || item->getDoor()
			|| (item->getContainer() && !item->getContainer()->empty()) || it.canWriteText || item->getBed())) {
			continue;
		}

		items.push_front(item);
		++count;
	}

	if (!items.empty()) {
		const Position& tilePosition = tile->getPosition();
		stream.write<uint16_t>(tilePosition.x);
		stream.write<uint16_t>(tilePosition.y);
		stream.write<uint8_t>(tilePosition.z);

		stream.write<uint32_t>(count);
		for (const Item* item : items) {
			saveItem(stream, item);
		}
	}
}

bool IOMapSerialize::loadHouseInfo()
{
	DBResult_ptr result = g_database().storeQuery("SELECT `id`, `owner`, `paid`, `warnings` FROM `houses`");
	if (!result) {
		return false;
	}

	do {
		House* house = g_game().map.houses.getHouse(result->getNumber<uint32_t>("id"));
		if (house) {
			house->setOwner(result->getNumber<uint32_t>("owner"), false);
			house->setPaidUntil(result->getNumber<time_t>("paid"));
			house->setPayRentWarnings(result->getNumber<uint32_t>("warnings"));
		}
	} while (result->next());

	result = g_database().storeQuery("SELECT `house_id`, `listid`, `list` FROM `house_lists`");
	if (result) {
		do {
			House* house = g_game().map.houses.getHouse(result->getNumber<uint32_t>("house_id"));
			if (house) {
				house->setAccessList(result->getNumber<uint32_t>("listid"), result->getString("list"));
			}
		} while (result->next());
	}
	return true;
}

bool IOMapSerialize::saveHouseInfo()
{
	DBTransaction transaction(&g_database());
	if (!transaction.begin()) {
		return false;
	}

	if (!g_database().executeQuery("DELETE FROM `house_lists`")) {
		return false;
	}

	std::stringExtended query(1024);
	for (auto& it : g_game().map.houses.getHouses()) {
		House* house = &it.second;

		const std::string& escapedName = g_database().escapeString(house->getName());
		query.clear();
		query << "INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `town_id`, `rent`, `size`, `beds`) VALUES (";
		query << house->getId() << ',';
		query << house->getOwner() << ',';
		query << static_cast<int32_t>(house->getPaidUntil()) << ',';
		query << house->getPayRentWarnings() << ',';
		query << escapedName << ',';
		query << house->getTownId() << ',';
		query << house->getRent() << ',';
		query << static_cast<uint32_t>(house->getTiles().size()) << ',';
		query << house->getBedCount() << ')';
		query << "ON DUPLICATE KEY UPDATE `owner` = " << house->getOwner();
		query << ",`paid` = " << static_cast<int32_t>(house->getPaidUntil());
		query << ",`warnings` = " << house->getPayRentWarnings();
		query << ",`name` = " << escapedName;
		query << ",`town_id` = " << house->getTownId();
		query << ",`rent` = " << house->getRent();
		query << ",`size` = " << static_cast<uint32_t>(house->getTiles().size());
		query << ",`beds` = " << house->getBedCount();
		g_database().executeQuery(query);
	}

	DBInsert stmt(&g_database(), "INSERT INTO `house_lists` (`house_id` , `listid` , `list`) VALUES ");

	for (auto& it : g_game().map.houses.getHouses()) {
		House* house = &it.second;

		std::string listText;
		if (house->getAccessList(GUEST_LIST, listText) && !listText.empty()) {
			query.clear();
			query << house->getId() << ',' << GUEST_LIST << ',' << g_database().escapeString(listText);
			if (!stmt.addRow(query)) {
				return false;
			}

			listText.clear();
		}

		if (house->getAccessList(SUBOWNER_LIST, listText) && !listText.empty()) {
			query.clear();
			query << house->getId() << ',' << SUBOWNER_LIST << ',' << g_database().escapeString(listText);
			if (!stmt.addRow(query)) {
				return false;
			}

			listText.clear();
		}

		for (Door* door : house->getDoors()) {
			if (door->getAccessList(listText) && !listText.empty()) {
				query.clear();
				query << house->getId() << ',' << door->getDoorId() << ',' << g_database().escapeString(listText);
				if (!stmt.addRow(query)) {
					return false;
				}

				listText.clear();
			}
		}
	}

	if (!stmt.execute()) {
		return false;
	}

	return transaction.commit();
}

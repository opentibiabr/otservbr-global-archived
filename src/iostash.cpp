/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2020  Mark Samman <mark.samman@gmail.com>
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
#include "iostash.h"
#include "databasetasks.h"
#include "enums.h"
#include "item.h"
#include "items.h"

StashItemList IOStash::getStoredItems(uint32_t playerId) {
	StashItemList itemList;

	std::ostringstream query;

	query << "SELECT `item_id`, `item_count` FROM `player_stash` WHERE `player_id` = " << playerId;

	DBResult_ptr result = Database::getInstance().storeQuery(query.str());

	if (result) {
		do {
			uint16_t itemId = result->getNumber<uint16_t>("item_id");
			uint32_t stowedCount = result->getNumber<uint32_t>("item_count");
			itemList[itemId] = stowedCount;		

		} while (result->next());
	}

	return itemList;
}

uint16_t IOStash::getStashItemCount(uint32_t playerId, uint32_t spriteId) {

	std::ostringstream query;
	query << "SELECT `item_count` FROM `player_stash` WHERE `player_id` = " << playerId << " AND `item_id` = " << spriteId;

	DBResult_ptr result = Database::getInstance().storeQuery(query.str());

	if (result) {
		uint16_t itemCount = result->getNumber<uint16_t>("item_count");
		return itemCount;
	} else {
		return 0;
	}
}

uint16_t IOStash::getStashSize(StashItemList itemList) {
	uint16_t size = 0;

	for (auto item : itemList)
	{
		size += ceil(item.second / 100.0);
	}

	return size;
}

std::map<uint16_t, std::pair<bool, uint32_t>> IOStash::stashContainer(uint32_t playerId, std::map<uint16_t, std::pair<bool, uint32_t>> itemDict, uint16_t stashSize)
{
	  StashItemList stashItemDict;

	  for (auto item : itemDict) {
	    stashItemDict[item.first] = item.second.second;
	  }

	  for (auto item : getStoredItems(playerId)) {
	    if(!stashItemDict[item.first])
	      stashItemDict[item.first] = item.second;
	    else
	      stashItemDict[item.first] += item.second;
	  }

	  if (getStashSize(stashItemDict) > stashSize) {
	    itemDict.clear();
	    return itemDict;
	  }

	std::ostringstream query;
	query << "SELECT * FROM `player_stash` WHERE `player_id` = ";
	query << playerId << " AND `item_id` IN (";

	for (auto iter = itemDict.begin(); iter != itemDict.end(); iter++)
	{
		query << iter->first << (std::next(iter) != itemDict.end() ? "," : ")");
	}

	Database& db = Database::getInstance();
	DBResult_ptr hasItem = db.storeQuery(query.str());

	query.str("");

	if (hasItem) {
		do {
			uint16_t itemId = hasItem->getNumber<uint16_t>("item_id");
			uint16_t stashedCount = hasItem->getNumber<uint16_t>("item_count");

			itemDict[itemId].second += stashedCount;
			itemDict[itemId].first = true;
		} while (hasItem->next());
	}

	std::ostringstream updateQuery;
	std::ostringstream insertQuery;
	bool hasInsert = false;
	bool hasUpdate = false;

	insertQuery << "INSERT INTO `player_stash` (`player_id`,`item_id`,`item_count`) VALUES ";
	updateQuery << "UPDATE `player_stash` SET `item_count` = CASE `item_id`";


	for (auto itemSet : itemDict)
	{
		auto tuple = itemSet.second;
		uint16_t itemCount = tuple.second;

		if (tuple.first) {
			updateQuery << " WHEN " << itemSet.first << " THEN " << itemCount;
			hasUpdate = true;
		}
		else {
			insertQuery << (hasInsert ? ", " : "") << "(";
			insertQuery << playerId << ", ";
			insertQuery << itemSet.first << ", ";
			insertQuery << itemCount << " )";
			hasInsert = true;
		}
	}

	updateQuery << " END WHERE `player_id` = " << playerId;
	updateQuery << " AND `item_id` IN ( ";
	insertQuery << ";";

	if (hasInsert) {
		db.executeQuery(insertQuery.str());
	}

	if (hasUpdate) {

		bool hasMoreData = false;

		for (auto iter = itemDict.begin(); iter != itemDict.end(); iter++)
		{
			if (itemDict[iter->first].first) {
				updateQuery << (hasMoreData ? "," : "") << iter->first;
				hasMoreData = true;
			}
			updateQuery << (std::next(iter) != itemDict.end() ? "" : ")");
		}

		db.executeQuery(updateQuery.str());
	}

	return itemDict;
}

bool IOStash::withdrawItem(uint32_t playerId, uint16_t itemId, uint16_t count)
{	
	std::ostringstream query;
	uint16_t remainingCount = 0;

	query << "SELECT `item_count` FROM `player_stash` WHERE `player_id` = " << playerId << " AND `item_id` = " << itemId;

	Database& db = Database::getInstance();
	DBResult_ptr result = db.storeQuery(query.str());
	query.str("");

	if (result) {
		remainingCount = result->getNumber<uint32_t>("item_count") - count;
	}
	else {
		std::cout << "[IOStash::withdrawItem] could not withdraw itemId " << itemId << " from playerId " << playerId << std::endl;
		return false;
	}

	if(remainingCount != 0) {
		query << "UPDATE `player_stash` SET `item_count` = " << remainingCount << " WHERE `item_id` = " << itemId << " AND `player_id` = " << playerId;
	}
	else {
		query << "DELETE FROM `player_stash` WHERE `item_id` = " << itemId << " AND `player_id` = " << playerId;
	}

	db.executeQuery(query.str());

	return true;
}

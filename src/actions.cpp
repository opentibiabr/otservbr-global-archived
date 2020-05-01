/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
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

#include <string>
#include <utility>

#include "actions.h"
#include "bed.h"
#include "configmanager.h"
#include "container.h"
#include "game.h"
#include "pugicast.h"
#include "rewardchest.h"
#include "spells.h"


extern Game g_game;
extern Spells* g_spells;
extern Actions* g_actions;
extern ConfigManager g_config;

Actions::Actions() : scriptInterface("Action Interface") {
	scriptInterface.initState();
}

Action::Action(LuaScriptInterface* interface) :
	Event(interface), function(nullptr), allowFarUse(false), checkFloor(true),
	checkLineOfSight(true) {}

Actions::~Actions() {
	clear(false);
}

void Actions::clearMap(ActionUseMap* map, bool fromLua) {
	if(map == nullptr) {
		DLOG_F(WARNING, "Map pointer is nullptr!");
		return;
	}

	for (auto it = map->begin(); it != map->end(); ) {
		if (fromLua == it->second.fromLua) {
			it = map->erase(it);
		} else {
			++it;
		}
	}
}

void Actions::clear(bool fromLua) {
	LOG_F(INFO, "Clear");

	DLOG_F(INFO, "Clear Use Item");
	clearMap(&useItemMap, fromLua);
	DLOG_F(INFO, "Clear Unique Item");
	clearMap(&uniqueItemMap, fromLua);
	DLOG_F(INFO, "Clear Action Item");
	clearMap(&actionItemMap, fromLua);

	DLOG_F(INFO, "Restart Lua State?[%s]", fromLua == true ? "yes" : "no");
	reInitState(fromLua);
}

LuaScriptInterface& Actions::getScriptInterface() {
	DLOG_F(INFO, "Get Script Interface");
	return scriptInterface;
}

std::string Actions::getScriptBaseName() const {
	DLOG_F(INFO, "Get Script Base Name");
	return "actions";
}

Event_ptr Actions::getEvent(const std::string& nodeName) {
	DLOG_F(INFO, "Get Event[%s]", nodeName.c_str());

	if (strcasecmp(nodeName.c_str(), "action") != 0) {
		DLOG_F(WARNING, "Nullptr");
		return nullptr;
	}
	return Event_ptr(new Action(&scriptInterface));
}

bool Actions::registerEvent(Event_ptr event, const pugi::xml_node& node) {
	// event is guaranteed to be an Action
	Action_ptr action{static_cast<Action*>(event.release())};

	pugi::xml_attribute attr;
	if ((attr = node.attribute("itemid"))) {
		uint16_t id = pugi::cast<uint16_t>(attr.value());

		auto result = useItemMap.emplace(id, std::move(*action));
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with id:[%d] ", id);
		}
		return result.second;
	} else if ((attr = node.attribute("fromid"))) {
		pugi::xml_attribute toIdAttribute = node.attribute("toid");
		if (!toIdAttribute) {
			LOG_F(WARNING, "Missing toid in fromid:[%s] ", attr.as_string());
			return false;
		}

		uint16_t fromId = pugi::cast<uint16_t>(attr.value());
		uint16_t iterId = fromId;
		uint16_t toId = pugi::cast<uint16_t>(toIdAttribute.value());

		auto result = useItemMap.emplace(iterId, *action);
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with id:[%d] in "
							"fromid:[%d], toid[%d]!", iterId, fromId, toId);
		}

		bool success = result.second;
		while (++iterId <= toId) {
			result = useItemMap.emplace(iterId, *action);
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with id:[%d] in "
								"fromid:[%d], toid[%d]!", iterId, fromId, toId);
				continue;
			}
			success = true;
		}
		return success;
	} else if ((attr = node.attribute("uniqueid"))) {
		uint16_t uid = pugi::cast<uint16_t>(attr.value());

		auto result = uniqueItemMap.emplace(uid, std::move(*action));
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with uid:[%d] ", uid);
		}
		return result.second;
	} else if ((attr = node.attribute("fromuid"))) {
		pugi::xml_attribute toUidAttribute = node.attribute("touid");
		if (!toUidAttribute) {
			LOG_F(WARNING, "Missing touid in fromuid:[%s] ", attr.as_string());
			return false;
		}

		uint16_t fromUid = pugi::cast<uint16_t>(attr.value());
		uint16_t iterUid = fromUid;
		uint16_t toUid = pugi::cast<uint16_t>(toUidAttribute.value());

		auto result = uniqueItemMap.emplace(iterUid, *action);
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with uid:[%d] in "
						"fromuid:[%d], touid[%d]!", iterUid, fromUid, toUid);
		}

		bool success = result.second;
		while (++iterUid <= toUid) {
			result = uniqueItemMap.emplace(iterUid, *action);
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with uid:[%d] in "
						"fromuid:[%d], touid[%d]!", iterUid, fromUid, toUid);
				continue;
			}
			success = true;
		}
		return success;
	} else if ((attr = node.attribute("actionid"))) {
		uint16_t aid = pugi::cast<uint16_t>(attr.value());

		auto result = actionItemMap.emplace(aid, std::move(*action));
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with aid:[%d] ", aid);
		}
		return result.second;
	} else if ((attr = node.attribute("fromaid"))) {
		pugi::xml_attribute toAidAttribute = node.attribute("toaid");
		if (!toAidAttribute) {
			LOG_F(WARNING, "Missing toaid in fromaid:[%s] ", attr.as_string());
			return false;
		}

		uint16_t fromAid = pugi::cast<uint16_t>(attr.value());
		uint16_t iterAid = fromAid;
		uint16_t toAid = pugi::cast<uint16_t>(toAidAttribute.value());

		auto result = actionItemMap.emplace(iterAid, *action);
		if (!result.second) {
			LOG_F(WARNING, "Duplicate registered item with aid:[%d] in "
						"fromaid:[%d], toaid[%d]!", iterAid, fromAid, toAid);
		}

		bool success = result.second;
		while (++iterAid <= toAid) {
			result = actionItemMap.emplace(iterAid, *action);
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with aid:[%d] in "
						"fromaid:[%d], toaid[%d]!", iterAid, fromAid, toAid);
				continue;
			}
			success = true;
		}
		return success;
	}
	return false;
}

bool Actions::registerLuaEvent(Action* event) {
	DLOG_F(INFO, "Register Lua Event");

	Action_ptr action{ event };
	if (action->getItemIdRange().size() > 0) {
		if (action->getItemIdRange().size() == 1) {
			auto result = useItemMap.emplace(action->getItemIdRange().at(0),
											std::move(*action));
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with id:[%d] ",
						action->getItemIdRange().at(0));
			}
			return result.second;
		} else {
			auto v = action->getItemIdRange();
			for (auto i = v.begin(); i != v.end(); i++) {
				auto result = useItemMap.emplace(*i, std::move(*action));
				if (!result.second) {
					LOG_F(WARNING, "Duplicate registered item with id:[%d] in "
							"range from id:[%d], to id[%d]!", *i, v.at(0),
							v.at(v.size() - 1));
					continue;
				}
			}
			return true;
		}
	} else if (action->getUniqueIdRange().size() > 0) {
		if (action->getUniqueIdRange().size() == 1) {
			auto result = uniqueItemMap.emplace(
						action->getUniqueIdRange().at(0), std::move(*action));
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with uid:[%d] ",
						action->getUniqueIdRange().at(0));
			}
			return result.second;
		} else {
			auto v = action->getUniqueIdRange();
			for (auto i = v.begin(); i != v.end(); i++) {
				auto result = uniqueItemMap.emplace(*i, std::move(*action));
				if (!result.second) {
					LOG_F(WARNING, "Duplicate registered item with uid:[%d] in "
							"range from uid:[%d], to uid[%d]!", *i, v.at(0),
							v.at(v.size() - 1));
					continue;
				}
			}
			return true;
		}
	} else if (action->getActionIdRange().size() > 0) {
		if (action->getActionIdRange().size() == 1) {
			auto result = actionItemMap.emplace(
						action->getActionIdRange().at(0), std::move(*action));
			if (!result.second) {
				LOG_F(WARNING, "Duplicate registered item with aid:[%d] ",
						action->getActionIdRange().at(0));
			}
			return result.second;
		} else {
			auto v = action->getActionIdRange();
			for (auto i = v.begin(); i != v.end(); i++) {
				auto result = actionItemMap.emplace(*i, std::move(*action));
				if (!result.second) {
					LOG_F(WARNING, "Duplicate registered item with aid:[%d] in "
							"range from aid:[%d], to aid[%d]!", *i, v.at(0),
							v.at(v.size() - 1));
					continue;
				}
			}
			return true;
		}
	} else {
		LOG_F(WARNING, "There is no id / aid / uid set for this event");
		return false;
	}
}

ReturnValue Actions::canUse(const Player* player, const Position& pos) {
	DLOG_F(INFO, "Player[%d] canUse from position:x[%d], y[%d], z[%d]?",
					player == nullptr ? 0 : player->getID(),
					pos.getX(), pos.getY(), pos.getZ());
	if (pos.x != 0xFFFF) {
		const Position& playerPos = player->getPosition();
		if (playerPos.z != pos.z) {
			DLOG_F(WARNING, "Player first needs to go [%s]",
				playerPos.z > pos.z ? "Upstairs" : "Downstairs");
			return playerPos.z > pos.z ?
					RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
		}

		if (!Position::areInRange<1, 1>(playerPos, pos)) {
			DLOG_F(WARNING, "Player is too far to use!");
			return RETURNVALUE_TOOFARAWAY;
		}
	}
	DLOG_F(WARNING, "Player can use!");
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUse(const Player* player, const Position& pos,
							const Item* item) {
	DLOG_F(INFO, "Player[%d] canUse cid[%d] from position:x[%d], y[%d], z[%d]?",
			player == nullptr ? 0 : player->getID(), item == nullptr ?
			0 : item->getClientID(), pos.getX(), pos.getY(), pos.getZ());
	Action* action = getAction(item);
	if (action != nullptr) {
		return action->canExecuteAction(player, pos);
	}
	DLOG_F(INFO, "Player can use!");
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUseFar(const Creature* creature, const Position& toPos,
								bool checkLineOfSight, bool checkFloor) {
	DLOG_F(INFO, "Creature[%d] canUseFar to position:x[%d], y[%d], z[%d],"
		"checkLineOfSight[%d], checkFloor[%d]", creature == nullptr ?
		0 : creature->getID(), toPos.getX(), toPos.getY(), toPos.getZ(),
		checkLineOfSight, checkFloor);

	if (toPos.x == 0xFFFF) {
		DLOG_F(INFO, "Creature can use far!");
		return RETURNVALUE_NOERROR;
	}

	const Position& creaturePos = creature->getPosition();
	if (checkFloor && creaturePos.z != toPos.z) {
		DLOG_F(WARNING, "Creature first needs to go [%s]",
				creaturePos.z > toPos.z ? "Upstairs" : "Downstairs");
		return creaturePos.z > toPos.z ?
					RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
	}

	if (!Position::areInRange<7, 5>(toPos, creaturePos)) {
		DLOG_F(WARNING, "Creature is too far to use!");
		return RETURNVALUE_TOOFARAWAY;
	}

	if (checkLineOfSight && !g_game.canThrowObjectTo(creaturePos, toPos)) {
		DLOG_F(WARNING, "Creature can throw!");
		return RETURNVALUE_CANNOTTHROW;
	}

	DLOG_F(INFO, "Creature can use far!");
	return RETURNVALUE_NOERROR;
}

Action* Actions::getAction(const Item* item) {
	DLOG_F(INFO, "Get Item cid:[%d] Action", item == nullptr ?
			0 : item->getClientID());

	if (item->hasAttribute(ITEM_ATTRIBUTE_UNIQUEID)) {
		DLOG_F(INFO, "Item has Attribute UniqueID");
		auto it = uniqueItemMap.find(item->getUniqueId());
		if (it != uniqueItemMap.end()) {
			return &it->second;
		}
	}

	if (item->hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) {
		DLOG_F(INFO, "Item has Attribute ActionID");
		auto it = actionItemMap.find(item->getActionId());
		if (it != actionItemMap.end()) {
			return &it->second;
		}
	}

	DLOG_F(INFO, "Regular Item");
	auto it = useItemMap.find(item->getID());
	if (it != useItemMap.end()) {
		return &it->second;
	}

	// rune items
	DLOG_F(INFO, "Item is a rune");
	return g_spells->getRuneSpell(item->getID());
}

ReturnValue Actions::internalUseItem(Player* player, const Position& pos,
									uint8_t index, Item* item, bool isHotkey) {
	DLOG_F(INFO, "Internal Use Item Player[%d], Position:x[%d], y[%d], z[%d], "
		"Index:[%d], Item cid:[%d], isHotkey:[%d]", player == nullptr ?
		0 : player->getID(), pos.getX(), pos.getY(), pos.getZ(), index,
		item == nullptr ? 0 : item->getClientID(), isHotkey);

	if (Door* door = item->getDoor()) {
		DLOG_F(INFO, "Door");
		if (!door->canUse(player)) {
			DLOG_F(WARNING, "Cannot use on this door!");
			return RETURNVALUE_CANNOTUSETHISOBJECT;
		}
	}

	Action* action = getAction(item);
	if (action != nullptr) {
		DLOG_F(INFO, "Action");
		if (action->isScripted()) {
			if (action->executeUse(player, item, pos, nullptr, pos, isHotkey)) {
				DLOG_F(INFO, "Player internalUseItem Success!");
				return RETURNVALUE_NOERROR;
			}

			if (item->isRemoved()) {
				DLOG_F(WARNING, "Cannot use on this object(action)!");
				return RETURNVALUE_CANNOTUSETHISOBJECT;
			}
		} else if (action->function) {
			if (action->function(player, item, pos, nullptr, pos, isHotkey)) {
				DLOG_F(INFO, "Player internalUseItem Success!");
				return RETURNVALUE_NOERROR;
			}
		}
	}

	if (BedItem* bed = item->getBed()) {
		if (!bed->canUse(player)) {
			DLOG_F(WARNING, "Cannot use on this object(Bed)!");
			return RETURNVALUE_CANNOTUSETHISOBJECT;
		}

		if (bed->trySleep(player)) {
			player->setBedItem(bed);
			g_game.sendOfflineTrainingDialog(player);
		}

		DLOG_F(INFO, "Player internalUseItem Success!");
		return RETURNVALUE_NOERROR;
	}

	if (Container* container = item->getContainer()) {
		DLOG_F(INFO, "Container");

		Container* openContainer;

		// depot container
		if (DepotLocker* depot = container->getDepotLocker()) {
			DLOG_F(INFO, "Depot Locker");
			DepotLocker* myDepotLocker = player->getDepotLocker(depot->getDepotId());
			myDepotLocker->setParent(depot->getParent()->getTile());
			openContainer = myDepotLocker;
			player->setLastDepotId(depot->getDepotId());
		} else {
			openContainer = container;
		}

		// reward chest
		if (container->getRewardChest() != nullptr) {
			DLOG_F(INFO, "Reward Chest");
			RewardChest* myRewardChest = player->getRewardChest();
			if (myRewardChest->size() == 0) {
				DLOG_F(WARNING, "Reward Chest is Empty");
				return RETURNVALUE_REWARDCHESTISEMPTY;
			}

			myRewardChest->setParent(container->getParent()->getTile());
			for (auto& it : player->rewardMap) {
				it.second->setParent(myRewardChest);
			}

			openContainer = myRewardChest;
		}

		// reward container proxy created when the boss dies
		if (container->getID() == ITEM_REWARD_CONTAINER
			&& !container->getReward()) {
			DLOG_F(INFO, "Reward Container Proxy(Boss)");
			if (Reward* reward = player->getReward(
						container->getIntAttr(ITEM_ATTRIBUTE_DATE), false)) {
				reward->setParent(container->getRealParent());
				openContainer = reward;
			} else {
				DLOG_F(WARNING, "This is impossible!");
				return RETURNVALUE_THISISIMPOSSIBLE;
			}
		}

		uint32_t corpseOwner = container->getCorpseOwner();
		if (container->isRewardCorpse()) {
			DLOG_F(INFO, "Corpse");

			// only players who participated in the fight can open the corpse
			if (player->getGroup()->id >= 4 || player->getAccountType() >= 3) {
				DLOG_F(WARNING, "You can't open corpse(ADM)");
				return RETURNVALUE_YOUCANTOPENCORPSEADM;
			}
			if (!player->getReward(container->getIntAttr(ITEM_ATTRIBUTE_DATE), false)) {
				DLOG_F(WARNING, "You aren't the owner!");
				return RETURNVALUE_YOUARENOTTHEOWNER;
			}
		} else if (corpseOwner != 0 && !player->canOpenCorpse(corpseOwner)) {
			DLOG_F(WARNING, "You aren't the owner!");
			return RETURNVALUE_YOUARENOTTHEOWNER;
		}

		// open/close container
		int32_t oldContainerId = player->getContainerID(openContainer);
		if (oldContainerId != -1) {
			DLOG_F(INFO, "Close Container");
			player->onCloseContainer(openContainer);
			player->closeContainer(oldContainerId);
		} else {
			DLOG_F(INFO, "Add Container");
			player->addContainer(index, openContainer);
			player->onSendContainer(openContainer);
		}
		DLOG_F(INFO, "Player internalUseItem Success!");
		return RETURNVALUE_NOERROR;
	}

	const ItemType& it = Item::items[item->getID()];
	if (it.canReadText) {
		if (it.canWriteText) {
			DLOG_F(INFO, "Can Read/Write Text");
			player->setWriteItem(item, it.maxTextLen);
			player->sendTextWindow(item, it.maxTextLen, true);
		} else {
			DLOG_F(INFO, "Can Read Text");
			player->setWriteItem(nullptr);
			player->sendTextWindow(item, 0, false);
		}
		DLOG_F(INFO, "Player internalUseItem Success!");
		return RETURNVALUE_NOERROR;
	}

	DLOG_F(WARNING, "Player can't use this object!");
	return RETURNVALUE_CANNOTUSETHISOBJECT;
}

bool Actions::useItem(Player* player, const Position& pos, uint8_t index,
						Item* item, bool isHotkey) {
	DLOG_F(INFO, "Use Item Player[%d], Position:x[%d], y[%d], z[%d], "
		"Index:[%d], Item cid:[%d], isHotkey:[%d]", player == nullptr ?
		0 : player->getID(), pos.getX(), pos.getY(), pos.getZ(), index,
		item == nullptr ? 0 : item->getClientID(), isHotkey);

	player->setNextAction(OTSYS_TIME() + g_config.getNumber(
										ConfigManager::ACTIONS_DELAY_INTERVAL));

	if (isHotkey) {
		showUseHotkeyMessage(player, item, player->getItemTypeCount(
															item->getID(), -1));
	}

	ReturnValue ret = internalUseItem(player, pos, index, item, isHotkey);
	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		DLOG_F(WARNING, "Player can't use item!");
		return false;
	}
	DLOG_F(INFO, "Success using item!");
	return true;
}

bool Actions::useItemEx(Player* player, const Position& fromPos,
						const Position& toPos, uint8_t toStackPos,
						Item* item, bool isHotkey,
						Creature* creature/* = nullptr*/) {
	DLOG_F(INFO, "Use Item Ex Player[%d], From Position:x[%d], y[%d], z[%d], "
		"To Position:x[%d], y[%d], z[%d], toStackPos[%d], Item cid:[%d], "
		"isHotkey:[%d]", player == nullptr ? 0 : player->getID(),
		fromPos.getX(), fromPos.getY(), fromPos.getZ(), toPos.getX(),
		toPos.getY(),	toPos.getZ(), toStackPos, item == nullptr ?
		0 : item->getClientID(), isHotkey);

	player->setNextAction(OTSYS_TIME() + g_config.getNumber(
									ConfigManager::EX_ACTIONS_DELAY_INTERVAL));

	Action* action = getAction(item);
	if (action == nullptr) {
		player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
		DLOG_F(WARNING, "Player can't use object(no action)!");
		return false;
	}

	ReturnValue ret = action->canExecuteAction(player, toPos);
	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		DLOG_F(WARNING, "Player can't use object(with action)!");
		return false;
	}

	if (isHotkey) {
		showUseHotkeyMessage(player, item,
							player->getItemTypeCount(item->getID(), -1));
	}

	if (action->function) {
		DLOG_F(INFO, "Action is a function");
		if (action->function(player, item, fromPos, action->getTarget(player,
							creature, toPos, toStackPos), toPos, isHotkey)) {
			DLOG_F(INFO, "Success executing function!");
			return true;
		}
		DLOG_F(WARNING, "Failed to execute function!");
		return false;
	}

	if (!action->executeUse(player, item, fromPos, action->getTarget(player,
							creature, toPos, toStackPos), toPos, isHotkey)) {
		if (!action->hasOwnErrorHandler()) {
			player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
		}
		DLOG_F(WARNING, "Player can't use object!");
		return false;
	}

	DLOG_F(INFO, "Success using item(ex)!");
	return true;
}

void Actions::showUseHotkeyMessage(Player* player, const Item* item,
									uint32_t count) {
	DLOG_F(INFO, "Show Use Hotkey Message.");
	std::ostringstream ss;

	const ItemType& it = Item::items[item->getID()];
	if (!it.showCount) {
		ss << "Using one of " << item->getName() << "...";
	} else if (count == 1) {
		ss << "Using the last " << item->getName() << "...";
	} else {
		ss << "Using one of " << count << ' ' << item->getPluralName() << "...";
	}
	player->sendTextMessage(MESSAGE_INFO_DESCR, ss.str());
}

bool Action::configureEvent(const pugi::xml_node& node) {
	DLOG_F(INFO, "Configure Event[%s]", node.name());
	pugi::xml_attribute allowFarUseAttr = node.attribute("allowfaruse");
	if (allowFarUseAttr != nullptr) {
		allowFarUse = allowFarUseAttr.as_bool();
		DLOG_F(INFO, "Event[%s]: Allow Far Use:[%d]", node.name(), allowFarUse);
	}

	pugi::xml_attribute blockWallsAttr = node.attribute("blockwalls");
	if (blockWallsAttr != nullptr) {
		checkLineOfSight = blockWallsAttr.as_bool();
		DLOG_F(INFO, "Event[%s]: Block Walls:[%d]", node.name(),
				checkLineOfSight);
	}

	pugi::xml_attribute checkFloorAttr = node.attribute("checkfloor");
	if (checkFloorAttr != nullptr) {
		checkFloor = checkFloorAttr.as_bool();
		DLOG_F(INFO, "Event[%s]: Check Floor:[%d]", node.name(), checkFloor);
	}

	DLOG_F(INFO, "Event[%s] configured with success!");
	return true;
}

namespace {

bool enterMarket(Player* player, Item* /*unused*/, const Position& /*unused*/,
			Thing* /*unused*/, const Position& /*unused*/, bool /*unused*/) {
	DLOG_F(INFO, "Player[%d] trying to enter market.", player == nullptr ?
			0 : player->getID());

	if (player->getLastDepotId() == -1) {
		DLOG_F(WARNING, "Player[%d] doesn't have depot!", player->getID());
		return false;
	}

	player->sendMarketEnter(player->getLastDepotId());
	DLOG_F(INFO, "enterMarket: Player[%d] Success!", player->getID());
	return true;
}

bool useImbueShrine(Player* player, Item* /*unused*/,
					const Position& /*unused*/, Thing* target,
					const Position& toPos, bool /*unused*/) {
	DLOG_F(INFO, "Use Imbue Shrine: Player[%d], Position: x[%d], y[%d], z[%d],",
		 	player == nullptr ? 0 : player->getID(), toPos.getX(),
			toPos.getY(), toPos.getZ());

	Item* item = target != nullptr ? target->getItem() : nullptr;
	if (item == nullptr) {
		player->sendTextMessage(MESSAGE_STATUS_SMALL,
								"This item is not imbuable.");
		DLOG_F(WARNING, "Thing is not an item!");
		return false;
	}

	const ItemType& it = Item::items[item->getID()];
	if (it.imbuingSlots <= 0) {
		player->sendTextMessage(MESSAGE_STATUS_SMALL,
								"This item is not imbuable.");
		DLOG_F(WARNING, "This item is not imbuable!");
		return false;
	}

	if (item->getTopParent() != player) {
		player->sendTextMessage(MESSAGE_STATUS_SMALL,
								"You have to pick up the item to imbue it.");
		DLOG_F(WARNING, "You have to pick up the item to imbue it!");
		return false;
	}

	if ((toPos.y & 0x40) == 0) {
		player->sendTextMessage(MESSAGE_STATUS_SMALL,
								"You cannot imbue an equipped item.");
		DLOG_F(WARNING, "You cannot imbue an equipped item!");
		return false;
	}

	DLOG_F(INFO, "Send Imbuement Windows.");
	player->sendImbuementWindow(target->getItem());

	DLOG_F(INFO, "useImbueShrine: Success!");
	return true;
}

}  // namespace

bool Action::loadFunction(const pugi::xml_attribute& attr, bool isScripted) {
	DLOG_F(INFO, "Load function[%s]", attr.as_string());

	const char* functionName = attr.as_string();
	if (strcasecmp(functionName, "market") == 0) {
		DLOG_F(INFO, "function: market");
		function = enterMarket;
	} else if (strcasecmp(functionName, "imbuement") == 0) {
		DLOG_F(INFO, "function: imbuement");
		function = useImbueShrine;
	} else {
		if (!isScripted) {
			LOG_F(WARNING, "Function[%s] does not exist!", functionName);
			return false;
		}
	}

	if (!isScripted) {
		DLOG_F(INFO, "Not scripted!");
		scripted = false;
	}

	DLOG_F(INFO, "loadFunction: Success!");
	return true;
}

std::string Action::getScriptEventName() const {
	DLOG_F(INFO, "Script Event Name: onUse");
	return "onUse";
}

ReturnValue Action::canExecuteAction(const Player* player,
									const Position& toPos) {
	DLOG_F(INFO, "Player[%d] can execute action position:x[%d], y[%d], z[%d]?",
			player == nullptr ? 0 : player->getID(), toPos.getX(), toPos.getY(),
			toPos.getZ());
	if (!allowFarUse) {
		return g_actions->canUse(player, toPos);
	}

	return g_actions->canUseFar(player, toPos, checkLineOfSight, checkFloor);
}

Thing* Action::getTarget(Player* player, Creature* targetCreature,
						const Position& toPosition, uint8_t toStackPos) const {
	DLOG_F(INFO, "getTarget:Player[%d], Target[%d], Position:x[%d], y[%d], "
		"z[%d], toStackPos[%d].", player == nullptr ? 0 : player->getID(),
		targetCreature == nullptr ? 0 : targetCreature->getID(),
		toPosition.getX(), toPosition.getY(), toPosition.getZ(), toStackPos);

	if (targetCreature != nullptr) {
		return targetCreature;
	}
	return g_game.internalGetThing(player, toPosition, toStackPos, 0,
									STACKPOS_USETARGET);
}

bool Action::executeUse(Player* player, Item* item,
						const Position& fromPosition, Thing* target,
						const Position& toPosition, bool isHotkey) {
	DLOG_F(INFO, "Use Item Ex Player[%d], From Position:x[%d], y[%d], z[%d], "
		"To Position:x[%d], y[%d], z[%d], toStackPos[%d], Item cid:[%d], "
		"isHotkey:[%d]", player == nullptr ? 0 : player->getID(),
		fromPosition.getX(), fromPosition.getY(), fromPosition.getZ(),
		toPosition.getX(), toPosition.getY(), toPosition.getZ(),
		item == nullptr ? 0 : item->getClientID(), isHotkey);

	// onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (!scriptInterface->reserveScriptEnv()) {
		LOG_F(WARNING, "Call stack overflow!");
		return false;
	}

	ScriptEnvironment* env = scriptInterface->getScriptEnv();
	env->setScriptId(scriptId, scriptInterface);

	lua_State* L = scriptInterface->getLuaState();

	scriptInterface->pushFunction(scriptId);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushThing(L, item);
	LuaScriptInterface::pushPosition(L, fromPosition);

	LuaScriptInterface::pushThing(L, target);
	LuaScriptInterface::pushPosition(L, toPosition);

	LuaScriptInterface::pushBoolean(L, isHotkey);

	DLOG_F(INFO, "Call lua function");
	return scriptInterface->callFunction(6);
}

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

#ifndef SRC_ACTIONS_H_
#define SRC_ACTIONS_H_

#include <map>
#include <memory>
#include <string>
#include <vector>

#include "baseevents.h"
#include "enums.h"
#include "luascript.h"

class Action;
using Action_ptr = std::unique_ptr<Action>;
using ActionFunction = std::function<bool(Player* player, Item* item,
									const Position& fromPosition, Thing* target,
									const Position& toPosition, bool isHotkey)>;

/**
 * @brief Action event class.
 *
 */
class Action : public Event {
 public:
	/**
	 * @brief Construct a new Action object
	 *
	 * @param interface
	 */
	explicit Action(LuaScriptInterface* interface);

	/**
	 * @brief Reads XML and set action attributes
	 *
	 * @param node XML node
	 * @return true
	 * @return false
	 */
	bool configureEvent(const pugi::xml_node& node) override;

	/**
	 * @brief Reads XML attribute 'function' (market or imbuement)
	 *
	 * @param attr XML Attribute
	 * @param isScripted True if it has a script
	 * @return true
	 * @return false
	 */
	bool loadFunction(const pugi::xml_attribute& attr, bool isScripted) override;

	// scripting

	/**
	 * @brief Set parameters and call script 'lua function'
	 *
	 * @param player
	 * @param item
	 * @param fromPosition
	 * @param target
	 * @param toPosition
	 * @param isHotkey
	 * @return true Success
	 * @return false Fail
	 */
	virtual bool executeUse(Player* player, Item* item,
							const Position& fromPosition, Thing* target,
							const Position& toPosition, bool isHotkey);

	/**
	 * @brief Get the Allow Far Use object
	 *
	 * @return true
	 * @return false
	 */
	bool getAllowFarUse() const {
		return allowFarUse;
	}

	/**
	 * @brief Set the Allow Far Use object
	 *
	 * @param allow true if allowed otherwise false
	 */
	void setAllowFarUse(bool allow) {
		allowFarUse = allow;
	}

	/**
	 * @brief Get the Check Line Of Sight state
	 *
	 * @return true
	 * @return false
	 */
	bool getCheckLineOfSight() const {
		return checkLineOfSight;
	}
	/**
	 * @brief Set the Check Line Of Sight state
	 *
	 * @param state true if needs to check line of sight otherwise false
	 */
	void setCheckLineOfSight(bool state) {
		checkLineOfSight = state;
	}

	/**
	 * @brief Get the Check Floor state
	 *
	 * @return true
	 * @return false
	 */
	bool getCheckFloor() const {
		return checkFloor;
	}

	/**
	 * @brief Set the Check Floor state
	 *
	 * @param state
	 */
	void setCheckFloor(bool state) {
		checkFloor = state;
	}

	/**
	 * @brief Get the Item Id Range vector
	 *
	 * @return std::vector<uint16_t> ID's
	 */
	std::vector<uint16_t> getItemIdRange() {
		return ids;
	}
	/**
	 * @brief Add item id to the vector
	 *
	 * @param id
	 */
	void addItemId(uint16_t id) {
		ids.emplace_back(id);
	}

	/**
	 * @brief Get the Unique Id Range vector
	 *
	 * @return std::vector<uint16_t> UID's
	 */
	std::vector<uint16_t> getUniqueIdRange() {
		return uids;
	}

	/**
	 * @brief Add unique id to the vector
	 *
	 * @param id Unique ID
	 */
	void addUniqueId(uint16_t id) {
		uids.emplace_back(id);
	}

	/**
	 * @brief Get the Action Id Range vector
	 *
	 * @return std::vector<uint16_t>
	 */
	std::vector<uint16_t> getActionIdRange() {
		return aids;
	}

	/**
	 * @brief Add AID to the vector
	 *
	 * @param id
	 */
	void addActionId(uint16_t id) {
		aids.emplace_back(id);
	}

	/**
	 * @brief Check if action can be executed from far or not and call the
	 * apropiate method to handle it.
	 *
	 * @param player
	 * @param toPos
	 * @return ReturnValue
	 */
	virtual ReturnValue canExecuteAction(const Player* player,
										const Position& toPos);
	/**
	 * @brief If the action has its own error handler to be called.
	 *
	 * @return true
	 * @return false
	 */
	virtual bool hasOwnErrorHandler() {
		return false;
	}

	/**
	 * @brief Get the Target object, if it is a creature it returns, otherwise
	 * it calls internalGetThing()
	 *
	 * @param player
	 * @param targetCreature
	 * @param toPosition
	 * @param toStackPos
	 * @return Thing*
	 */
	virtual Thing* getTarget(Player* player, Creature* targetCreature,
					const Position& toPosition, uint8_t toStackPos) const;

	/**ActionFunction = std::function<bool(Player* player, Item* item,
	 *							const Position& fromPosition, Thing* target,
	 *							const Position& toPosition, bool isHotkey)>;
	**/
	ActionFunction function;

 private:
	/**
	 * @brief Get the Script Event Name object
	 *
	 * @return std::string Default to 'onUse'
	 */
	std::string getScriptEventName() const override;

	// Atributes
	bool allowFarUse = false;
	bool checkFloor = true;
	bool checkLineOfSight = true;

	// IDs
	std::vector<uint16_t> ids;
	std::vector<uint16_t> uids;
	std::vector<uint16_t> aids;
};

/**
 * @brief Action BaseEvents class.
 *
 */
class Actions final : public BaseEvents {
 public:
	/**
	 * @brief Construct a new Actions object
	 *
	 */
	Actions();

	/**
	 * @brief Destroy the Actions object
	 *
	 */
	~Actions();

	// non-copyable
	Actions(const Actions&) = delete;
	Actions& operator=(const Actions&) = delete;

	/**
	 * @brief Handles the use of item using mouse and hotkey
	 *
	 * @param player
	 * @param pos
	 * @param index
	 * @param item
	 * @param isHotkey
	 * @return true
	 * @return false
	 */
	bool useItem(Player* player, const Position& pos, uint8_t index,
				Item* item, bool isHotkey);

	/**
	 * @brief Execute item action/function
	 *
	 * @param player
	 * @param fromPos
	 * @param toPos
	 * @param toStackPos
	 * @param item
	 * @param isHotkey
	 * @param creature
	 * @return true
	 * @return false
	 */
	bool useItemEx(Player* player, const Position& fromPos,
					const Position& toPos, uint8_t toStackPos, Item* item,
					bool isHotkey, Creature* creature = nullptr);

	/**
	 * @brief Check if player can use item from his current position
	 *
	 * @param player
	 * @param pos
	 * @return ReturnValue
	 */
	ReturnValue canUse(const Player* player, const Position& pos);

	/**
	 * @brief Check if player can use item action from his current position
	 *
	 * @param player
	 * @param pos
	 * @param item
	 * @return ReturnValue
	 */
	ReturnValue canUse(const Player* player, const Position& pos,
						const Item* item);

	/**
	 * @brief Check if player can use or throw item far from him
	 *
	 * @param creature
	 * @param toPos
	 * @param checkLineOfSight
	 * @param checkFloor
	 * @return ReturnValue
	 */
	ReturnValue canUseFar(const Creature* creature, const Position& toPos,
							bool checkLineOfSight, bool checkFloor);

	/**
	 * @brief Register lua event
	 *
	 * @param event
	 * @return true
	 * @return false
	 */
	bool registerLuaEvent(Action* event);

	/**
	 * @brief Clear use|unique|action items from map, (optional) restart lua
	 * state.
	 *
	 * @param fromLua
	 */
	void clear(bool fromLua) final;

 private:
	ReturnValue internalUseItem(Player* player, const Position& pos,
								uint8_t index, Item* item, bool isHotkey);
	static void showUseHotkeyMessage(Player* player, const Item* item,
									uint32_t count);

	LuaScriptInterface& getScriptInterface() override;
	std::string getScriptBaseName() const override;
	Event_ptr getEvent(const std::string& nodeName) override;
	bool registerEvent(Event_ptr event, const pugi::xml_node& node) override;

	using ActionUseMap = std::map<uint16_t, Action>;
	ActionUseMap useItemMap;
	ActionUseMap uniqueItemMap;
	ActionUseMap actionItemMap;

	Action* getAction(const Item* item);
	void clearMap(ActionUseMap* map, bool fromLua);

	LuaScriptInterface scriptInterface;
};

#endif  // SRC_ACTIONS_H_

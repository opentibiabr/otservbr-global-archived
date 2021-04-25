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

#ifndef FS_NPCS_H_
#define FS_NPCS_H_

#include "../creature.h"

class NpcType
{
	struct NpcInfo {
		LuaScriptInterface* scriptInterface;

		Outfit_t outfit = {};
		RespawnType respawnType = {};

		LightInfo light = {};

		uint8_t speechBubble;

		uint16_t currencyServerId = ITEM_GOLD_COIN;

		uint32_t yellChance = 0;
		uint32_t yellSpeedTicks = 0;
		uint32_t baseSpeed = 200;
		uint32_t walkInterval = 1500;

		int32_t creatureAppearEvent = -1;
		int32_t creatureDisappearEvent = -1;
		int32_t creatureMoveEvent = -1;
		int32_t creatureSayEvent = -1;
		int32_t thinkEvent = -1;
		int32_t playerBuyEvent = -1;
		int32_t playerSellEvent = -1;
		int32_t playerLookEvent = -1;

		int32_t health = 100;
		int32_t healthMax = 100;

		int32_t walkRadius = 10;

		bool canPushItems = false;
		bool canPushCreatures = false;
		bool pushable = false;
		bool floorChange = false;

		std::vector<voiceBlock_t> voiceVector;
		std::vector<std::string> scripts;
		ShopInfoMap shopItems;

		NpcsEvent_t eventType = NPCS_EVENT_NONE;
	};

	public:
		NpcType() = default;
		NpcType(std::string name) : name(name), nameDescription(name) {};

		// non-copyable
		NpcType(const NpcType&) = delete;
		NpcType& operator=(const NpcType&) = delete;

		std::string name;
		std::string nameDescription;
		NpcInfo info;

		void addShopItem(uint16_t serverId, ShopInfo &item) {
			info.shopItems[serverId] = item;
		}

		bool loadCallback(LuaScriptInterface* scriptInterface);
		bool canSpawn(const Position& pos);
};

class Npcs
{
	public:
		Npcs() = default;
		// non-copyable
		Npcs(const Npcs&) = delete;
		Npcs& operator=(const Npcs&) = delete;

		NpcType* getNpcType(const std::string& name, bool create = false);
		void reset() {
			npcs.clear();
			scriptInterface.reset();
		};

		std::unique_ptr<LuaScriptInterface> scriptInterface;
		std::map<std::string, NpcType*> npcs;
};

#endif

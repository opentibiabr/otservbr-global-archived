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

#include "creature.h"

class LootNpc {
	public:
		LootNpc() = default;

		// non-copyable
		LootNpc(const LootNpc&) = delete;
		LootNpc& operator=(const LootNpc&) = delete;

		LootBlock lootBlock;
};

class BaseSpell;
struct spellBlockNpc_t {
	constexpr spellBlockNpc_t() = default;
	~spellBlockNpc_t();
	spellBlockNpc_t(const spellBlockNpc_t& other) = delete;
	spellBlockNpc_t& operator=(const spellBlockNpc_t& other) = delete;
	spellBlockNpc_t(spellBlockNpc_t&& other) :
		spell(other.spell),
		chance(other.chance),
		speed(other.speed),
		range(other.range),
		minCombatValue(other.minCombatValue),
		maxCombatValue(other.maxCombatValue),
		combatSpell(other.combatSpell),
		isMelee(other.isMelee) {
		other.spell = nullptr;
	}

	BaseSpell* spell = nullptr;
	uint32_t chance = 100;
	uint32_t speed = 2000;
	uint32_t range = 0;
	int32_t minCombatValue = 0;
	int32_t maxCombatValue = 0;
	bool combatSpell = false;
	bool isMelee = false;
};

class NpcType
{
	struct NpcInfo {
		LuaScriptInterface* scriptInterface;

		std::map<CombatType_t, int32_t> elementMap;
		std::map<CombatType_t, int32_t> reflectMap;
		std::map<CombatType_t, int32_t> healingMap;

		std::vector<voiceBlock_t> voiceVector;

		std::vector<LootBlock> lootItems;
		std::vector<std::string> scripts;
		std::vector<spellBlockNpc_t> attackSpells;
		std::vector<spellBlockNpc_t> defenseSpells;
		std::vector<summonBlock_t> summons;

		Skulls_t skull = SKULL_NONE;
		Outfit_t outfit = {};
		RaceType_t race = RACE_BLOOD;
		RespawnType respawnType = {};

		LightInfo light = {};
		uint16_t lookcorpse = 0;

		uint64_t experience = 0;

		uint32_t manaCost = 0;
		uint32_t yellChance = 0;
		uint32_t yellSpeedTicks = 0;
		uint32_t staticAttackChance = 95;
		uint32_t maxSummons = 0;
		uint32_t changeTargetSpeed = 0;
		uint32_t conditionImmunities = 0;
		uint32_t damageImmunities = 0;
		uint32_t baseSpeed = 200;
		uint32_t walkInterval = 1500;

		int32_t creatureAppearEvent = -1;
		int32_t creatureDisappearEvent = -1;
		int32_t creatureMoveEvent = -1;
		int32_t creatureSayEvent = -1;
		int32_t thinkEvent = -1;
		int32_t targetDistance = 1;
		int32_t runAwayHealth = 0;
		int32_t health = 100;
		int32_t healthMax = 100;
		int32_t changeTargetChance = 0;
		int32_t defense = 0;
		int32_t armor = 0;
		int32_t targetStrategiesNearestPercent = 0;
		int32_t targetStrategiesLowerHPPercent = 0;
		int32_t targetStrategiesMostDamagePercent = 0;
		int32_t targetStrategiesRandom = 0;
		int32_t walkRadius = 10;

		bool canPushItems = false;
		bool canPushCreatures = false;
		bool pushable = true;
		bool isSummonable = false;
		bool isIllusionable = false;
		bool isConvinceable = false;
		bool isAttackable = true;
		bool isHostile = true;
		bool hiddenHealth = false;
		bool isBlockable = false;
		bool isRewardBoss = false;
		bool canWalkOnEnergy = true;
		bool canWalkOnFire = true;
		bool canWalkOnPoison = true;

		NpcsEvent_t eventType = NPCS_EVENT_NONE;
	};

	public:
		NpcType() = default;

		// non-copyable
		NpcType(const NpcType&) = delete;
		NpcType& operator=(const NpcType&) = delete;

		bool loadCallback(LuaScriptInterface* scriptInterface);

		std::string name;
		std::string nameDescription;

		NpcInfo info;

		void loadLoot(NpcType* npcType, LootBlock lootblock);

		bool canSpawn(const Position& pos);
};

class NpcSpell
{
	public:
		NpcSpell() = default;

		NpcSpell(const NpcSpell&) = delete;
		NpcSpell& operator=(const NpcSpell&) = delete;

		std::string name = "";
		std::string scriptName = "";

		uint8_t chance = 100;
		uint8_t range = 0;

		uint16_t interval = 2000;

		int32_t minCombatValue = 0;
		int32_t maxCombatValue = 0;
		int32_t attack = 0;
		int32_t skill = 0;
		int32_t length = 0;
		int32_t spread = 0;
		int32_t radius = 0;
		int32_t conditionMinDamage = 0;
		int32_t conditionMaxDamage = 0;
		int32_t conditionStartDamage = 0;
		int32_t tickInterval = 0;
		int32_t speedChange = 0;
		int32_t duration = 0;

		bool isScripted = false;
		bool needTarget = false;
		bool needDirection = false;
		bool combatSpell = false;
		bool isMelee = false;

		Outfit_t outfit = {};
		std::string outfitNpc = "";
		uint16_t outfitItem = 0;

		ShootType_t shoot = CONST_ANI_NONE;
		MagicEffectClasses effect = CONST_ME_NONE;
		ConditionType_t conditionType = CONDITION_NONE;
		CombatType_t combatType = COMBAT_UNDEFINEDDAMAGE;
};

class Npcs
{
	public:
		Npcs() = default;
		// non-copyable
		Npcs(const Npcs&) = delete;
		Npcs& operator=(const Npcs&) = delete;

		bool loadFromXml(bool reloading = false);
		bool isLoaded() const {
			return loaded;
		}
		bool reload();

		NpcType* getNpcType(const std::string& name);
		void addNpcType(const std::string& name, NpcType* mType);
		bool deserializeSpell(NpcSpell* spell, spellBlockNpc_t& sb, const std::string& description = "");

		std::unique_ptr<LuaScriptInterface> scriptInterface;
		std::map<std::string, NpcType> npcs;

	private:
		ConditionDamage* getDamageCondition(ConditionType_t conditionType,
											int32_t maxDamage, int32_t minDamage, int32_t startDamage, uint32_t tickInterval);
		bool deserializeSpell(const pugi::xml_node& node, spellBlockNpc_t& sb, const std::string& description = "");

		NpcType* loadNpc(const std::string& file, const std::string& npcName, bool reloading = false);

		void loadLootContainer(const pugi::xml_node& node, LootBlock&);
		bool loadLootItem(const pugi::xml_node& node, LootBlock&);

		std::map<std::string, std::string> unloadedNpcs;

		bool loaded = false;
};

#endif

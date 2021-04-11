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

#ifndef FS_NPC_H_9F5EEFE64314418CA7DA41D1B9409DD0
#define FS_NPC_H_9F5EEFE64314418CA7DA41D1B9409DD0

#include "tile.h"
#include "npcs.h"
#include "enums.h"

class Creature;
class Game;
class SpawnNpc;

using CreatureHashSet = std::unordered_set<Creature*>;
using CreatureList = std::list<Creature*>;

class Npc final : public Creature
{
	public:
		static Npc* createNpc(const std::string& name);
		static int32_t despawnRange;
		static int32_t despawnRadius;

		explicit Npc(NpcType* npcType);
		~Npc();

		// non-copyable
		Npc(const Npc&) = delete;
		Npc& operator=(const Npc&) = delete;

		Npc* getNpc() override {
			return this;
		}
		const Npc* getNpc() const override {
			return this;
		}

		void setID() override {
			if (id == 0) {
				id = npcAutoID++;
			}
		}

		void removeList() override;
		void addList() override;

		const std::string& getName() const override {
			return npcType->name;
		}
		const std::string& getNameDescription() const override {
			return npcType->nameDescription;
		}
		std::string getDescription(int32_t) const override {
			return strDescription + '.';
		}

		CreatureType_t getType() const override {
			return CREATURETYPE_NPC;
		}

		int32_t getMasterRadius() const {
			return masterRadius;
		}
		const Position& getMasterPos() const {
			return masterPos;
		}
		void setMasterPos(Position pos, int32_t radius = 1) {
			masterPos = pos;
			if (masterRadius == -1) {
				masterRadius = radius;
			}
		}

		RaceType_t getRace() const override {
			return npcType->info.race;
		}
		int32_t getArmor() const override {
			return npcType->info.armor;
		}
		int32_t getDefense() const override {
			return npcType->info.defense;
		}

		bool isPushable() const override {
			return npcType->info.pushable && baseSpeed != 0;
		}
		bool isAttackable() const override {
			return npcType->info.isAttackable;
		}
		bool canPushItems() const {
			return npcType->info.canPushItems;
		}
		bool canPushCreatures() const {
			return npcType->info.canPushCreatures;
		}
		bool isHostile() const {
			return npcType->info.isHostile;
		}
		bool canSee(const Position& pos) const override;
		bool canSeeInvisibility() const override {
			return isImmune(CONDITION_INVISIBLE);
		}
		uint32_t getManaCost() const {
			return npcType->info.manaCost;
		}
		RespawnType getRespawnType() const {
			return npcType->info.respawnType;
		}
		void setSpawnNpc(SpawnNpc* newSpawn) {
			this->spawnNpc = newSpawn;
		}

		uint32_t getReflectValue(CombatType_t combatType) const;
		uint32_t getHealingCombatValue(CombatType_t healingType) const;

		void addPlayerInteraction(uint32_t playerId);
		void removePlayerInteraction(uint32_t playerId) {
			playerInteractions.erase(std::remove(playerInteractions.begin(), playerInteractions.end(), playerId), playerInteractions.end());
		}
		bool isInteractingWithPlayer(uint32_t playerId) {
			return std::find(playerInteractions.begin(), playerInteractions.end(), playerId) != playerInteractions.end();
		}

		void addTopic(uint32_t playerId, uint32_t topicId) {
			topicMessage.push_back(playerId);
			topicMessage.push_back(topicId);
		}
		void removeTopic(uint32_t playerId, uint32_t topicId) {
			topicMessage.erase(std::remove(topicMessage.begin(), topicMessage.end(), playerId), topicMessage.end());
			topicMessage.erase(std::remove(topicMessage.begin(), topicMessage.end(), topicId), topicMessage.end());
		}
		bool getTopic(uint32_t playerId, uint32_t topicId) {
			return std::find(topicMessage.begin(), topicMessage.end(), playerId) != topicMessage.end();
			return std::find(topicMessage.begin(), topicMessage.end(), topicId) != topicMessage.end();
		}

		bool canWalkOnFieldType(CombatType_t combatType) const;
		void onAttackedCreatureDisappear(bool isLogout) override;

		void onCreatureAppear(Creature* creature, bool isLogin) override;
		void onRemoveCreature(Creature* creature, bool isLogout) override;
		void onCreatureMove(Creature* creature, const Tile* newTile, const Position& newPos, const Tile* oldTile, const Position& oldPos, bool teleport) override;
		void onCreatureSay(Creature* creature, SpeakClasses type, const std::string& text) override;

		void drainHealth(Creature* attacker, int32_t damage) override;
		void changeHealth(int32_t healthChange, bool sendHealthChange = true) override;
		void onCreatureWalk() override;
		bool getNextStep(Direction& direction, uint32_t& flags) override;
		void onFollowCreatureComplete(const Creature* creature) override;

		void onThink(uint32_t interval) override;

		bool challengeCreature(Creature* creature) override;

		bool changeTargetDistance(int32_t distance);

		CreatureIcon_t getIcon() const override {
			if (challengeMeleeDuration > 0 && npcType->info.targetDistance > targetDistance)
				return CREATUREICON_TURNEDMELEE;
			else if (varBuffs[BUFF_DAMAGERECEIVED] > 100)
				return CREATUREICON_HIGHERRECEIVEDDAMAGE;
			else if (varBuffs[BUFF_DAMAGEDEALT] < 100)
				return CREATUREICON_LOWERDEALTDAMAGE;
			else
				return CREATUREICON_NONE;
		}

		void setNormalCreatureLight() override;
		bool getCombatValues(int32_t& min, int32_t& max) override;

		void doAttacking(uint32_t interval) override;
		bool hasExtraSwing() override {
			return extraMeleeAttack;
		}

		bool searchTarget(TargetSearchType_t searchType = TARGETSEARCH_DEFAULT);
		bool selectTarget(Creature* creature);

		const CreatureList& getTargetList() const {
			return targetList;
		}
		const CreatureHashSet& getFriendList() const {
			return friendList;
		}

		bool isTarget(const Creature* creature) const;
		bool isFleeing() const {
			return !isSummon() && getHealth() <= npcType->info.runAwayHealth && challengeFocusDuration <= 0;
		}

		bool getDistanceStep(const Position& targetPos, Direction& direction, bool flee = false);
		bool isTargetNearby() const {
			return stepDuration >= 1;
		}
		bool isIgnoringFieldDamage() const {
			return ignoreFieldDamage;
		}
		bool israndomStepping() const {
			return randomStepping;
		}
		void setIgnoreFieldDamage(bool ignore) {
			ignoreFieldDamage = ignore;
		}
		bool getIgnoreFieldDamage() const {
			return ignoreFieldDamage;
		}

		void turnToCreature(Creature* creature);
		void validateCurrentFocus();

		BlockType_t blockHit(Creature* attacker, CombatType_t combatType, int32_t& damage,
							 bool checkDefense = false, bool checkArmor = false, bool field = false) override;

		static uint32_t npcAutoID;

	private:
		CreatureHashSet friendList;
		CreatureList targetList;

		std::string strDescription;

		std::vector<uint32_t> playerInteractions;
		std::vector<uint32_t> topicMessage;

		NpcType* npcType;
		SpawnNpc* spawnNpc = nullptr;

		int64_t lastMeleeAttack = 0;

		uint32_t attackTicks = 0;
		uint32_t targetTicks = 0;
		uint32_t targetChangeTicks = 0;
		uint32_t defenseTicks = 0;
		uint32_t yellTicks = 0;
		int32_t minCombatValue = 0;
		int32_t maxCombatValue = 0;
		int32_t targetChangeCooldown = 0;
		int32_t challengeFocusDuration = 0;
		int32_t stepDuration = 0;
		int32_t targetDistance = 1;
		int32_t challengeMeleeDuration = 0;
		int32_t masterRadius;

		Position masterPos;

		bool isIdle = true;
		bool extraMeleeAttack = false;
		bool isMasterInRange = false;
		bool randomStepping = false;
		bool ignoreFieldDamage = false;

		void onCreatureEnter(Creature* creature);
		void onCreatureLeave(Creature* creature);
		void onCreatureFound(Creature* creature, bool pushFront = false);

		void updateLookDirection();

		void addFriend(Creature* creature);
		void removeFriend(Creature* creature);
		void addTarget(Creature* creature, bool pushFront = false);
		void removeTarget(Creature* creature);

		void updateTargetList();
		void clearTargetList();
		void clearFriendList();

		void death(Creature* lastHitCreature) override;
		Item* getCorpse(Creature* lastHitCreature, Creature* mostDamageCreature) override;

		void setIdle(bool idle);
		void updateIdleStatus();
		bool getIdleStatus() const {
			return isIdle;
		}

		void onAddCondition(ConditionType_t type) override;
		void onEndCondition(ConditionType_t type) override;

		bool canUseAttack(const Position& pos, const Creature* target) const;
		bool canUseSpell(const Position& pos, const Position& targetPos,
						 const spellBlockNpc_t& sb, uint32_t interval, bool& inRange, bool& resetTicks);
		bool getRandomStep(const Position& creaturePos, Direction& direction) const;
		bool getDanceStep(const Position& creaturePos, Direction& direction,
						  bool keepAttack = true, bool keepDistance = true);
		bool isInSpawnRange(const Position& pos) const;
		bool canWalkTo(Position pos, Direction direction) const;

		static bool pushItem(Item* item);
		static void pushItems(Tile* tile);
		static bool pushCreature(Creature* creature);
		static void pushCreatures(Tile* tile);

		void onThinkTarget(uint32_t interval);
		void onThinkYell(uint32_t interval);
		void onThinkDefense(uint32_t interval);

		bool isFriend(const Creature* creature) const;
		bool isOpponent(const Creature* creature) const;

		uint64_t getLostExperience() const override {
			return skillLoss ? npcType->info.experience : 0;
		}
		uint16_t getLookCorpse() const override {
			return npcType->info.lookcorpse;
		}
		void dropLoot(Container* corpse, Creature* lastHitCreature) override;
		uint32_t getDamageImmunities() const override {
			return npcType->info.damageImmunities;
		}
		uint32_t getConditionImmunities() const override {
			return npcType->info.conditionImmunities;
		}
		void getPathSearchParams(const Creature* creature, FindPathParams& fpp) const override;
		bool useCacheMap() const override {
			return !randomStepping;
		}

		friend class LuaScriptInterface;
		friend class Map;
};

#endif

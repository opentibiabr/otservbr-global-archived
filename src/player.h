/**
 * @file player.h
 * 
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019 Mark Samman <mark.samman@gmail.com>
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

#ifndef OT_SRC_PLAYER_H_
#define OT_SRC_PLAYER_H_

#include "creature.h"
#include "container.h"
#include "cylinder.h"
#include "outfit.h"
#include "enums.h"
#include "vocation.h"
#include "protocolgame.h"
#include "ioguild.h"
#include "party.h"
#include "inbox.h"
#include "depotchest.h"
#include "depotlocker.h"
#include "guild.h"
#include "groups.h"
#include "town.h"
#include "mounts.h"
#include "reward.h"
#include "rewardchest.h"
#include "gamestore.h"
#include "imbuements.h"

class House;
class NetworkMessage;
class Weapon;
class ProtocolGame;
class Npc;
class Party;
class SchedulerTask;
class Bed;
class Guild;
class Imbuement;

enum skillsid_t {
	SKILLVALUE_LEVEL = 0,
	SKILLVALUE_TRIES = 1,
	SKILLVALUE_PERCENT = 2,
};

enum fightMode_t : uint8_t {
	FIGHTMODE_ATTACK = 1,
	FIGHTMODE_BALANCED = 2,
	FIGHTMODE_DEFENSE = 3,
};

enum pvpMode_t : uint8_t {
	PVP_MODE_DOVE = 0,
	PVP_MODE_WHITE_HAND = 1,
	PVP_MODE_YELLOW_HAND = 2,
	PVP_MODE_RED_FIST = 3,
};

enum tradestate_t : uint8_t {
	TRADE_NONE,
	TRADE_INITIATED,
	TRADE_ACCEPT,
	TRADE_ACKNOWLEDGE,
	TRADE_TRANSFER,
};

struct VIPEntry {
	VIPEntry(uint32_t initGuid, std::string initName, std::string initDescription, uint32_t initIcon, bool initNotify) :
		guid(initGuid), name(std::move(initName)), description(std::move(initDescription)), icon(initIcon), notify(initNotify) {}

	uint32_t guid;
	std::string name;
	std::string description;
	uint32_t icon;
	bool notify;
};

struct OpenContainer {
	Container* container;
	uint16_t index;
};

struct OutfitEntry {
	constexpr OutfitEntry(uint16_t initLookType, uint8_t initAddons) : lookType(initLookType), addons(initAddons) {}

	uint16_t lookType;
	uint8_t addons;
};

struct Skill {
	uint64_t tries = 0;
	uint16_t level = 10;
	uint8_t percent = 0;
};

struct Kill {
	uint32_t target;
	time_t time;
	bool unavenged;

	Kill(uint32_t _target, time_t _time, bool _unavenged) : target(_target), time(_time), unavenged(_unavenged) {}
};

using MuteCountMap = std::map<uint32_t, uint32_t>;

static constexpr int32_t PLAYER_MAX_SPEED = 4500;
static constexpr int32_t PLAYER_MIN_SPEED = 10;

class Player final : public Creature, public Cylinder
{
	public:
		explicit Player(ProtocolGame_ptr p);
		~Player();

		// non-copyable
		Player(const Player&) = delete;
		Player& operator=(const Player&) = delete;

		Player* getPlayer() final {
			return this;
		}
		const Player* getPlayer() const final {
			return this;
		}

		void setID() final {
			if (id == 0) {
				id = playerAutoID++;
			}
		}

		static MuteCountMap muteCountMap;

		const std::string& getName() const final {
			return name;
		}
		void setName(std::string newName) {
			this->name = std::move(newName);
		}
		const std::string& getNameDescription() const final {
			return name;
		}
		std::string getDescription(int32_t lookDistance) const final;

		CreatureType_t getType() const final {
			return CREATURETYPE_PLAYER;
		}

		uint8_t getCurrentMount() const;
		void setCurrentMount(uint8_t mountId);
		bool isMounted() const {
			return defaultOutfit.lookMount != 0;
		}
		bool toggleMount(bool mount);
		bool tameMount(uint8_t mountId);
		bool untameMount(uint8_t mountId);
		bool hasMount(const Mount* mount) const;
		void dismount();

		void sendFYIBox(const std::string& message) {
			if (client) {
				client->sendFYIBox(message);
			}
		}

		void setGUID(uint32_t newGuid) {
			this->guid = newGuid;
		}
		uint32_t getGUID() const {
			return guid;
		}
		bool canSeeInvisibility() const final {
			return hasFlag(PlayerFlag_CanSenseInvisibility) || group->access;
		}

		void removeList() final;
		void addList() final;
		void kickPlayer(bool displayEffect);

		static uint64_t getExpForLevel(int32_t lv) {
			lv--;
			return ((50ULL * lv * lv * lv) - (150ULL * lv * lv) + (400ULL * lv)) / 3ULL;
		}

		uint16_t getStaminaMinutes() const {
			return staminaMinutes;
		}
		
		// New Prey
		uint16_t getPreyState(uint16_t slot) const {
			return preySlotState[slot];
		}

		uint16_t getPreyUnlocked(uint16_t slot) const {
			return preySlotUnlocked[slot];
		}

		std::string getPreyCurrentMonster(uint16_t slot) const {
			return preySlotCurrentMonster[slot];
		}

		std::string getPreyMonsterList(uint16_t slot) const {
			return preySlotMonsterList[slot];
		}

		uint16_t getPreyFreeRerollIn(uint16_t slot) const {
			return preySlotFreeRerollIn[slot];
		}

		uint16_t getPreyTimeLeft(uint16_t slot) const {
			return preySlotTimeLeft[slot];
		}

		uint32_t getPreyNextUse(uint16_t slot) const {
			return preySlotNextUse[slot];
		}

		uint16_t getPreyBonusType(uint16_t slot) const {
			return preySlotBonusType[slot];
		}

		uint16_t getPreyBonusValue(uint16_t slot) const {
			return preySlotBonusValue[slot];
		}

		uint16_t getPreyBonusGrade(uint16_t slot) const {
			return preySlotBonusGrade[slot];
		}
		uint16_t getPreyBonusRerolls() const {
			return preyBonusRerolls;
		}
		//

		uint16_t getPreyStamina(uint16_t index) const {
			return preyStaminaMinutes[index];
		}
		uint16_t getPreyType(uint16_t index) const {
			return preyBonusType[index];
		}
		uint16_t getPreyValue(uint16_t index) const {
			return preyBonusValue[index];
		}
		std::string getPreyName(uint16_t index) const {
			return preyBonusName[index];
		}

		bool addOfflineTrainingTries(skills_t skill, uint64_t tries);

		void addOfflineTrainingTime(int32_t addTime) {
			offlineTrainingTime = std::min<int32_t>(12 * 3600 * 1000, offlineTrainingTime + addTime);
		}
		void removeOfflineTrainingTime(int32_t removeTime) {
			offlineTrainingTime = std::max<int32_t>(0, offlineTrainingTime - removeTime);
		}
		int32_t getOfflineTrainingTime() const {
			return offlineTrainingTime;
		}

		int32_t getOfflineTrainingSkill() const {
			return offlineTrainingSkill;
		}
		void setOfflineTrainingSkill(int32_t skill) {
			offlineTrainingSkill = skill;
		}

		uint64_t getBankBalance() const {
			return bankBalance;
		}
		void setBankBalance(uint64_t balance) {
			bankBalance = balance;
		}

		Guild* getGuild() const {
			return guild;
		}
		void setGuild(Guild* guild);

		  GuildRank_ptr getGuildRank() const {
			return guildRank;
		}
		void setGuildRank(GuildRank_ptr newGuildRank) {
			guildRank = newGuildRank;
		}

		bool isGuildMate(const Player* player) const;

		const std::string& getGuildNick() const {
			return guildNick;
		}
		void setGuildNick(std::string nick) {
			guildNick = nick;
		}

		bool isInWar(const Player* player) const;
		bool isInWarList(uint32_t guild_id) const;

		void setLastWalkthroughAttempt(int64_t walkthroughAttempt) {
			lastWalkthroughAttempt = walkthroughAttempt;
		}
		void setLastWalkthroughPosition(Position walkthroughPosition) {
			lastWalkthroughPosition = walkthroughPosition;
		}

		Inbox* getInbox() const {
			return inbox;
		}

		uint16_t getClientIcons() const;

		const GuildWarVector& getGuildWarVector() const {
			return guildWarVector;
		}

		Vocation* getVocation() const {
			return vocation;
		}

		OperatingSystem_t getOperatingSystem() const {
			return operatingSystem;
		}
		void setOperatingSystem(OperatingSystem_t clientos) {
			operatingSystem = clientos;
		}

		uint16_t getProtocolVersion() const {
			if (!client) {
				return 0;
			}

			return client->getVersion();
		}

		bool hasSecureMode() const {
			return secureMode;
		}

		void setParty(Party* newParty) {
			this->party = newParty;
		}
		Party* getParty() const {
			return party;
		}
		PartyShields_t getPartyShield(const Player* player) const;
		bool isInviting(const Player* player) const;
		bool isPartner(const Player* player) const;
		void sendPlayerPartyIcons(Player* player);
		bool addPartyInvitation(Party* party);
		void removePartyInvitation(Party* party);
		void clearPartyInvitations();

		void sendUnjustifiedPoints();

		GuildEmblems_t getGuildEmblem(const Player* player) const;

		uint64_t getSpentMana() const {
			return manaSpent;
		}

		bool hasFlag(PlayerFlags value) const {
			return (group->flags & value) != 0;
		}

		BedItem* getBedItem() {
			return bedItem;
		}
		void setBedItem(BedItem* b) {
			bedItem = b;
		}

		bool inImbuing() {
			return imbuing != nullptr;
		}
		void inImbuing(Item* item);
		
		void addBlessing(uint8_t index, uint8_t count) {
			if (blessings[index - 1] == 255) {
				return;
			}

			blessings[index-1] += count;
		}
		void removeBlessing(uint8_t index, uint8_t count) {
			if (blessings[index - 1] == 0) {
				return;
			}

			blessings[index-1] -= count;
		}
		bool hasBlessing(uint8_t index) const {
			return blessings[index - 1] != 0;
		}
		uint8_t getBlessingCount(uint8_t index) const {
			return blessings[index - 1];
		}

		bool isOffline() const {
			return (getID() == 0);
		}
		void disconnect() {
			if (client) {
				client->disconnect();
			}
		}
		uint32_t getIP() const;

		void addContainer(uint8_t cid, Container* container);
		void closeContainer(uint8_t cid);
		void setContainerIndex(uint8_t cid, uint16_t index);

		Container* getContainerByID(uint8_t cid);
		int8_t getContainerID(const Container* container) const;
		uint16_t getContainerIndex(uint8_t cid) const;

		bool canOpenCorpse(uint32_t ownerId) const;

		void addStorageValue(const uint32_t key, const int32_t value, const bool isLogin = false);
		bool getStorageValue(const uint32_t key, int32_t& value) const;
		void genReservedStorageRange();

		void setGroup(Group* newGroup) {
			group = newGroup;
		}
		Group* getGroup() const {
			return group;
		}

		void setInMarket(bool value) {
			inMarket = value;
		}
		bool isInMarket() const {
			return inMarket;
		}

		void setLastDepotId(int16_t newId) {
			lastDepotId = newId;
		}
		int16_t getLastDepotId() const {
			return lastDepotId;
		}

		void resetIdleTime() {
			idleTime = 0;
		}

		bool isInGhostMode() const {
			return ghostMode;
		}
		void switchGhostMode() {
			ghostMode = !ghostMode;
		}

		uint32_t getAccount() const {
			return accountNumber;
		}
		AccountType_t getAccountType() const {
			return accountType;
		}
		uint32_t getLevel() const {
			return level;
		}
		uint8_t getLevelPercent() const {
			return levelPercent;
		}
		uint32_t getMagicLevel() const {
			return std::max<int32_t>(0, magLevel + varStats[STAT_MAGICPOINTS]);
		}
		uint32_t getBaseMagicLevel() const {
			return magLevel;
		}
		uint8_t getMagicLevelPercent() const {
			return magLevelPercent;
		}
		uint8_t getSoul() const {
			return soul;
		}
		bool isAccessPlayer() const {
			return group->access;
		}
		bool isPremium() const;
		void setPremiumDays(int32_t v);

		void setTibiaCoins(int32_t v);

		uint16_t getHelpers() const;

		bool setVocation(uint16_t vocId);
		uint16_t getVocationId() const {
			return vocation->getId();
		}

		PlayerSex_t getSex() const {
			return sex;
		}
		void setSex(PlayerSex_t);
		uint64_t getExperience() const {
			return experience;
		}

		time_t getLastLoginSaved() const {
			return lastLoginSaved;
		}

		time_t getLastLogout() const {
			return lastLogout;
		}

		const Position& getLoginPosition() const {
			return loginPosition;
		}
		const Position& getTemplePosition() const {
			return town->getTemplePosition();
		}
		Town* getTown() const {
			return town;
		}
		void setTown(Town* newTown) {
			this->town = newTown;
		}

		void clearModalWindows();
		bool hasModalWindowOpen(uint32_t modalWindowId) const;
		void onModalWindowHandled(uint32_t modalWindowId);

		bool isPushable() const final;
		uint32_t isMuted() const;
		void addMessageBuffer();
		void removeMessageBuffer();

		bool removeItemOfType(uint16_t itemId, uint32_t amount, int32_t subType, bool ignoreEquipped = false) const;

		uint32_t getCapacity() const {
			if (hasFlag(PlayerFlag_CannotPickupItem)) {
				return 0;
			} else if (hasFlag(PlayerFlag_HasInfiniteCapacity)) {
				return std::numeric_limits<uint32_t>::max();
			}
			return capacity;
		}

		uint32_t getFreeCapacity() const {
			if (hasFlag(PlayerFlag_CannotPickupItem)) {
				return 0;
			} else if (hasFlag(PlayerFlag_HasInfiniteCapacity)) {
				return std::numeric_limits<uint32_t>::max();
			} else {
				return std::max<int32_t>(0, capacity - inventoryWeight);
			}
		}

		int32_t getMaxHealth() const final {
			return std::max<int32_t>(1, healthMax + varStats[STAT_MAXHITPOINTS]);
		}
		uint32_t getMaxMana() const {
			return std::max<int32_t>(0, manaMax + varStats[STAT_MAXMANAPOINTS]);
		}

		Item* getInventoryItem(slots_t slot) const;

		bool isItemAbilityEnabled(slots_t slot) const {
			return inventoryAbilities[slot];
		}
		void setItemAbility(slots_t slot, bool enabled) {
			inventoryAbilities[slot] = enabled;
		}

		void setVarSkill(skills_t skill, int32_t modifier) {
			varSkills[skill] += modifier;
		}

		void setVarStats(stats_t stat, int32_t modifier);
		int32_t getDefaultStats(stats_t stat) const;

		void addConditionSuppressions(uint32_t conditions);
		void removeConditionSuppressions(uint32_t conditions);

		Reward* getReward(uint32_t rewardId, bool autoCreate);
		void removeReward(uint32_t rewardId);
		void getRewardList(std::vector<uint32_t>& rewards);
		RewardChest* getRewardChest();

		DepotChest* getDepotBox();
		DepotChest* getDepotChest(uint32_t depotId, bool autoCreate);
		DepotLocker* getDepotLocker(uint32_t depotId);
		void onReceiveMail() const;
		bool isNearDepotBox() const;

		bool canSee(const Position& pos) const final;
		bool canSeeCreature(const Creature* creature) const final;

		bool canWalkthrough(const Creature* creature) const;
		bool canWalkthroughEx(const Creature* creature) const;

		RaceType_t getRace() const final {
			return RACE_BLOOD;
		}

		uint64_t getMoney() const;

		//safe-trade functions
		void setTradeState(tradestate_t state) {
			tradeState = state;
		}
		tradestate_t getTradeState() const {
			return tradeState;
		}
		Item* getTradeItem() {
			return tradeItem;
		}

		//shop functions
		void setShopOwner(Npc* owner, int32_t onBuy, int32_t onSell) {
			shopOwner = owner;
			purchaseCallback = onBuy;
			saleCallback = onSell;
		}

		Npc* getShopOwner(int32_t& onBuy, int32_t& onSell) {
			onBuy = purchaseCallback;
			onSell = saleCallback;
			return shopOwner;
		}

		const Npc* getShopOwner(int32_t& onBuy, int32_t& onSell) const {
			onBuy = purchaseCallback;
			onSell = saleCallback;
			return shopOwner;
		}

		//V.I.P. functions
		void notifyStatusChange(Player* player, VipStatus_t status);
		bool removeVIP(uint32_t vipGuid);
		bool addVIP(uint32_t vipGuid, const std::string& vipName, VipStatus_t status);
		bool addVIPInternal(uint32_t vipGuid);
		bool editVIP(uint32_t vipGuid, const std::string& description, uint32_t icon, bool notify);

		//follow functions
		bool setFollowCreature(Creature* creature) final;
		void goToFollowCreature() final;

		//follow events
		void onFollowCreature(const Creature* creature) final;

		//walk events
		void onWalk(Direction& dir) final;
		void onWalkAborted() final;
		void onWalkComplete() final;

		void stopWalk();
		void openShopWindow(Npc* npc, const std::list<ShopInfo>& shop);
		bool closeShopWindow(bool sendCloseShopWindow = true);
		bool updateSaleShopList(const Item* item);
		bool hasShopItemForSale(uint32_t itemId, uint8_t subType) const;

		void setChaseMode(bool mode);
		void setFightMode(fightMode_t mode) {
			fightMode = mode;
		}
		void setSecureMode(bool mode) {
			secureMode = mode;
		}

		//combat functions
		bool setAttackedCreature(Creature* creature) final;
		bool isImmune(CombatType_t type) const final;
		bool isImmune(ConditionType_t type) const final;
		bool hasShield() const;
		bool isAttackable() const final;
		static bool lastHitIsPlayer(Creature* lastHitCreature);

		void changeHealth(int32_t healthChange, bool sendHealthChange = true) final;
		void changeMana(int32_t manaChange) final;
		void changeSoul(int32_t soulChange);

		bool isPzLocked() const {
			return pzLocked;
		}
		BlockType_t blockHit(Creature* attacker, CombatType_t combatType, int32_t& damage,
									 bool checkDefense = false, bool checkArmor = false, bool field = false) final;
		void doAttacking(uint32_t interval) final;
		bool hasExtraSwing() final {
			return lastAttack > 0 && ((OTSYS_TIME() - lastAttack) >= getAttackSpeed());
		}

		uint16_t getSkillLevel(uint8_t skill) const {
			if (skill == SKILL_LIFE_LEECH_CHANCE || skill == SKILL_MANA_LEECH_CHANCE) {
				return std::min<int32_t>(100, std::max<int32_t>(0, skills[skill].level + varSkills[skill]));
			}

			return std::max<int32_t>(0, skills[skill].level + varSkills[skill]);
		}
		uint16_t getBaseSkill(uint8_t skill) const {
			return skills[skill].level;
		}
		uint8_t getSkillPercent(uint8_t skill) const {
			return skills[skill].percent;
		}

		bool getAddAttackSkill() const {
			return addAttackSkillPoint;
		}
		BlockType_t getLastAttackBlockType() const {
			return lastAttackBlockType;
		}

		Item* getWeapon(slots_t slot, bool ignoreAmmo) const;
		Item* getWeapon(bool ignoreAmmo = false) const;
		WeaponType_t getWeaponType() const;
		int32_t getWeaponSkill(const Item* item) const;
		void getShieldAndWeapon(const Item*& shield, const Item*& weapon) const;

		void drainHealth(Creature* attacker, int32_t damage) final;
		void drainMana(Creature* attacker, int32_t manaLoss) final;
		void addManaSpent(uint64_t amount);
		void addSkillAdvance(skills_t skill, uint64_t count);

		int32_t getArmor() const final;
		int32_t getDefense() const final;
		float getAttackFactor() const final;
		float getDefenseFactor() const final;

		void addInFightTicks(bool pzlock = false);

		uint64_t getGainedExperience(Creature* attacker) const final;

		//combat event functions
		void onAddCondition(ConditionType_t type) final;
		void onAddCombatCondition(ConditionType_t type) final;
		void onEndCondition(ConditionType_t type) final;
		void onCombatRemoveCondition(Condition* condition) final;
		void onAttackedCreature(Creature* target) final;
		void onAttacked() final;
		void onAttackedCreatureDrainHealth(Creature* target, int32_t points) final;
		void onTargetCreatureGainHealth(Creature* target, int32_t points) final;
		bool onKilledCreature(Creature* target, bool lastHit = true) final;
		void onGainExperience(uint64_t gainExp, Creature* target) final;
		void onGainSharedExperience(uint64_t gainExp, Creature* source);
		void onAttackedCreatureBlockHit(BlockType_t blockType) final;
		void onBlockHit() final;
		void onChangeZone(ZoneType_t zone) final;
		void onAttackedCreatureChangeZone(ZoneType_t zone) final;
		void onIdleStatus() final;
		void onPlacedCreature() final;

		LightInfo getCreatureLight() const final;

		Skulls_t getSkull() const final;
		Skulls_t getSkullClient(const Creature* creature) const final;
		int64_t getSkullTicks() const { return skullTicks; }
		void setSkullTicks(int64_t ticks) { skullTicks = ticks; }

		bool hasAttacked(const Player* attacked) const;
		void addAttacked(const Player* attacked);
		void removeAttacked(const Player* attacked);
		void clearAttacked();
		void addUnjustifiedDead(const Player* attacked);
		void sendCreatureSkull(const Creature* creature) const {
			if (client) {
				client->sendCreatureSkull(creature);
			}
		}
		void checkSkullTicks(int64_t ticks);

		bool canWear(uint32_t lookType, uint8_t addons) const;
		void addOutfit(uint16_t lookType, uint8_t addons);
		bool removeOutfit(uint16_t lookType);
		bool removeOutfitAddon(uint16_t lookType, uint8_t addons);
		bool getOutfitAddons(const Outfit& outfit, uint8_t& addons) const;

		bool canLogout();

		bool hasKilled(const Player* player) const;

		size_t getMaxVIPEntries() const;
		size_t getMaxDepotItems() const;

		//tile
		//send methods
		void sendAddTileItem(const Tile* itemTile, const Position& pos, const Item* item) {
			if (client) {
				int32_t stackpos = itemTile->getStackposOfItem(this, item);
				if (stackpos != -1) {
					client->sendAddTileItem(pos, stackpos, item);
				}
			}
		}
		void sendUpdateTileItem(const Tile* updateTile, const Position& pos, const Item* item) {
			if (client) {
				int32_t stackpos = updateTile->getStackposOfItem(this, item);
				if (stackpos != -1) {
					client->sendUpdateTileItem(pos, stackpos, item);
				}
			}
		}
		void sendRemoveTileThing(const Position& pos, int32_t stackpos) {
			if (stackpos != -1 && client) {
				client->sendRemoveTileThing(pos, stackpos);
			}
		}
		void sendUpdateTile(const Tile* updateTile, const Position& pos) {
			if (client) {
				client->sendUpdateTile(updateTile, pos);
			}
		}

		void sendChannelMessage(const std::string& author, const std::string& text, SpeakClasses type, uint16_t channel) {
			if (client) {
				client->sendChannelMessage(author, text, type, channel);
			}
		}
		void sendChannelEvent(uint16_t channelId, const std::string& playerName, ChannelEvent_t channelEvent) {
			if (client) {
				client->sendChannelEvent(channelId, playerName, channelEvent);
			}
		}
		void sendCreatureAppear(const Creature* creature, const Position& pos, bool isLogin) {
			if (client) {
				client->sendAddCreature(creature, pos, creature->getTile()->getStackposOfCreature(this, creature), isLogin);
			}
		}
		void sendCreatureMove(const Creature* creature, const Position& newPos, int32_t newStackPos, const Position& oldPos, int32_t oldStackPos, bool teleport) {
			if (client) {
				client->sendMoveCreature(creature, newPos, newStackPos, oldPos, oldStackPos, teleport);
			}
		}
		void sendCreatureTurn(const Creature* creature) {
			if (client && canSeeCreature(creature)) {
				int32_t stackpos = creature->getTile()->getStackposOfCreature(this, creature);
				if (stackpos != -1) {
					client->sendCreatureTurn(creature, stackpos);
				}
			}
		}
		void sendCreatureSay(const Creature* creature, SpeakClasses type, const std::string& text, const Position* pos = nullptr) {
			if (client) {
				client->sendCreatureSay(creature, type, text, pos);
			}
		}
		void sendPrivateMessage(const Player* speaker, SpeakClasses type, const std::string& text) {
			if (client) {
				client->sendPrivateMessage(speaker, type, text);
			}
		}
		void sendCreatureSquare(const Creature* creature, SquareColor_t color) {
			if (client) {
				client->sendCreatureSquare(creature, color);
			}
		}
		void sendCreatureChangeOutfit(const Creature* creature, const Outfit_t& outfit) {
			if (client) {
				client->sendCreatureOutfit(creature, outfit);
			}
		}
		void sendCreatureChangeVisible(const Creature* creature, bool visible) {
			if (!client) {
				return;
			}

			if (creature->getPlayer()) {
				if (visible) {
					client->sendCreatureOutfit(creature, creature->getCurrentOutfit());
				} else {
					static Outfit_t outfit;
					client->sendCreatureOutfit(creature, outfit);
				}
			} else if (canSeeInvisibility()) {
				client->sendCreatureOutfit(creature, creature->getCurrentOutfit());
			} else {
				int32_t stackpos = creature->getTile()->getStackposOfCreature(this, creature);
				if (stackpos == -1) {
					return;
				}

				if (visible) {
					client->sendAddCreature(creature, creature->getPosition(), stackpos, false);
				} else {
					client->sendRemoveTileThing(creature->getPosition(), stackpos);
				}
			}
		}
		void sendCreatureLight(const Creature* creature) {
			if (client) {
				client->sendCreatureLight(creature);
			}
		}
		void sendCreatureWalkthrough(const Creature* creature, bool walkthrough) {
			if (client) {
				client->sendCreatureWalkthrough(creature, walkthrough);
			}
		}
		void sendCreatureShield(const Creature* creature) {
			if (client) {
				client->sendCreatureShield(creature);
			}
		}
		void sendCreatureType(const Creature* creature, uint8_t creatureType) {
			if (client) {
				client->sendCreatureType(creature, creatureType);
			}
		}
		void sendCreatureHelpers(uint32_t creatureId, uint16_t helpers) {
			if (client) {
				client->sendCreatureHelpers(creatureId, helpers);
			}
		}
		void sendSpellCooldown(uint8_t spellId, uint32_t time) {
			if (client) {
				client->sendSpellCooldown(spellId, time);
			}
		}
		void sendSpellGroupCooldown(SpellGroup_t groupId, uint32_t time) {
			if (client) {
				client->sendSpellGroupCooldown(groupId, time);
			}
		}
		void sendModalWindow(const ModalWindow& modalWindow);

		//container
		void sendAddContainerItem(const Container* container, const Item* item);
		void sendUpdateContainerItem(const Container* container, uint16_t slot, const Item* newItem);
		void sendRemoveContainerItem(const Container* container, uint16_t slot);
		void sendContainer(uint8_t cid, const Container* container, bool hasParent, uint16_t firstIndex) {
			if (client) {
				client->sendContainer(cid, container, hasParent, firstIndex);
			}
		}

		//inventory
		void sendCoinBalance() {
			if (client) {
				client->sendCoinBalance();
			}
		}

		void sendInventoryItem(slots_t slot, const Item* item) {
			if (client) {
				client->sendInventoryItem(slot, item);
			}
		}

		void sendInventoryClientIds() {
			if (client) {
				client->sendInventoryClientIds();
			}
		}

		//store
		void sendOpenStore(uint8_t serviceType) {
			if(client) {
				client->sendOpenStore(serviceType);
			}
		}

		void sendShowStoreCategoryOffers(StoreCategory* category) {
			if(client) {
				client->sendStoreCategoryOffers(category);
			}
		}

		void sendStoreError(GameStoreError_t error, const std::string& errorMessage) {
			if(client) {
				client->sendStoreError(error, errorMessage);
			}
		}

		void sendStorePurchaseSuccessful(const std::string& message, const uint32_t newCoinBalance) {
			if(client)
			{
				client->sendStorePurchaseSuccessful(message, newCoinBalance);
			}
		}

		void sendStoreRequestAdditionalInfo(uint32_t offerId, ClientOffer_t clientOfferType) {
			if(client) {
				client->sendStoreRequestAdditionalInfo(offerId, clientOfferType);
			}
		}

		void sendStoreTrasactionHistory(HistoryStoreOfferList& list, uint32_t page, uint8_t entriesPerPage) {
			if(client) {
				client->sendStoreTrasactionHistory(list, page, entriesPerPage);
			}
		}

		//event methods
		void onUpdateTileItem(const Tile* tile, const Position& pos, const Item* oldItem,
									  const ItemType& oldType, const Item* newItem, const ItemType& newType) final;
		void onRemoveTileItem(const Tile* tile, const Position& pos, const ItemType& iType,
									  const Item* item) final;

		void onCreatureAppear(Creature* creature, bool isLogin) final;
		void onRemoveCreature(Creature* creature, bool isLogout) final;
		void onCreatureMove(Creature* creature, const Tile* newTile, const Position& newPos,
									const Tile* oldTile, const Position& oldPos, bool teleport) final;

		void onAttackedCreatureDisappear(bool isLogout) final;
		void onFollowCreatureDisappear(bool isLogout) final;

		//container
		void onAddContainerItem(const Item* item);
		void onUpdateContainerItem(const Container* container, const Item* oldItem, const Item* newItem);
		void onRemoveContainerItem(const Container* container, const Item* item);

		void onCloseContainer(const Container* container);
		void onSendContainer(const Container* container);
		void autoCloseContainers(const Container* container);

		//inventory
		void onUpdateInventoryItem(Item* oldItem, Item* newItem);
		void onRemoveInventoryItem(Item* item);

		void sendCancelMessage(const std::string& msg) const {
			if (client) {
				client->sendTextMessage(TextMessage(MESSAGE_STATUS_SMALL, msg));
			}
		}
		void sendCancelMessage(ReturnValue message) const;
		void sendCancelTarget() const {
			if (client) {
				client->sendCancelTarget();
			}
		}
		void sendCancelWalk() const {
			if (client) {
				client->sendCancelWalk();
			}
		}
		void sendChangeSpeed(const Creature* creature, uint32_t newSpeed) const {
			if (client) {
				client->sendChangeSpeed(creature, newSpeed);
			}
		}
		void sendCreatureHealth(const Creature* creature) const {
			if (client) {
				client->sendCreatureHealth(creature);
			}
		}
		void sendDistanceShoot(const Position& from, const Position& to, unsigned char type) const {
			if (client) {
				client->sendDistanceShoot(from, to, type);
			}
		}
		void sendHouseWindow(House* house, uint32_t listId) const;
		void sendCreatePrivateChannel(uint16_t channelId, const std::string& channelName) {
			if (client) {
				client->sendCreatePrivateChannel(channelId, channelName);
			}
		}
		void sendClosePrivate(uint16_t channelId);
		void sendIcons() const {
			if (client) {
				client->sendIcons(getClientIcons());
			}
		}
		void sendClientCheck() const {
			if (client) {
				client->sendClientCheck();
			}
		}
		void sendGameNews() const {
			if (client) {
				client->sendGameNews();
			}
		}
		void sendMagicEffect(const Position& pos, uint8_t type) const {
			if (client) {
				client->sendMagicEffect(pos, type);
			}
		}
		void sendPing();
		void sendPingBack() const {
			if (client) {
				client->sendPingBack();
			}
		}
		void sendStats();
		void sendBasicData() const {
			if (client) {
				client->sendBasicData();
			}
		}
		void sendBlessStatus() const {
			if (client) {
				client->sendBlessStatus();
			}
		}
		void sendSkills() const {
			if (client) {
				client->sendSkills();
			}
		}
		void sendTextMessage(MessageClasses mclass, const std::string& message) const {
			if (client) {
				client->sendTextMessage(TextMessage(mclass, message));
			}
		}
		void sendTextMessage(const TextMessage& message) const {
			if (client) {
				client->sendTextMessage(message);
			}
		}
		void sendReLoginWindow(uint8_t unfairFightReduction) const {
			if (client) {
				client->sendReLoginWindow(unfairFightReduction);
			}
		}
		void sendTextWindow(Item* item, uint16_t maxlen, bool canWrite) const {
			if (client) {
				client->sendTextWindow(windowTextId, item, maxlen, canWrite);
			}
		}
		void sendTextWindow(uint32_t itemId, const std::string& text) const {
			if (client) {
				client->sendTextWindow(windowTextId, itemId, text);
			}
		}
		void sendToChannel(const Creature* creature, SpeakClasses type, const std::string& text, uint16_t channelId) const {
			if (client) {
				client->sendToChannel(creature, type, text, channelId);
			}
		}
		void sendShop(Npc* npc) const {
			if (client) {
				client->sendShop(npc, shopItemList);
			}
		}
		void sendSaleItemList() const {
			if (client) {
				client->sendSaleItemList(shopItemList);
			}
		}
		void sendCloseShop() const {
			if (client) {
				client->sendCloseShop();
			}
		}
		void sendMarketEnter(uint32_t depotId) const {
			if (client) {
				client->sendMarketEnter(depotId);
			}
		}
		void sendMarketLeave() {
			inMarket = false;
			if (client) {
				client->sendMarketLeave();
			}
		}
		void sendMarketBrowseItem(uint16_t itemId, const MarketOfferList& buyOffers, const MarketOfferList& sellOffers) const {
			if (client) {
				client->sendMarketBrowseItem(itemId, buyOffers, sellOffers);
			}
		}
		void sendMarketBrowseOwnOffers(const MarketOfferList& buyOffers, const MarketOfferList& sellOffers) const {
			if (client) {
				client->sendMarketBrowseOwnOffers(buyOffers, sellOffers);
			}
		}
		void sendMarketBrowseOwnHistory(const HistoryMarketOfferList& buyOffers, const HistoryMarketOfferList& sellOffers) const {
			if (client) {
				client->sendMarketBrowseOwnHistory(buyOffers, sellOffers);
			}
		}
		void sendMarketDetail(uint16_t itemId) const {
			if (client) {
				client->sendMarketDetail(itemId);
			}
		}
		void sendMarketAcceptOffer(const MarketOfferEx& offer) const {
			if (client) {
				client->sendMarketAcceptOffer(offer);
			}
		}
		void sendMarketCancelOffer(const MarketOfferEx& offer) const {
			if (client) {
				client->sendMarketCancelOffer(offer);
			}
		}
		void sendTradeItemRequest(const std::string& traderName, const Item* item, bool ack) const {
			if (client) {
				client->sendTradeItemRequest(traderName, item, ack);
			}
		}
		void sendTradeClose() const {
			if (client) {
				client->sendCloseTrade();
			}
		}
		void sendWorldLight(LightInfo lightInfo) {
			if (client) {
				client->sendWorldLight(lightInfo);
			}
		}
		void sendChannelsDialog() {
			if (client) {
				client->sendChannelsDialog();
			}
		}
		void sendOpenPrivateChannel(const std::string& receiver) {
			if (client) {
				client->sendOpenPrivateChannel(receiver);
			}
		}
		void sendOutfitWindow() {
			if (client) {
				client->sendOutfitWindow();
			}
		}
		void sendImbuementWindow(Item* item) {
			if (client) {
				client->sendImbuementWindow(item);
			}
		}
		void sendCloseContainer(uint8_t cid) {
			if (client) {
				client->sendCloseContainer(cid);
			}
		}

		void sendChannel(uint16_t channelId, const std::string& channelName, const UsersMap* channelUsers, const InvitedMap* invitedUsers) {
			if (client) {
				client->sendChannel(channelId, channelName, channelUsers, invitedUsers);
			}
		}
		void sendTutorial(uint8_t tutorialId) {
			if (client) {
				client->sendTutorial(tutorialId);
			}
		}
		void sendAddMarker(const Position& pos, uint8_t markType, const std::string& desc) {
			if (client) {
				client->sendAddMarker(pos, markType, desc);
			}
		}
		void sendQuestLog() {
			if (client) {
				client->sendQuestLog();
			}
		}
		void sendQuestLine(const Quest* quest) {
			if (client) {
				client->sendQuestLine(quest);
			}
		}
		void sendEnterWorld() {
			if (client) {
				client->sendEnterWorld();
			}
		}
		void sendFightModes() {
			if (client) {
				client->sendFightModes();
			}
		}
		void sendNetworkMessage(const NetworkMessage& message) {
			if (client) {
				client->writeToOutputBuffer(message);
			}
		}

		void sendStoreOpen(uint8_t serviceType) {
			if (client) {
				client->sendOpenStore(serviceType);
			}
		}

		void receivePing() {
			lastPong = OTSYS_TIME();
		}

		void onThink(uint32_t interval) final;

		void postAddNotification(Thing* thing, const Cylinder* oldParent, int32_t index, cylinderlink_t link = LINK_OWNER) final;
		void postRemoveNotification(Thing* thing, const Cylinder* newParent, int32_t index, cylinderlink_t link = LINK_OWNER) final;

		void setNextAction(int64_t time) {
			if (time > nextAction) {
				nextAction = time;
			}
		}
		bool canDoAction() const {
			return nextAction <= OTSYS_TIME();
		}

		void setModuleDelay(uint8_t byteortype, int16_t delay) {
			moduleDelayMap[byteortype] = OTSYS_TIME() + delay;
		}

		bool canRunModule(uint8_t byteortype) {
			if (!moduleDelayMap[byteortype]) {
				return true;
			}
			return moduleDelayMap[byteortype] <= OTSYS_TIME();
		}

		uint32_t getNextActionTime() const;

		Item* getWriteItem(uint32_t& windowTextId, uint16_t& maxWriteLen);
		void setWriteItem(Item* item, uint16_t maxWriteLen = 0);

		House* getEditHouse(uint32_t& windowTextId, uint32_t& listId);
		void setEditHouse(House* house, uint32_t listId = 0);

		void learnInstantSpell(const std::string& spellName);
		void forgetInstantSpell(const std::string& spellName);
		bool hasLearnedInstantSpell(const std::string& spellName) const;

		uint16_t getBaseXpGain() const {
			return baseXpGain;
		}
		void setBaseXpGain(uint16_t value) {
			baseXpGain = std::min<uint16_t>(std::numeric_limits<uint16_t>::max(), value);
		}
		uint16_t getVoucherXpBoost() const {
			return voucherXpBoost;
		}
		void setVoucherXpBoost(uint16_t value) {
			voucherXpBoost = std::min<uint16_t>(std::numeric_limits<uint16_t>::max(), value);
		}
		uint16_t getGrindingXpBoost() const {
			return grindingXpBoost;
		}
		void setGrindingXpBoost(uint16_t value) {
			grindingXpBoost = std::min<uint16_t>(std::numeric_limits<uint16_t>::max(), value);
		}
		uint16_t getStoreXpBoost() const {
			return storeXpBoost;
		}
		void setStoreXpBoost(uint16_t exp) {
			storeXpBoost = exp;
		}
		uint16_t getStaminaXpBoost() const {
			return staminaXpBoost;
		}
		void setStaminaXpBoost(uint16_t value) {
			staminaXpBoost = std::min<uint16_t>(std::numeric_limits<uint16_t>::max(), value);
		}

		void setExpBoostStamina(uint16_t stamina) {
			expBoostStamina = stamina;
		}

		uint16_t getExpBoostStamina() {
			return expBoostStamina;
		}

		int32_t getIdleTime() const {
			return idleTime;
		}

		void onEquipImbueItem(Imbuement* imbuement);
		void onDeEquipImbueItem(Imbuement* imbuement);

		//Custom: Anti bug do market
		bool isMarketExhausted() const;
		void updateMarketExhausted() {
			lastMarketInteraction = OTSYS_TIME();
		}

   		bool updateKillTracker(Container* corpse, const std::string& playerName, const Outfit_t creatureOutfit) const
 		{
  			if (client && getProtocolVersion() > 1140) {
				client->sendKillTrackerUpdate(corpse, playerName, creatureOutfit);
				return true;
 			}

			return false;
 		}
 
   		void updateSupplyTracker(const Item* item)
 		{
  			if (client && getProtocolVersion() > 1140) {
 				client->sendUpdateSupplyTracker(item);
 			}
 		}

   		void updateImpactTracker(int32_t quantity, bool isHeal)
 		{
  			if (client && getProtocolVersion() > 1140) {
 				client->sendUpdateImpactTracker(quantity, isHeal);
 			}
 		}

   		void updateLootTracker(Item* item)
 		{
  			if (client && getProtocolVersion() > 1140) {
 				client->sendUpdateLootTracker(item);
 			}
 		}


	protected:
		std::forward_list<Condition*> getMuteConditions() const;

		void checkTradeState(const Item* item);
		bool hasCapacity(const Item* item, uint32_t count) const;

		void gainExperience(uint64_t exp, Creature* source);
		void addExperience(Creature* source, uint64_t exp, bool sendText = false);
		void removeExperience(uint64_t exp, bool sendText = false);

		void updateInventoryWeight();

		void setNextWalkActionTask(SchedulerTask* task);
		void setNextWalkTask(SchedulerTask* task);
		void setNextActionTask(SchedulerTask* task);

		void death(Creature* lastHitCreature) final;
		bool dropCorpse(Creature* lastHitCreature, Creature* mostDamageCreature, bool lastHitUnjustified, bool mostDamageUnjustified) final;
		Item* getCorpse(Creature* lastHitCreature, Creature* mostDamageCreature) final;

		//cylinder implementations
		ReturnValue queryAdd(int32_t index, const Thing& thing, uint32_t count,
				uint32_t flags, Creature* actor = nullptr) const final;
		ReturnValue queryMaxCount(int32_t index, const Thing& thing, uint32_t count, uint32_t& maxQueryCount,
				uint32_t flags) const final;
		ReturnValue queryRemove(const Thing& thing, uint32_t count, uint32_t flags) const final;
		Cylinder* queryDestination(int32_t& index, const Thing& thing, Item** destItem,
				uint32_t& flags) final;

		void addThing(Thing*) final {}
		void addThing(int32_t index, Thing* thing) final;

		void updateThing(Thing* thing, uint16_t itemId, uint32_t count) final;
		void replaceThing(uint32_t index, Thing* thing) final;

		void removeThing(Thing* thing, uint32_t count) final;

		int32_t getThingIndex(const Thing* thing) const final;
		size_t getFirstIndex() const final;
		size_t getLastIndex() const final;
		uint32_t getItemTypeCount(uint16_t itemId, int32_t subType = -1) const final;
		std::map<uint32_t, uint32_t>& getAllItemTypeCount(std::map<uint32_t, uint32_t>& countMap) const final;
		Item* getItemByClientId(uint16_t clientId) const;
		std::map<uint16_t, uint16_t> getInventoryClientIds() const;
		Thing* getThing(size_t index) const final;

		void internalAddThing(Thing* thing) final;
		void internalAddThing(uint32_t index, Thing* thing) final;

		std::unordered_set<uint32_t> attackedSet;

		std::unordered_set<uint32_t> VIPList;

		std::map<uint8_t, OpenContainer> openContainers;
		std::map<uint32_t, DepotLocker*> depotLockerMap;
		std::map<uint32_t, DepotChest*> depotChests;
		std::map<uint32_t, int32_t> storageMap;
		std::map<uint8_t, int64_t> moduleDelayMap;

		std::map<uint32_t, Reward*> rewardMap;

		std::vector<OutfitEntry> outfits;
		GuildWarVector guildWarVector;

		std::list<ShopInfo> shopItemList;

		std::forward_list<Party*> invitePartyList;
		std::forward_list<uint32_t> modalWindows;
		std::forward_list<std::string> learnedInstantSpellList;
		std::forward_list<Condition*> storedConditionList; // TODO: This variable is only temporarily used when logging in, get rid of it somehow

		std::string name;
		std::string guildNick;

		Skill skills[SKILL_LAST + 1];
		LightInfo itemsLight;
		Position loginPosition;
		Position lastWalkthroughPosition;

		time_t lastLoginSaved = 0;
		time_t lastLogout = 0;

		uint64_t experience = 0;
		uint64_t manaSpent = 0;
		uint64_t lastAttack = 0;
		uint64_t bankBalance = 0;
		uint64_t lastQuestlogUpdate = 0;
		int64_t lastFailedFollow = 0;
		int64_t skullTicks = 0;
		int64_t lastWalkthroughAttempt = 0;
		int64_t lastToggleMount = 0;
		int64_t lastMarketInteraction = 0;  //Custom: Anti bug do market
		int64_t lastPing;
		int64_t lastPong;
		int64_t nextAction = 0;

		std::vector<Kill> unjustifiedKills;

		BedItem* bedItem = nullptr;
		Guild* guild = nullptr;
		GuildRank_ptr guildRank;
		Group* group = nullptr;
		Inbox* inbox;
		Item* imbuing = nullptr; // for intarnal use
		Item* tradeItem = nullptr;
 		Item* inventory[CONST_SLOT_LAST + 1] = {};
		Item* writeItem = nullptr;
		House* editHouse = nullptr;
		Npc* shopOwner = nullptr;
		Party* party = nullptr;
		Player* tradePartner = nullptr;
		ProtocolGame_ptr client;
		SchedulerTask* walkTask = nullptr;
		Town* town = nullptr;
		Vocation* vocation = nullptr;
		RewardChest* rewardChest = nullptr;

		uint32_t inventoryWeight = 0;
		uint32_t capacity = 40000;
		uint32_t damageImmunities = 0;
		uint32_t conditionImmunities = 0;
		uint32_t conditionSuppressions = 0;
		uint32_t level = 1;
		uint32_t magLevel = 0;
		uint32_t actionTaskEvent = 0;
		uint32_t nextStepEvent = 0;
		uint32_t maxInboxItems = 8000;
		uint32_t walkTaskEvent = 0;
		uint32_t MessageBufferTicks = 0;
		uint32_t lastIP = 0;
		uint32_t accountNumber = 0;
		uint32_t guid = 0;
		uint32_t windowTextId = 0;
		uint32_t editListId = 0;
		uint32_t manaMax = 0;
		int32_t varSkills[SKILL_LAST + 1] = {};
		int32_t varStats[STAT_LAST + 1] = {};
		int32_t purchaseCallback = -1;
		int32_t saleCallback = -1;
		int32_t MessageBufferCount = 0;
		int32_t premiumDays = 0;
		int32_t bloodHitCount = 0;
		int32_t shieldBlockCount = 0;
		int32_t offlineTrainingSkill = -1;
		int32_t offlineTrainingTime = 0;
		int32_t idleTime = 0;
		int32_t coinBalance = 0;
		uint16_t expBoostStamina = 0;

		uint16_t lastStatsTrainingTime = 0;
		uint16_t staminaMinutes = 2520;
		std::vector<uint16_t> preyStaminaMinutes = {7200, 7200, 7200};
		std::vector<uint16_t> preyBonusType = {0, 0, 0};
		std::vector<uint16_t> preyBonusValue = {0, 0, 0};
		std::vector<std::string> preyBonusName = {"", "", ""};
		std::vector<uint8_t> blessings = { 0, 0, 0, 0, 0, 0, 0, 0 };
		uint16_t maxWriteLen = 0;
		uint16_t baseXpGain = 100;
		uint16_t voucherXpBoost = 0;
		uint16_t grindingXpBoost = 0;
		uint16_t storeXpBoost = 0;
		uint16_t staminaXpBoost = 100;
		int16_t lastDepotId = -1;
		
		// New Prey
		uint16_t preyBonusRerolls = 0;
		std::vector<uint16_t> preySlotState = {0, 0, 0};
		std::vector<uint16_t> preySlotUnlocked = {0, 0, 0};
		std::vector<std::string> preySlotCurrentMonster = { "", "", "" };
		std::vector<std::string> preySlotMonsterList = { "", "", "" };
		std::vector<uint16_t> preySlotFreeRerollIn = { 0, 0, 0 };
		std::vector<uint16_t> preySlotTimeLeft = {7200, 7200, 7200};
		std::vector<uint32_t> preySlotNextUse = { 0, 0, 0 };
		std::vector<uint16_t> preySlotBonusType = {0, 0, 0};
		std::vector<uint16_t> preySlotBonusValue = {0, 0, 0};
		std::vector<uint16_t> preySlotBonusGrade = { 0, 0, 0 };

		uint8_t soul = 0;
		uint8_t levelPercent = 0;
		uint8_t magLevelPercent = 0;

		PlayerSex_t sex = PLAYERSEX_FEMALE;
		OperatingSystem_t operatingSystem = CLIENTOS_NONE;
		BlockType_t lastAttackBlockType = BLOCK_NONE;
		tradestate_t tradeState = TRADE_NONE;
		fightMode_t fightMode = FIGHTMODE_ATTACK;
		AccountType_t accountType = ACCOUNT_TYPE_NORMAL;

		bool chaseMode = false;
		bool secureMode = false;
		bool inMarket = false;
		bool wasMounted = false;
		bool ghostMode = false;
		bool pzLocked = false;
		bool isConnecting = false;
		bool addAttackSkillPoint = false;
		bool inventoryAbilities[CONST_SLOT_LAST + 1] = {};

		static uint32_t playerAutoID;

		void updateItemsLight(bool internal = false);
		int32_t getStepSpeed() const final {
			return std::max<int32_t>(PLAYER_MIN_SPEED, std::min<int32_t>(PLAYER_MAX_SPEED, getSpeed()));
		}
		void updateBaseSpeed() {
			if (!hasFlag(PlayerFlag_SetMaxSpeed)) {
				baseSpeed = vocation->getBaseSpeed() + (2 * (level - 1));
			} else {
				baseSpeed = PLAYER_MAX_SPEED;
			}
		}

		bool isPromoted() const;

		uint32_t getAttackSpeed() const {
			return vocation->getAttackSpeed();
		}

		static uint8_t getPercentLevel(uint64_t count, uint64_t nextLevelCount);
		double getLostPercent() const;
		uint64_t getLostExperience() const final {
			return skillLoss ? static_cast<uint64_t>(experience * getLostPercent()) : 0;
		}
		uint32_t getDamageImmunities() const final {
			return damageImmunities;
		}
		uint32_t getConditionImmunities() const final {
			return conditionImmunities;
		}
		uint32_t getConditionSuppressions() const final {
			return conditionSuppressions;
		}
		uint16_t getLookCorpse() const final;
		void getPathSearchParams(const Creature* creature, FindPathParams& fpp) const final;

		friend class Game;
		friend class Npc;
		friend class LuaScriptInterface;
		friend class Map;
		friend class Actions;
		friend class IOLoginData;
		friend class ProtocolGame;
};

#endif

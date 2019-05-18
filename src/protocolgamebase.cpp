/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2017  Mark Samman <mark.samman@gmail.com>
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
#include <boost/range/adaptor/reversed.hpp>
#include "protocolgamebase.h"
#include "configmanager.h"
#include "game.h"
#include "iologindata.h"
#include "tile.h"
#include "outputmessage.h"

extern ConfigManager g_config;
extern Game g_game;

void ProtocolGameBase::onConnect()
{
	auto output = OutputMessagePool::getOutputMessage();
	static std::random_device rd;
	static std::ranlux24 generator(rd());
	static std::uniform_int_distribution<uint16_t> randNumber(0x00, 0xFF);

	// Skip checksum
	output->skipBytes(sizeof(uint32_t));

	// Packet length & type
	output->add<uint16_t>(0x0006);
	output->addByte(0x1F);

	// Add timestamp & random number
	challengeTimestamp = static_cast<uint32_t>(time(nullptr));
	output->add<uint32_t>(challengeTimestamp);

	challengeRandom = randNumber(generator);
	output->addByte(challengeRandom);

	// Go back and write checksum
	output->skipBytes(-12);
	// To support 11.10-, not have problems with 11.11+
	output->add<uint32_t>(adlerChecksum(output->getOutputBuffer() + sizeof(uint32_t), 8));

	send(std::move(output));
}

void ProtocolGameBase::AddOutfit(NetworkMessage& msg, const Outfit_t& outfit)
{
	msg.add<uint16_t>(outfit.lookType);

	if (outfit.lookType != 0) {
		msg.addByte(outfit.lookHead);
		msg.addByte(outfit.lookBody);
		msg.addByte(outfit.lookLegs);
		msg.addByte(outfit.lookFeet);
		msg.addByte(outfit.lookAddons);
	} else {
		msg.addItemId(outfit.lookTypeEx);
	}

	msg.add<uint16_t>(outfit.lookMount);
}

void ProtocolGameBase::checkCreatureAsKnown(uint32_t id, bool& known, uint32_t& removedKnown)
{
	auto result = knownCreatureSet.insert(id);
	if (!result.second) {
		known = true;
		return;
	}

	known = false;

	if (knownCreatureSet.size() > 1300) {
		// Look for a creature to remove
		for (auto it = knownCreatureSet.begin(), end = knownCreatureSet.end(); it != end; ++it) {
			Creature* creature = g_game.getCreatureByID(*it);
			if (!canSee(creature)) {
				removedKnown = *it;
				knownCreatureSet.erase(it);
				return;
			}
		}

		// Bad situation. Let's just remove anyone.
		auto it = knownCreatureSet.begin();
		if (*it == id) {
			++it;
		}

		removedKnown = *it;
		knownCreatureSet.erase(it);
	} else {
		removedKnown = 0;
	}
}

void ProtocolGameBase::AddCreature(NetworkMessage& msg, const Creature* creature, bool known, uint32_t remove)
{
	CreatureType_t creatureType = creature->getType();

	const Player* otherPlayer = creature->getPlayer();

	if (known) {
		msg.add<uint16_t>(0x62);
		msg.add<uint32_t>(creature->getID());
	} else {
		msg.add<uint16_t>(0x61);
		msg.add<uint32_t>(remove);
		msg.add<uint32_t>(creature->getID());
		msg.addByte(creatureType);
		
		if (player->getProtocolVersion() >= 1120) {
			if (creatureType == CREATURETYPE_SUMMONPLAYER) {
				const Creature* master = creature->getMaster();
				if (master) {
					msg.add<uint32_t>(master->getID());
				}
			}
		}

		msg.addString(creature->getName());
	}

	if (creature->isHealthHidden()) {
		msg.addByte(0x00);
	} else {
		msg.addByte(std::ceil((static_cast<double>(creature->getHealth()) / std::max<int32_t>(creature->getMaxHealth(), 1)) * 100));
	}

	msg.addByte(creature->getDirection());

	if (!creature->isInGhostMode() && !creature->isInvisible()) {
		AddOutfit(msg, creature->getCurrentOutfit());
	} else {
		static Outfit_t outfit;
		AddOutfit(msg, outfit);
	}

	LightInfo lightInfo;
	creature->getCreatureLight(lightInfo);
	msg.addByte(player->isAccessPlayer() ? 0xFF : lightInfo.level);
	msg.addByte(lightInfo.color);

	msg.add<uint16_t>(creature->getStepSpeed() / 2);

	msg.addByte(player->getSkullClient(creature));
	msg.addByte(player->getPartyShield(otherPlayer));

	if (!known) {
		msg.addByte(player->getGuildEmblem(otherPlayer));
	}

	if (player->getProtocolVersion() >= 1120) {
		if (creatureType == CREATURETYPE_MONSTER) {
			const Creature* master = creature->getMaster();
			if (master) {
				const Player* masterPlayer = master->getPlayer();
				if (masterPlayer) {
					creatureType = CREATURETYPE_SUMMONPLAYER;
				}
			}
		}
	}
	
	msg.addByte(creatureType); // Type (for summons)

	if (player->getProtocolVersion() >= 1120) {
		if (creatureType == CREATURETYPE_SUMMONPLAYER) {
			const Creature* master = creature->getMaster();
			if (master) {
				msg.add<uint32_t>(master->getID());
			}
		}
	}

	msg.addByte(creature->getSpeechBubble());
	msg.addByte(0xFF); // MARK_UNMARKED
	if (version >= 1110) {
		msg.addByte(0x00); // ??
	}

	if (otherPlayer) {
		msg.add<uint16_t>(otherPlayer->getHelpers());
	} else {
		msg.add<uint16_t>(0x00);
	}

	msg.addByte(player->canWalkthroughEx(creature) ? 0x00 : 0x01);
}

void ProtocolGameBase::AddPlayerStats(NetworkMessage& msg)
{
	msg.addByte(0xA0);

	msg.add<uint16_t>(std::min<int32_t>(player->getHealth(), std::numeric_limits<uint16_t>::max()));
	msg.add<uint16_t>(std::min<int32_t>(player->getMaxHealth(), std::numeric_limits<uint16_t>::max()));

	msg.add<uint32_t>(player->getFreeCapacity());
	msg.add<uint32_t>(player->getCapacity());

	msg.add<uint64_t>(player->getExperience());

	msg.add<uint16_t>(player->getLevel());
	msg.addByte(player->getLevelPercent());

	msg.add<uint16_t>(player->getBaseXpGain()); // base xp gain rate
	msg.add<uint16_t>(player->getVoucherXpBoost()); // xp voucher
	msg.add<uint16_t>(player->getGrindingXpBoost()); // low level bonus
	msg.add<uint16_t>(player->getStoreXpBoost()); // xp boost
	msg.add<uint16_t>(player->getStaminaXpBoost()); // stamina multiplier (100 = 1.0x)

	msg.add<uint16_t>(std::min<int32_t>(player->getMana(), std::numeric_limits<uint16_t>::max()));
	msg.add<uint16_t>(std::min<int32_t>(player->getMaxMana(), std::numeric_limits<uint16_t>::max()));

	msg.addByte(std::min<uint32_t>(player->getMagicLevel(), std::numeric_limits<uint8_t>::max()));
	msg.addByte(std::min<uint32_t>(player->getBaseMagicLevel(), std::numeric_limits<uint8_t>::max()));
	msg.addByte(player->getMagicLevelPercent());

	msg.addByte(player->getSoul());

	msg.add<uint16_t>(player->getStaminaMinutes());

	msg.add<uint16_t>(player->getBaseSpeed() / 2);

	Condition* condition = player->getCondition(CONDITION_REGENERATION);
	msg.add<uint16_t>(condition ? condition->getTicks() / 1000 : 0x00);

	msg.add<uint16_t>(player->getOfflineTrainingTime() / 60 / 1000);

	msg.add<uint16_t>(player->getExpBoostStamina()); // xp boost time (seconds)
	msg.addByte(1); // enables exp boost in the store
}

void ProtocolGameBase::AddPlayerSkills(NetworkMessage& msg)
{
	msg.addByte(0xA1);

	for (uint8_t i = SKILL_FIRST; i <= SKILL_FISHING; ++i) {
		msg.add<uint16_t>(std::min<int32_t>(player->getSkillLevel(i), std::numeric_limits<uint16_t>::max()));
		msg.add<uint16_t>(player->getBaseSkill(i));
		msg.addByte(player->getSkillPercent(i));
	}

	for (uint8_t i = SKILL_CRITICAL_HIT_CHANCE; i <= SKILL_LAST; ++i) {
		msg.add<uint16_t>(std::min<int32_t>(player->getSkillLevel(i), std::numeric_limits<uint16_t>::max()));
		msg.add<uint16_t>(player->getBaseSkill(i));
	}
}

void ProtocolGameBase::sendBlessStatus() {
	NetworkMessage msg;
	uint8_t blessCount = 0;
	uint8_t maxBlessings = (player->operatingSystem == CLIENTOS_NEW_WINDOWS) ? 8 : 6;
	for (int i = 1; i <= maxBlessings; i++) {
		if (player->hasBlessing(i)) {
			blessCount++;
		}
	}

	msg.addByte(0x9C);
	if (blessCount >= 5) {
		if (player->getProtocolVersion() >= 1120) {
			uint8_t blessFlag = 0;
			uint8_t maxFlag = (maxBlessings == 8) ? 256 : 64;
			for (int i = 2; i < maxFlag; i *= 2) {
				blessFlag += i;
			}

			msg.add<uint16_t>(blessFlag - 1);
		} else {
			msg.add<uint16_t>(0x01);
		}
	} else {
		msg.add<uint16_t>(0x00);
	}

	if (player->getProtocolVersion() >= 1120) {
		msg.addByte((blessCount >= 5) ? 2 : 1); // 1 = Disabled | 2 = normal | 3 = green
	}

	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendPremiumTrigger()
{
	if (!g_config.getBoolean(ConfigManager::FREE_PREMIUM)) {
		NetworkMessage msg;
		msg.addByte(0x9E);
		msg.addByte(16);
		for (uint16_t i = 0; i <= 15; i++) {
			//PREMIUM_TRIGGER_TRAIN_OFFLINE = false, PREMIUM_TRIGGER_XP_BOOST = false, PREMIUM_TRIGGER_MARKET = false, PREMIUM_TRIGGER_VIP_LIST = false, PREMIUM_TRIGGER_DEPOT_SPACE = false, PREMIUM_TRIGGER_INVITE_PRIVCHAT = false
			msg.addByte(0x01);
		}
		writeToOutputBuffer(msg);
	}
}

// Send preyInfo
void ProtocolGameBase::sendPreyData()
{
	NetworkMessage msg;
	for (int i = 0; i < 3; i++) {
		msg.addByte(0xE8);
		msg.addByte(i);

		msg.addByte(0x00);
		msg.addByte(0x00);
		msg.add<uint16_t>(0);
	}

	msg.addByte(0xEC);
	msg.addByte(0xEE);
	msg.addByte(0x0A);
	msg.add<uint64_t>(0);
	msg.addByte(0xEE);
	msg.addByte(0x01);
	msg.add<uint64_t>(0);
	msg.addByte(0xE9);
	msg.add<uint32_t>(0);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::AddWorldLight(NetworkMessage& msg, const LightInfo& lightInfo)
{
	msg.addByte(0x82);
	msg.addByte((player->isAccessPlayer() ? 0xFF : lightInfo.level));
	msg.addByte(lightInfo.color);
}

void ProtocolGameBase::AddCreatureLight(NetworkMessage& msg, const Creature* creature)
{
	LightInfo lightInfo;
	creature->getCreatureLight(lightInfo);

	msg.addByte(0x8D);
	msg.add<uint32_t>(creature->getID());
	msg.addByte((player->isAccessPlayer() ? 0xFF : lightInfo.level));
	msg.addByte(lightInfo.color);
}

bool ProtocolGameBase::canSee(const Creature* c) const
{
	if (!c || !player || c->isRemoved()) {
		return false;
	}

	if (!player->canSeeCreature(c)) {
		return false;
	}

	return canSee(c->getPosition());
}

bool ProtocolGameBase::canSee(const Position& pos) const
{
	return canSee(pos.x, pos.y, pos.z);
}

bool ProtocolGameBase::canSee(int32_t x, int32_t y, int32_t z) const
{
	if (!player) {
		return false;
	}

	const Position& myPos = player->getPosition();
	if (myPos.z <= 7) {
		//we are on ground level or above (7 -> 0)
		//view is from 7 -> 0
		if (z > 7) {
			return false;
		}
	} else if (myPos.z >= 8) {
		//we are underground (8 -> 15)
		//view is +/- 2 from the floor we stand on
		if (std::abs(myPos.getZ() - z) > 2) {
			return false;
		}
	}

	//negative offset means that the action taken place is on a lower floor than ourself
	int32_t offsetz = myPos.getZ() - z;
	if ((x >= myPos.getX() - 8 + offsetz) && (x <= myPos.getX() + 9 + offsetz) &&
			(y >= myPos.getY() - 6 + offsetz) && (y <= myPos.getY() + 7 + offsetz)) {
		return true;
	}
	return false;
}

//tile
void ProtocolGameBase::RemoveTileThing(NetworkMessage& msg, const Position& pos, uint32_t stackpos)
{
	if (stackpos >= 10) {
		return;
	}

	msg.addByte(0x6C);
	msg.addPosition(pos);
	msg.addByte(stackpos);
}

void ProtocolGameBase::sendChannelMessage(const std::string& author, const std::string& text, SpeakClasses type, uint16_t channel)
{
	NetworkMessage msg;
	msg.addByte(0xAA);
	msg.add<uint32_t>(0x00);
	msg.addString(author);
	msg.add<uint16_t>(0x00);
	msg.addByte(type);
	msg.add<uint16_t>(channel);
	msg.addString(text);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendUpdateTile(const Tile* tile, const Position& pos)
{
	if (!canSee(pos)) {
		return;
	}

	NetworkMessage msg;
	msg.addByte(0x69);
	msg.addPosition(pos);

	if (tile) {
		GetTileDescription(tile, msg);
		msg.addByte(0x00);
		msg.addByte(0xFF);
	} else {
		msg.addByte(0x01);
		msg.addByte(0xFF);
	}

	writeToOutputBuffer(msg);
}

void ProtocolGameBase::GetTileDescription(const Tile* tile, NetworkMessage& msg)
{
	msg.add<uint16_t>(0x00); //environmental effects

	int32_t count;
	Item* ground = tile->getGround();
	if (ground) {
		msg.addItem(ground);
		count = 1;
	}
	else {
		count = 0;
	}

	const TileItemVector* items = tile->getItemList();
	if (items) {
		for (auto it = items->getBeginTopItem(), end = items->getEndTopItem(); it != end; ++it) {
			msg.addItem(*it);

			count++;
			if (count == 9 && tile->getPosition() == player->getPosition()) {
				break;
			}
			else if (count == 10) {
				return;
			}
		}
	}

	const CreatureVector* creatures = tile->getCreatures();
	if (creatures) {
		bool playerAdded = false;
		for (const Creature* creature : boost::adaptors::reverse(*creatures)) {
			if (!player->canSeeCreature(creature)) {
				continue;
			}

			if (tile->getPosition() == player->getPosition() && count == 9 && !playerAdded) {
				creature = player;
			}

			if (creature->getID() == player->getID()) {
				playerAdded = true;
			}

			bool known;
			uint32_t removedKnown;
			checkCreatureAsKnown(creature->getID(), known, removedKnown);
			AddCreature(msg, creature, known, removedKnown);

			if (++count == 10) {
				return;
			}
		}
	}

	if (items) {
		for (auto it = items->getBeginDownItem(), end = items->getEndDownItem(); it != end; ++it) {
			msg.addItem(*it);

			if (++count == 10) {
				return;
			}
		}
	}
}

void ProtocolGameBase::GetMapDescription(int32_t x, int32_t y, int32_t z, int32_t width, int32_t height, NetworkMessage& msg)
{
	int32_t skip = -1;
	int32_t startz, endz, zstep;

	if (z > 7) {
		startz = z - 2;
		endz = std::min<int32_t>(MAP_MAX_LAYERS - 1, z + 2);
		zstep = 1;
	} else {
		startz = 7;
		endz = 0;
		zstep = -1;
	}

	for (int32_t nz = startz; nz != endz + zstep; nz += zstep) {
		GetFloorDescription(msg, x, y, nz, width, height, z - nz, skip);
	}

	if (skip >= 0) {
		msg.addByte(skip);
		msg.addByte(0xFF);
	}
}

void ProtocolGameBase::GetFloorDescription(NetworkMessage& msg, int32_t x, int32_t y, int32_t z, int32_t width, int32_t height, int32_t offset, int32_t& skip)
{
	for (int32_t nx = 0; nx < width; nx++) {
		for (int32_t ny = 0; ny < height; ny++) {
			Tile* tile = g_game.map.getTile(x + nx + offset, y + ny + offset, z);
			if (tile) {
				if (skip >= 0) {
					msg.addByte(skip);
					msg.addByte(0xFF);
				}

				skip = 0;
				GetTileDescription(tile, msg);
			} else if (skip == 0xFE) {
				msg.addByte(0xFF);
				msg.addByte(0xFF);
				skip = -1;
			} else {
				++skip;
			}
		}
	}
}

void ProtocolGameBase::sendContainer(uint8_t cid, const Container* container, bool hasParent, uint16_t firstIndex)
{
	NetworkMessage msg;
	msg.addByte(0x6E);

	msg.addByte(cid);

	if (container->getID() == ITEM_BROWSEFIELD) {
		msg.addItem(1987, 1);
		msg.addString("Browse Field");
	} else {
		msg.addItem(container);
		msg.addString(container->getName());
	}

	msg.addByte(container->capacity());

	msg.addByte(hasParent ? 0x01 : 0x00);

	msg.addByte(container->isUnlocked() ? 0x01 : 0x00); // Drag and drop
	msg.addByte(container->hasPagination() ? 0x01 : 0x00); // Pagination

	uint32_t containerSize = container->size();
	msg.add<uint16_t>(containerSize);
	msg.add<uint16_t>(firstIndex);

	uint32_t maxItemsToSend;

	if (container->hasPagination() && firstIndex > 0) {
		maxItemsToSend = std::min<uint32_t>(container->capacity(), containerSize - firstIndex);
	} else {
		maxItemsToSend = container->capacity();
	}

	if (firstIndex >= containerSize) {
		msg.addByte(0x00);
	} else {
		msg.addByte(std::min<uint32_t>(maxItemsToSend, containerSize));

		uint32_t i = 0;
		const ItemDeque& itemList = container->getItemList();
		for (ItemDeque::const_iterator it = itemList.begin() + firstIndex, end = itemList.end(); i < maxItemsToSend && it != end; ++it, ++i) {
			msg.addItem(*it);
		}
	}
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendChannel(uint16_t channelId, const std::string& channelName, const UsersMap* channelUsers, const InvitedMap* invitedUsers)
{
	NetworkMessage msg;
	msg.addByte(0xAC);

	msg.add<uint16_t>(channelId);
	msg.addString(channelName);

	if (channelUsers) {
		msg.add<uint16_t>(channelUsers->size());
		for (const auto& it : *channelUsers) {
			msg.addString(it.second->getName());
		}
	} else {
		msg.add<uint16_t>(0x00);
	}

	if (invitedUsers) {
		msg.add<uint16_t>(invitedUsers->size());
		for (const auto& it : *invitedUsers) {
			msg.addString(it.second->getName());
		}
	} else {
		msg.add<uint16_t>(0x00);
	}
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendMagicEffect(const Position& pos, uint8_t type)
{
	if (!canSee(pos)) {
		return;
	}

	NetworkMessage msg;
	msg.addByte(0x83);
	msg.addPosition(pos);
	msg.addByte(type);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendUnjustifiedPoints(const uint8_t& dayProgress, const uint8_t& dayLeft, const uint8_t& weekProgress, const uint8_t& weekLeft, const uint8_t& monthProgress, const uint8_t& monthLeft, const uint8_t& skullDuration)
{
	NetworkMessage msg;
	msg.addByte(0xB7);
	msg.addByte(dayProgress);
	msg.addByte(dayLeft);
	msg.addByte(weekProgress);
	msg.addByte(weekLeft);
	msg.addByte(monthProgress);
	msg.addByte(monthLeft);
	msg.addByte(skullDuration);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendAddCreature(const Creature* creature, const Position& pos, int32_t stackpos, bool isLogin)
{
	if (!canSee(pos)) {
		return;
	}

	if (creature != player) {
		if (stackpos >= 10) {
			return;
		}

			NetworkMessage msg;
			msg.addByte(0x6A);
			msg.addPosition(pos);
			msg.addByte(stackpos);

			bool known;
			uint32_t removedKnown;
			checkCreatureAsKnown(creature->getID(), known, removedKnown);
			AddCreature(msg, creature, known, removedKnown);
			writeToOutputBuffer(msg);

		if (isLogin) {
			sendMagicEffect(pos, CONST_ME_TELEPORT);
		}

		return;
	}

	NetworkMessage msg;
	msg.addByte(0x17);

	msg.add<uint32_t>(player->getID());
	msg.add<uint16_t>(0x32); // beat duration (50)

	msg.addDouble(Creature::speedA, 3);
	msg.addDouble(Creature::speedB, 3);
	msg.addDouble(Creature::speedC, 3);

	// can report bugs?
	if (player->getAccountType() >= ACCOUNT_TYPE_NORMAL) {
		msg.addByte(0x01);
	} else {
		msg.addByte(0x00);
	}

	msg.addByte(0x00); // can change pvp framing option
	msg.addByte(0x00); // expert mode button enabled

	msg.addString(g_config.getString(ConfigManager::STORE_IMAGES_URL));
	msg.add<uint16_t>(static_cast<uint16_t>(g_config.getNumber(ConfigManager::STORE_COIN_PACKET)));

	writeToOutputBuffer(msg);

	sendPendingStateEntered();
	sendEnterWorld();
	sendMapDescription(pos);
	loggedIn = true;

	if (isLogin) {
		sendMagicEffect(pos, CONST_ME_TELEPORT);
	}

	sendInventoryItem(CONST_SLOT_HEAD, player->getInventoryItem(CONST_SLOT_HEAD));
	sendInventoryItem(CONST_SLOT_NECKLACE, player->getInventoryItem(CONST_SLOT_NECKLACE));
	sendInventoryItem(CONST_SLOT_BACKPACK, player->getInventoryItem(CONST_SLOT_BACKPACK));
	sendInventoryItem(CONST_SLOT_ARMOR, player->getInventoryItem(CONST_SLOT_ARMOR));
	sendInventoryItem(CONST_SLOT_RIGHT, player->getInventoryItem(CONST_SLOT_RIGHT));
	sendInventoryItem(CONST_SLOT_LEFT, player->getInventoryItem(CONST_SLOT_LEFT));
	sendInventoryItem(CONST_SLOT_LEGS, player->getInventoryItem(CONST_SLOT_LEGS));
	sendInventoryItem(CONST_SLOT_FEET, player->getInventoryItem(CONST_SLOT_FEET));
	sendInventoryItem(CONST_SLOT_RING, player->getInventoryItem(CONST_SLOT_RING));
	sendInventoryItem(CONST_SLOT_AMMO, player->getInventoryItem(CONST_SLOT_AMMO));
	sendInventoryItem(CONST_SLOT_STORE_INBOX, player->getInventoryItem(CONST_SLOT_STORE_INBOX));

	sendStats();
	sendSkills();
	sendBlessStatus();
	sendPremiumTrigger();
	sendStoreHighlight();

	//gameworld light-settings
	LightInfo lightInfo;
	g_game.getWorldLightInfo(lightInfo);
	sendWorldLight(lightInfo);

	//player light level
	sendCreatureLight(creature);

	const std::forward_list<VIPEntry>& vipEntries = IOLoginData::getVIPEntries(player->getAccount());

	if (player->isAccessPlayer()) {
		for (const VIPEntry& entry : vipEntries) {
			VipStatus_t vipStatus;

			Player* vipPlayer = g_game.getPlayerByGUID(entry.guid);
			if (!vipPlayer) {
				vipStatus = VIPSTATUS_OFFLINE;
			} else {
				vipStatus = VIPSTATUS_ONLINE;
			}

			sendVIP(entry.guid, entry.name, entry.description, entry.icon, entry.notify, vipStatus);
		}
	} else {
		for (const VIPEntry& entry : vipEntries) {
			VipStatus_t vipStatus;

			Player* vipPlayer = g_game.getPlayerByGUID(entry.guid);
			if (!vipPlayer || vipPlayer->isInGhostMode()) {
				vipStatus = VIPSTATUS_OFFLINE;
			} else {
				vipStatus = VIPSTATUS_ONLINE;
			}

			sendVIP(entry.guid, entry.name, entry.description, entry.icon, entry.notify, vipStatus);
		}
	}

	sendBasicData();
	sendInventoryClientIds();
	sendPreyData();
	if (player->getProtocolVersion() >= 1130) {
		player->sendClientCheck();
		player->sendGameNews();
	}
	player->sendIcons();
}

void ProtocolGameBase::sendStats()
{
	NetworkMessage msg;
	AddPlayerStats(msg);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendStoreHighlight()
{
	NetworkMessage msg;
	bool haveSale = g_game.gameStore.haveCategoryByState(StoreState_t::SALE);
	bool haveNewItem = g_game.gameStore.haveCategoryByState(StoreState_t::NEW);
	msg.addByte(0x19);
	msg.addByte((haveSale) ? 1 : 0);
	msg.addByte((haveNewItem) ? 1 : 0);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendBasicData()
{
	NetworkMessage msg;
	msg.addByte(0x9F);
	if (player->isPremium()) {
		msg.addByte(1);
		msg.add<uint32_t>(time(nullptr) + (player->premiumDays * 86400));
	} else {
		msg.addByte(0);
		msg.add<uint32_t>(0);
	}
	msg.addByte(player->getVocation()->getClientId());

	// Prey window
	if (player->getVocation()->getId() == 0) {
		msg.addByte(0);
	} else {
		msg.addByte(1); // has reached Main (allow player to open Prey window)
	}

	msg.add<uint16_t>(0xFF); // number of known spells
	for (uint8_t spellId = 0x00; spellId < 0xFF; spellId++) {
		msg.addByte(spellId);
	}
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendPendingStateEntered()
{
	NetworkMessage msg;
	msg.addByte(0x0A);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendEnterWorld()
{
	NetworkMessage msg;
	msg.addByte(0x0F);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendInventoryItem(slots_t slot, const Item* item)
{
	NetworkMessage msg;
	if (item) {
		msg.addByte(0x78);
		msg.addByte(slot);
		msg.addItem(item);
	} else {
		msg.addByte(0x79);
		msg.addByte(slot);
	}
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendInventoryClientIds()
{
	std::map<uint16_t, uint16_t> items = player->getInventoryClientIds();

	NetworkMessage msg;
	msg.addByte(0xF5);
	msg.add<uint16_t>(items.size() + 11);

	for (uint16_t i = 1; i <= 11; i++) {
		msg.add<uint16_t>(i);
		msg.addByte(0x00);
		msg.add<uint16_t>(0x01);
	}

	for (const auto& it : items) {
		msg.add<uint16_t>(it.first);
		msg.addByte(0x00);
		msg.add<uint16_t>(it.second);
	}
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendSkills()
{
	NetworkMessage msg;
	AddPlayerSkills(msg);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendCreatureLight(const Creature* creature)
{
	if (!canSee(creature)) {
		return;
	}

	NetworkMessage msg;
	AddCreatureLight(msg, creature);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendWorldLight(const LightInfo& lightInfo)
{
	NetworkMessage msg;
	AddWorldLight(msg, lightInfo);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendMapDescription(const Position& pos)
{
	NetworkMessage msg;
	msg.addByte(0x64);
	msg.addPosition(player->getPosition());
	GetMapDescription(pos.x - 8, pos.y - 6, pos.z, 18, 14, msg);
	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendVIP(uint32_t guid, const std::string& name, const std::string& description, uint32_t icon, bool notify, VipStatus_t status)
{
	NetworkMessage msg;
	msg.addByte(0xD2);
	msg.add<uint32_t>(guid);
	msg.addString(name);
	msg.addString(description);
	msg.add<uint32_t>(std::min<uint32_t>(10, icon));
	msg.addByte(notify ? 0x01 : 0x00);
	msg.addByte(status);
	if (version >= 1110) {
		msg.addByte(0x00); // ??
	}

	writeToOutputBuffer(msg);
}

void ProtocolGameBase::sendCancelWalk()
{
	if (player) {
		NetworkMessage msg;
		msg.addByte(0xB5);
		msg.addByte(player->getDirection());
		writeToOutputBuffer(msg);
	}
}

void ProtocolGameBase::sendPing()
{
	if (player) {
		NetworkMessage msg;
		msg.addByte(0x1D);
		writeToOutputBuffer(msg);
	}
}

void ProtocolGameBase::sendPingBack()
{
	NetworkMessage msg;
	msg.addByte(0x1E);
	writeToOutputBuffer(msg, false);
}

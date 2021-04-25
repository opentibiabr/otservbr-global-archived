/**
 * @file npc.cpp
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

#include "../../otpch.h"

#include "npc.h"
#include "npcs.h"
#include "../../config/configmanager.h"
#include "../../lua/callbacks/creaturecallback.h"
#include "../../game/game.h"
#include "../combat/spells.h"
#include "../../lua/creature/events.h"
#include "../../utils/enums.h"

extern Game g_game;
extern Npcs g_npcs;
extern Events* g_events;
extern ConfigManager g_config;

int32_t Npc::despawnRange;
int32_t Npc::despawnRadius;

uint32_t Npc::npcAutoID = 0x80000000;

Npc* Npc::createNpc(const std::string& name)
{
	NpcType* npcType = g_npcs.getNpcType(name);
	if (!npcType) {
		return nullptr;
	}
	return new Npc(npcType);
}

Npc::Npc(NpcType* npcType) :
	Creature(),
	strDescription(npcType->nameDescription),
	npcType(npcType)
{
	defaultOutfit = npcType->info.outfit;
	currentOutfit = npcType->info.outfit;
	float multiplier = g_config.getFloat(ConfigManager::RATE_NPC_HEALTH);
	health = npcType->info.health*multiplier;
	healthMax = npcType->info.healthMax*multiplier;
	baseSpeed = npcType->info.baseSpeed;
	internalLight = npcType->info.light;
	floorChange = npcType->info.floorChange;

	// register creature events
	for (const std::string& scriptName : npcType->info.scripts) {
		if (!registerCreatureEvent(scriptName)) {
			SPDLOG_WARN("Unknown event name: {}", scriptName);
		}
	}
}

Npc::~Npc() {
}

void Npc::addList()
{
	g_game.addNpc(this);
}

void Npc::removeList()
{
	g_game.removeNpc(this);
}

bool Npc::canSee(const Position& pos) const
{
	if (pos.z != getPosition().z) {
		return false;
	}
	return Creature::canSee(getPosition(), pos, 4, 4);
}

void Npc::onCreatureAppear(Creature* creature, bool isLogin)
{
	Creature::onCreatureAppear(creature, isLogin);

	// onCreatureAppear(self, creature)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.creatureAppearEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(creature);
	}

	if (callback.persistLuaState()) {
		return;
	}
}

void Npc::onRemoveCreature(Creature* creature, bool isLogout)
{
	Creature::onRemoveCreature(creature, isLogout);

	// onCreatureDisappear(self, creature)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.creatureDisappearEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(creature);
	}

	if (callback.persistLuaState()) {
		return;
	}

	if (creature != this) {
		updatePlayerInteractions(creature->getPlayer());
		return;
	}

	if (spawnNpc) {
		spawnNpc->startSpawnNpcCheck();
	}

	shopPlayerSet.clear();
}

void Npc::onCreatureMove(Creature* creature, const Tile* newTile, const Position& newPos,
							 const Tile* oldTile, const Position& oldPos, bool teleport)
{
	Creature::onCreatureMove(creature, newTile, newPos, oldTile, oldPos, teleport);

	// onCreatureMove(self, creature, oldPosition, newPosition)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.creatureMoveEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(creature);
		callback.pushPosition(oldPos);
		callback.pushPosition(newPos);
	}

	if (callback.persistLuaState()) {
		return;
	}

	if (creature == this && !canSee(oldPos)) {
		resetPlayerInteractions();
		closeAllShopWindows();
		return;
	}

	Player *player = creature->getPlayer();
	if (player && !canSee(newPos) && canSee(oldPos)) {
		updatePlayerInteractions(player);
		player->closeShopWindow(true);
	}
}

void Npc::onCreatureSay(Creature* creature, SpeakClasses type, const std::string& text)
{
	Creature::onCreatureSay(creature, type, text);

	if (!creature->getPlayer()) {
		return;
	}

	// onCreatureSay(self, creature, type, message)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.creatureSayEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(creature);
		callback.pushNumber(type);
		callback.pushString(text);
	}

	if (callback.persistLuaState()) {
		return;
	}
}

void Npc::onThink(uint32_t interval)
{
	Creature::onThink(interval);

	// onThink(self, interval)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.thinkEvent)) {
		callback.pushNumber(interval);
	}

	if (callback.persistLuaState()) {
		return;
	}

	if (!npcType->canSpawn(position)) {
		g_game.removeCreature(this);
	}

	if (!isInSpawnRange(position)) {
		g_game.internalTeleport(this, masterPos);
		resetPlayerInteractions();
		closeAllShopWindows();
	}

	onThinkYell(interval);
	onThinkWalk(interval);
}

void Npc::onPlayerBuyItem(Player* player, uint16_t serverId,
                          uint8_t subType, uint8_t amount, bool ignore, bool inBackpacks)
{
	const ItemType& itemType = Item::items[serverId];

	if (getShopItems().find(serverId) == getShopItems().end()) {
		return;
	}

	ShopInfo shopInfo = getShopItems()[serverId];
	int64_t totalCost = shopInfo.buyPrice * amount;
	if (getCurrency() == ITEM_GOLD_COIN) {
		if (!g_game.removeMoney(player, totalCost, 0, true)) {
			return;
		}
	} else if(!player->removeItemOfType(getCurrency(), shopInfo.buyPrice, subType, false)) {
		return;
	}

	// onPlayerBuyItem(self, player, itemId, subType, amount, ignore, inBackpacks)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.playerBuyEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(player);
		callback.pushNumber(serverId);
		callback.pushNumber(subType);
		callback.pushNumber(amount);
		callback.pushBoolean(inBackpacks);
		callback.pushString(itemType.name);
		callback.pushNumber(totalCost);
	}

	if (callback.persistLuaState()) {
		return;
	}
}

void Npc::onPlayerSellItem(Player* player, uint16_t serverId,
                          uint8_t subType, uint8_t amount, bool ignore)
{
	const ItemType& itemType = Item::items[serverId];

	if (getShopItems().find(serverId) == getShopItems().end()) {
		return;
	}

	ShopInfo shopInfo = getShopItems()[serverId];

	if(!player->removeItemOfType(serverId, amount, subType, false)) {
		return;
	}

	int64_t totalCost = shopInfo.sellPrice * amount;
	g_game.addMoney(player, totalCost, 0);

	// onPlayerSellItem(self, player, itemId, subType, amount, ignore)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.playerSellEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(player);
		callback.pushNumber(amount);
		callback.pushString(itemType.name);
		callback.pushNumber(totalCost);
		callback.pushNumber(itemType.clientId);
	}

	if (callback.persistLuaState()) {
		return;
	}
}

void Npc::onPlayerCheckItem(Player* player, uint16_t serverId,
                          uint8_t subType)
{
	const ItemType& itemType = Item::items[serverId];
	// onPlayerCheckItem(self, player, clientId, subType)
	CreatureCallback callback = CreatureCallback(npcType->info.scriptInterface, this);
	if (callback.startScriptInterface(npcType->info.playerLookEvent)) {
		callback.pushSpecificCreature(this);
		callback.pushCreature(player);
		callback.pushNumber(serverId);
		callback.pushNumber(subType);
	}

	if (callback.persistLuaState()) {
		return;
	}
}

void Npc::onThinkYell(uint32_t interval)
{
	if (npcType->info.yellSpeedTicks == 0) {
		return;
	}

	yellTicks += interval;
	if (yellTicks >= npcType->info.yellSpeedTicks) {
		yellTicks = 0;

		if (!npcType->info.voiceVector.empty() && (npcType->info.yellChance >= static_cast<uint32_t>(uniform_random(1, 100)))) {
			uint32_t index = uniform_random(0, npcType->info.voiceVector.size() - 1);
			const voiceBlock_t& vb = npcType->info.voiceVector[index];

			if (vb.yellText) {
				g_game.internalCreatureSay(this, TALKTYPE_YELL, vb.text, false);
			} else {
				g_game.internalCreatureSay(this, TALKTYPE_SAY, vb.text, false);
			}
		}
	}
}

void Npc::onThinkWalk(uint32_t interval)
{
	if (npcType->info.walkInterval == 0 || baseSpeed == 0) {
		return;
	}

	// If talking, no walking
	if (playerInteractions.size() > 0) {
		walkTicks = 0;
		eventWalk = 0;
		return;
	}

	walkTicks += interval;
	if (walkTicks < npcType->info.walkInterval) {
		return;
	}

	Direction dir = Position::getRandomDirection();
	if (canWalkTo(getPosition(), dir)) {
		listWalkDir.push_front(dir);
		addEventWalk();
	}

	walkTicks = 0;
}

void Npc::onPlacedCreature()
{
	addEventWalk();
}

bool Npc::isInSpawnRange(const Position& pos) const
{
	if (!spawnNpc) {
		return true;
	}

	if (Npc::despawnRadius == 0) {
		return true;
	}

	if (!SpawnsNpc::isInZone(masterPos, Npc::despawnRadius, pos)) {
		return false;
	}

	if (Npc::despawnRange == 0) {
		return true;
	}

	if (Position::getDistanceZ(pos, masterPos) > Npc::despawnRange) {
		return false;
	}

	return true;
}

void Npc::setPlayerInteraction(uint32_t playerId, uint16_t topicId /*= 0*/) {
	Creature* creature = g_game.getCreatureByID(playerId);
	if (!creature) {
	  return;
	}

	turnToCreature(creature);

	playerInteractions[playerId] = topicId;
}

void Npc::updatePlayerInteractions(Player* player) {
	if (player && !canSee(player->getPosition())) {
		removePlayerInteraction(player->getID());
	}
}

void Npc::removePlayerInteraction(uint32_t playerId) {
	if (playerInteractions.find(playerId) != playerInteractions.end()) {
		playerInteractions.erase(playerId);
	}
}

void Npc::resetPlayerInteractions() {
	playerInteractions.clear();
}

bool Npc::canWalkTo(const Position& fromPos, Direction dir) const
{
	if (npcType->info.walkRadius == 0) {
		return false;
	}

	Position toPos = getNextPosition(dir, fromPos);
	if (!SpawnsNpc::isInZone(masterPos, npcType->info.walkRadius, toPos)) {
		return false;
	}

	Tile* toTile = g_game.map.getTile(toPos);
	if (!toTile || toTile->queryAdd(0, *this, 1, 0) != RETURNVALUE_NOERROR) {
		return false;
	}

	if (!floorChange && (toTile->hasFlag(TILESTATE_FLOORCHANGE) || toTile->getTeleportItem())) {
		return false;
	}

	if (!ignoreHeight && toTile->hasHeight(1)) {
		return false;
	}

	return true;
}

bool Npc::getNextStep(Direction& nextDirection, uint32_t& flags) {
	return Creature::getNextStep(nextDirection, flags);
}

void Npc::addShopPlayer(Player* player)
{
	shopPlayerSet.insert(player);
}

void Npc::removeShopPlayer(Player* player)
{
	if (player) {
		shopPlayerSet.erase(player);
	}
}

void Npc::closeAllShopWindows()
{
	for (auto shopPlayer : shopPlayerSet) {
		if (shopPlayer) {
			shopPlayer->closeShopWindow();
		}
	}
	shopPlayerSet.clear();
}

void Npc::onPlayerCloseChannel(Player* player)
{
	player->closeShopWindow(true);
}

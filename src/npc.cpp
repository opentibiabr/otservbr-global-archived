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

#include "otpch.h"

#include "npc.h"
#include "npcs.h"
#include "configmanager.h"
#include "game.h"
#include "spells.h"
#include "events.h"
#include "enums.h"

extern Game g_game;
extern Npcs g_npcs;
extern Events* g_events;
extern ConfigManager g_config;

int32_t Npc::despawnRange;
int32_t Npc::despawnRadius;

uint32_t Npc::npcAutoID = 0x40000000;

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
	strDescription(asLowerCaseString(npcType->nameDescription)),
	npcType(npcType)
{
	defaultOutfit = npcType->info.outfit;
	currentOutfit = npcType->info.outfit;
	skull = npcType->info.skull;
	float multiplier = g_config.getFloat(ConfigManager::RATE_NPC_HEALTH);
	health = npcType->info.health*multiplier;
	healthMax = npcType->info.healthMax*multiplier;
	baseSpeed = npcType->info.baseSpeed;
	internalLight = npcType->info.light;
	hiddenHealth = npcType->info.hiddenHealth;

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

	if (npcType->info.creatureAppearEvent != -1) {
		// onCreatureAppear(self, creature)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			SPDLOG_ERROR("Npc {} creature {} - Call stack overflow. Too many lua script calls being nested.", getName(), creature->getName());
			return;
		}

		ScriptEnvironment* env = scriptInterface->getScriptEnv();
		env->setScriptId(npcType->info.creatureAppearEvent, scriptInterface);

		lua_State* L = scriptInterface->getLuaState();
		scriptInterface->pushFunction(npcType->info.creatureAppearEvent);

		LuaScriptInterface::pushUserdata<Npc>(L, this);
		LuaScriptInterface::setMetatable(L, -1, "Npc");

		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);

		if (scriptInterface->callFunction(2)) {
			return;
		}
	}

	if (creature == this) {
		g_game.addCreatureCheck(this);
	}
}

void Npc::onRemoveCreature(Creature* creature, bool isLogout)
{
	Creature::onRemoveCreature(creature, isLogout);

	if (npcType->info.creatureDisappearEvent != -1) {
		// onCreatureDisappear(self, creature)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			SPDLOG_ERROR("Npc {} creature {} - Call stack overflow. Too many lua script calls being nested.", getName(), creature->getName());
			return;
		}

		ScriptEnvironment* env = scriptInterface->getScriptEnv();
		env->setScriptId(npcType->info.creatureDisappearEvent, scriptInterface);

		lua_State* L = scriptInterface->getLuaState();
		scriptInterface->pushFunction(npcType->info.creatureDisappearEvent);

		LuaScriptInterface::pushUserdata<Npc>(L, this);
		LuaScriptInterface::setMetatable(L, -1, "Npc");

		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);

		if (scriptInterface->callFunction(2)) {
			return;
		}
	}

	if (creature == this) {
		if (spawnNpc) {
			spawnNpc->startSpawnNpcCheck();
		}

		Game::removeCreatureCheck(this);
	} else {
		updatePlayerInteractions(creature->getPlayer());
	}
}

void Npc::onCreatureMove(Creature* creature, const Tile* newTile, const Position& newPos,
							 const Tile* oldTile, const Position& oldPos, bool teleport)
{
	Creature::onCreatureMove(creature, newTile, newPos, oldTile, oldPos, teleport);

	if (npcType->info.creatureMoveEvent != -1) {
		// onCreatureMove(self, creature, oldPosition, newPosition)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			SPDLOG_ERROR("Npc {} creature {} - Call stack overflow. Too many lua script calls being nested.", getName(), creature->getName());
			return;
		}

		ScriptEnvironment* env = scriptInterface->getScriptEnv();
		env->setScriptId(npcType->info.creatureMoveEvent, scriptInterface);

		lua_State* L = scriptInterface->getLuaState();
		scriptInterface->pushFunction(npcType->info.creatureMoveEvent);

		LuaScriptInterface::pushUserdata<Npc>(L, this);
		LuaScriptInterface::setMetatable(L, -1, "Npc");

		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);

		LuaScriptInterface::pushPosition(L, oldPos);
		LuaScriptInterface::pushPosition(L, newPos);

		if (scriptInterface->callFunction(4)) {
			return;
		}
	}


	if (creature == this && !canSee(oldPos)) {
	  resetPlayerInteractions();
	} else if (!canSee(newPos) && canSee(oldPos)) {
		updatePlayerInteractions(creature->getPlayer());
	}
}

void Npc::onCreatureSay(Creature* creature, SpeakClasses type, const std::string& text)
{
	Creature::onCreatureSay(creature, type, text);

	if (npcType->info.creatureSayEvent != -1) {
		// onCreatureSay(self, creature, type, message)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			SPDLOG_ERROR("Npc {} creature {} - Call stack overflow. Too many lua script calls being nested.", getName(), creature->getName());
			return;
		}

		ScriptEnvironment* env = scriptInterface->getScriptEnv();
		env->setScriptId(npcType->info.creatureSayEvent, scriptInterface);

		lua_State* L = scriptInterface->getLuaState();
		scriptInterface->pushFunction(npcType->info.creatureSayEvent);

		LuaScriptInterface::pushUserdata<Npc>(L, this);
		LuaScriptInterface::setMetatable(L, -1, "Npc");

		LuaScriptInterface::pushUserdata<Creature>(L, creature);
		LuaScriptInterface::setCreatureMetatable(L, -1, creature);

		lua_pushnumber(L, type);
		LuaScriptInterface::pushString(L, text);

		scriptInterface->callVoidFunction(4);
	}
}

void Npc::onThink(uint32_t interval)
{
	Creature::onThink(interval);

	if (npcType->info.thinkEvent != -1) {
		// onThink(self, interval)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			SPDLOG_ERROR("Npc {} - Call stack overflow. Too many lua script calls being nested.", getName());
			return;
		}

		ScriptEnvironment* env = scriptInterface->getScriptEnv();
		env->setScriptId(npcType->info.thinkEvent, scriptInterface);

		lua_State* L = scriptInterface->getLuaState();
		scriptInterface->pushFunction(npcType->info.thinkEvent);

		LuaScriptInterface::pushUserdata<Npc>(L, this);
		LuaScriptInterface::setMetatable(L, -1, "Npc");

		lua_pushnumber(L, interval);

		if (scriptInterface->callFunction(2)) {
			return;
		}
	}

	if (!npcType->canSpawn(position)) {
		g_game.removeCreature(this);
	}

	if (!isInSpawnRange(position)) {
		g_game.internalTeleport(this, masterPos);
		resetPlayerInteractions();
	}

	onThinkYell(interval);
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

	if (playerInteractions.size() == 0) {
		Game::removeCreatureCheck(this);
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

	if (playerInteractions.size() == 0) {
		g_game.addCreatureCheck(this);
	}
}

void Npc::resetPlayerInteractions() {
	playerInteractions.clear();
	g_game.addCreatureCheck(this);
}

bool Npc::getNextStep(Direction& nextDirection, uint32_t& flags)
{
	// If talking, no walking
	if (playerInteractions.size() > 0) {
		eventWalk = 0;
		return false;
	}

	return Creature::getNextStep(nextDirection, flags);
}

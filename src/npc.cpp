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
	strDescription(asUpperCaseString(npcType->nameDescription)),
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
			std::cout << "[Warning - Npc::Npc] Unknown event name: " << scriptName << std::endl;
		}
	}
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
			std::cout << "[Error - Npc::onCreatureAppear"
				<< " Npc "
				<< getName()
				<< " creature "
				<< creature->getName()
				<< "] Call stack overflow. Too many lua script calls being nested."
				<< std::endl;
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
}

void Npc::onRemoveCreature(Creature* creature, bool isLogout)
{
	Creature::onRemoveCreature(creature, isLogout);

	if (npcType->info.creatureDisappearEvent != -1) {
		// onCreatureDisappear(self, creature)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			std::cout << "[Error - Npc::onCreatureDisappear"
				<< " Npc "
				<< getName()
				<< " creature "
				<< creature->getName()
				<< "] Call stack overflow. Too many lua script calls being nested."
				<< std::endl;
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

		setIdle(false);
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
			std::cout << "[Error - Npc::onCreatureMove"
				<< " Npc "
				<< getName()
				<< " creature "
				<< creature->getName()
				<< "] Call stack overflow. Too many lua script calls being nested."
				<< std::endl;
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
			std::cout << "[Error - Npc::onCreatureSay"
				<< " Npc "
				<< getName()
				<< " creature "
				<< creature->getName()
				<< "] Call stack overflow. Too many lua script calls being nested."
				<< std::endl;
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

void Npc::setIdle(bool idle)
{
	if (isRemoved()) {
		return;
	}

	isIdle = idle;

	if (!isIdle) {
		Game::addCreatureCheck(this);
	} else {
		Game::removeCreatureCheck(this);
	}
}

void Npc::onThink(uint32_t interval)
{
	Creature::onThink(interval);

	if (npcType->info.thinkEvent != -1) {
		// onThink(self, interval)
		LuaScriptInterface* scriptInterface = npcType->info.scriptInterface;
		if (!scriptInterface->reserveScriptEnv()) {
			std::cout << "[Error - Npc::onThink"
				<< " Npc "
				<< getName()
				<< "] Call stack overflow. Too many lua script calls being nested."
				<< std::endl;
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
	} else if (!isIdle) {
		addEventWalk();
	}
}

bool Npc::getNextStep(Direction& nextDirection, uint32_t& flags)
{
	if (isIdle) {
		eventWalk = 0;
		return false;
	}

	return Creature::getNextStep(nextDirection, flags);
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

void Npc::addPlayerInteraction(uint32_t playerId) {
	Creature* creature = g_game.getCreatureByID(playerId);
	if (!creature) {
	  return;
	}

  if (playerInteractions.size() == 0) {
    setIdle(true);
  }

  turnToCreature(creature);

  playerInteractions[playerId] = 0;
}

void Npc::updatePlayerInteractions(Player* player) {
		if (player && !canSee(player->getPosition())) {
      removePlayerInteraction(player->getID());
		}
}

void Npc::resetPlayerInteractions() {
		playerInteractions.clear();
		setIdle(false);
}

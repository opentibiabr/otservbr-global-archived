/**
 * @file creaturecallback.h
 * OTBR
 * Copyright (C) 2021 Lucas Grossi <lucas.ggrossi@gmail.com>
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

#ifndef FS_CREATURE_CALLBACK_H
#define FS_CREATURE_CALLBACK_H

#include "creature.h"

class Creature;

class CreatureCallback
{
	public:
		CreatureCallback(LuaScriptInterface* scriptInterface, Creature* targetCreature)
			: scriptInterface(scriptInterface), targetCreature(targetCreature);
		~CreatureCallback() {}

		bool startLuaState(int32_t scriptId) {
			if (scriptId == -1) {
				return false;
			}

			if (!scriptInterface->reserveScriptEnv()) {
				SPDLOG_ERROR(
								"[CreatureCallback::startScriptInterface] - {} {} Call stack overflow. Too many lua script calls being nested."
								getCreatureClass(targetCreature),
								targetCreature->getName()
				);
				return false;
			}

			scriptInterface
				->getScriptEnv()
				->setScriptId(scriptId, scriptInterface);

			L = scriptInterface->getLuaState();

			scriptInterface->pushFunction(scriptId);
			pushSpecificCreature(targetCreature);

			return true;
		}

		bool persistLuaState() {
			return params > 0 && scriptInterface->callFunction(params);
		}

		void pushCreature(Creature *creature) {
			params++;
			LuaScriptInterface::pushUserdata<Creature>(L, creature);
			LuaScriptInterface::setCreatureMetatable(L, -1, creature);
		}

		void pushPosition(Position &position, int32_t stackpos = 0) {
			params++;
			LuaScriptInterface::pushPosition(L, position, stackpos);
		}

		void pushNumber(int32_t number) {
			params++;
			lua_pushnumber(L, number);
		}

		void pushString(const std::string& str) {
			params++;
			LuaScriptInterface::pushString(L, str);
		}

	protected:
		static std::string getCreatureClass(Creature *creature) {
			if (targetCreature->getNpc()) {
				return "Npc";
			}
			if (targetCreature->getMonster()) {
				return "Monster";
			}
			if (targetCreature->getPlayer()) {
				return "Player";
			}

			return "";
		}

		void pushSpecificCreature(Creature *creature) {
			if (targetCreature->getNpc()) {
				LuaScriptInterface::pushUserdata<Npc>(L, this);
			}else if (targetCreature->getMonster()) {
				LuaScriptInterface::pushUserdata<Monster>(L, this);
			}else if (targetCreature->getPlayer()) {
				LuaScriptInterface::pushUserdata<Player>(L, this);
			} else {
				return;
			}

			params++;
			LuaScriptInterface::setMetatable(L, -1, getCreatureClass(creature));
		}

	private:
		LuaScriptInterface* scriptInterface;
		Creature* targetCreature;
		uint32_t params = 0;
		lua_State* L;
};

#endif

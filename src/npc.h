/**
 * @file npc.h
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

#ifndef OT_SRC_NPC_H_
#define OT_SRC_NPC_H_

#include "creature.h"
#include "luascript.h"

#include <set>

class Npc;
class Player;

class Npcs
{
	public:
		static void reload();
};

class NpcScriptInterface final : public LuaScriptInterface
{
	public:
		NpcScriptInterface();

		bool loadNpcLib(const std::string& file);

	protected:
		void registerFunctions();

		static int luaActionSay(lua_State* L);
		static int luaActionMove(lua_State* L);
		static int luaActionMoveTo(lua_State* L);
		static int luaActionTurn(lua_State* L);
		static int luaActionFollow(lua_State* L);
		static int luagetDistanceTo(lua_State* L);
		static int luaSetNpcFocus(lua_State* L);
		static int luaGetNpcCid(lua_State* L);
		static int luaGetNpcParameter(lua_State* L);
		static int luaOpenShopWindow(lua_State* L);
		static int luaCloseShopWindow(lua_State* L);
		static int luaDoSellItem(lua_State* L);

		// metatable
		static int luaNpcGetParameter(lua_State* L);
		static int luaNpcSetFocus(lua_State* L);

		static int luaNpcOpenShopWindow(lua_State* L);
		static int luaNpcCloseShopWindow(lua_State* L);

	private:
		bool initState() final;
		bool closeState() final;

		bool libLoaded;
};

class NpcEventsHandler
{
	public:
		NpcEventsHandler(const std::string& file, Npc* npcEvent);

		void onCreatureAppear(Creature* creature);
		void onCreatureDisappear(Creature* creature);
		void onCreatureMove(Creature* creature, const Position& oldPos, const Position& newPos);
		void onCreatureSay(Creature* creature, SpeakClasses, const std::string& text);
		void onPlayerTrade(Player* player, int32_t callback, uint16_t itemId, uint8_t count, uint8_t amount, bool ignore = false, bool inBackpacks = false);
		void onPlayerCloseChannel(Player* player);
		void onPlayerEndTrade(Player* player);
		void onThink();

		bool isLoaded() const;

	protected:
		Npc* npc;
		NpcScriptInterface* scriptInterface;

		int32_t creatureAppearEvent = -1;
		int32_t creatureDisappearEvent = -1;
		int32_t creatureMoveEvent = -1;
		int32_t creatureSayEvent = -1;
		int32_t playerCloseChannelEvent = -1;
		int32_t playerEndTradeEvent = -1;
		int32_t thinkEvent = -1;
		bool loaded = false;
};

class Npc final : public Creature
{
	public:
		~Npc();

		// non-copyable
		Npc(const Npc&) = delete;
		Npc& operator=(const Npc&) = delete;

		Npc* getNpc() final {
			return this;
		}
		const Npc* getNpc() const final {
			return this;
		}

		bool isPushable() const final {
			return walkTicks > 0;
		}

		void setID() final {
			if (id == 0) {
				id = npcAutoID++;
			}
		}

		void removeList() final;
		void addList() final;

		static Npc* createNpc(const std::string& name);

		bool canSee(const Position& pos) const final;

		bool load();
		void reload();

		const std::string& getName() const final {
			return name;
		}
		const std::string& getNameDescription() const final {
			return name;
		}

		CreatureType_t getType() const final {
			return CREATURETYPE_NPC;
		}

		uint8_t getSpeechBubble() const final {
			return speechBubble;
		}
		void setSpeechBubble(const uint8_t bubble) {
			speechBubble = bubble;
		}

		void doSay(const std::string& text);
		void doSayToPlayer(Player* player, const std::string& text);

		void doMoveTo(const Position& pos);

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

		void onPlayerCloseChannel(Player* player);
		void onPlayerTrade(Player* player, int32_t callback, uint16_t itemId, uint8_t count,
						   uint8_t amount, bool ignore = false, bool inBackpacks = false);
		void onPlayerEndTrade(Player* player, int32_t buyCallback, int32_t sellCallback);

		void turnToCreature(Creature* creature);
		void setCreatureFocus(Creature* creature);

		NpcScriptInterface* getScriptInterface();

		static uint32_t npcAutoID;

	protected:
		explicit Npc(const std::string& name);

		void onCreatureAppear(Creature* creature, bool isLogin) final;
		void onRemoveCreature(Creature* creature, bool isLogout) final;
		void onCreatureMove(Creature* creature, const Tile* newTile, const Position& newPos,
									const Tile* oldTile, const Position& oldPos, bool teleport) final;

		void onCreatureSay(Creature* creature, SpeakClasses type, const std::string& text) final;
		void onThink(uint32_t interval) final;
		std::string getDescription(int32_t lookDistance) const final;

		bool isImmune(CombatType_t) const final {
			return !attackable;
		}
		bool isImmune(ConditionType_t) const final {
			return !attackable;
		}
		bool isAttackable() const final {
			return attackable;
		}
		bool getNextStep(Direction& dir, uint32_t& flags) final;

		void setIdle(bool idle);
		void updateIdleStatus();

		bool canWalkTo(const Position& fromPos, Direction dir) const;
		bool getRandomStep(Direction& dir) const;

		void reset();
		bool loadFromXml();

		void addShopPlayer(Player* player);
		void removeShopPlayer(Player* player);
		void closeAllShopWindows();

		std::map<std::string, std::string> parameters;

		std::set<Player*> shopPlayerSet;
		std::set<Player*> spectators;

		std::string name;
		std::string filename;

		NpcEventsHandler* npcEventHandler;

		Position masterPos;

		uint32_t walkTicks;
		int32_t focusCreature;
		int32_t masterRadius;

		uint8_t speechBubble;

		bool floorChange;
		bool attackable;
		bool ignoreHeight;
		bool loaded;
		bool isIdle;

		static NpcScriptInterface* scriptInterface;

		friend class Npcs;
		friend class NpcScriptInterface;
};

#endif

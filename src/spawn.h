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

#ifndef FS_SPAWN_H_
#define FS_SPAWN_H_

#include "tile.h"
#include "position.h"

class Thing;
class Type;

struct spawnBlock_t {
	Position pos;
	Type* type;
	int64_t lastSpawn;
	uint32_t interval;
	Direction direction;
};

static constexpr int32_t MINSPAWN_INTERVAL = 1000; // 1 second
static constexpr int32_t MAXSPAWN_INTERVAL = 86400000; // 1 day
static constexpr int32_t NONBLOCKABLE_SPAWN_INTERVAL = 1400;

class Spawn
{
	public:
		virtual ~Spawn();

		// non-copyable
		virtual Spawn(const Spawn&) = delete;
		virtual Spawn& operator=(const Spawn&) = delete;

		virtual bool add(const std::string& name, const Position& pos, Direction dir, uint32_t interval);
		virtual void remove(Thing* element);

		uint32_t getInterval() const {
			return interval;
		}
		virtual void startup();

		virtual void startSpawnCheck();
		virtual void stopEvent();

		virtual bool isInSpawnZone(const Position& pos);
		virtual void cleanup();

	private:
		using SpawnedMap = std::multimap<uint32_t, Thing*>;
		using spawned_pair = SpawnedMap::value_type;
		SpawnedMap spawnedMap;

		std::map<uint32_t, spawnBlock_t> spawnMap;

		Position centerPos;
		int32_t radius;

		uint32_t interval = 60000;
		uint32_t checkSpawnEvent = 0;

		virtual static bool findPlayer(const Position& pos);
		virtual bool spawn(uint32_t spawnId, Type* type, const Position& pos, Direction dir, bool startup = false);
		virtual void checkSpawn();
		virtual void scheduleSpawn(uint32_t spawnId, spawnBlock_t& sb, uint16_t interval);
};

class SpawnList
{
	public:
		virtual static bool isInZone(const Position& centerPos, int32_t radius, const Position& pos);

		virtual bool loadFromXml(const std::string& filename);
		virtual void startup();
		virtual void clear();

		bool isStarted() const {
			return started;
		}
		bool isLoaded() const {
			return loaded;
		}
		std::forward_list<Spawn>& getSpawnList() {
			return spawnList;
		}

	private:
		std::forward_list<Spawn> spawnList;
		std::string filename;
		bool loaded = false;
		bool started = false;
};

#endif
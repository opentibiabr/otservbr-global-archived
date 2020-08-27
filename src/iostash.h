/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2020  Mark Samman <mark.samman@gmail.com>
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

#ifndef FS_IOSTASH_H_97FFA231D3199415D01D84860888044D
#define FS_IOSTASH_H_97FFA231D3199415D01D84860888044D

#include "enums.h"

class IOStash
{
public:
	static IOStash& getInstance() {
		static IOStash instance;
		return instance;
	}

	static StashItemList getStoredItems(uint32_t playerId);
	static bool withdrawItem(uint32_t playerId, uint16_t itemId, uint16_t count);
	static uint16_t getStashSize(StashItemList itemList);
	static uint16_t getStashItemCount(uint32_t playerId, uint32_t spriteId);
	static std::map<uint16_t, std::pair<bool, uint32_t>> stashContainer(uint32_t playerId, std::map<uint16_t, std::pair<bool, uint32_t>> itemDict, uint16_t stashSize);

private:
	IOStash() = default;
};

#endif
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

#ifndef FS_FAMILIARS_H_C56E7A707E3F422C8C93D9BE09916AA3
#define FS_FAMILIARS_H_C56E7A707E3F422C8C93D9BE09916AA3

#include <utility>

#include "enums.h"

struct Familiar {
	Familiar(std::string initName, uint16_t initLookType, bool initPremium, bool initUnlocked, std::string initFrom) :
		name(initName), lookType(initLookType), premium(initPremium), unlocked(initUnlocked),
		from(initFrom) {}

	std::string name;
	uint16_t lookType;
	bool premium;
	bool unlocked;
	std::string from;
};

class Familiars {
	public:
		static Familiars& getInstance() {
			static Familiars instance;
			return instance;
		}
		
		bool loadFromXml();
		
		const std::vector<Familiar>& getFamiliars(Vocation_t vocation) const {
			return familiars[vocation];
		}
	private:
		std::vector<Familiar> familiars[VOCATION_LAST + 1];
		
};

#endif

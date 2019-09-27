/**
 * @file iomapserialize.h
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

#ifndef OT_SRC_IOMAPSERIALIZE_H_
#define OT_SRC_IOMAPSERIALIZE_H_

#include "database.h"
#include "map.h"

class IOMapSerialize
{
	public:
		static void loadHouseItems(Map* map);
		static bool saveHouseItems();
		static bool loadHouseInfo();
		static bool saveHouseInfo();

	protected:
		static void saveItem(PropWriteStream& stream, const Item* item);
		static void saveTile(PropWriteStream& stream, const Tile* tile);

		static bool loadContainer(PropStream& propStream, Container* container);
		static bool loadItem(PropStream& propStream, Cylinder* parent);
};

#endif

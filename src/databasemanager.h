/**
 * @file databasemanager.h
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

#ifndef OT_SRC_DATABASEMANAGER_H_
#define OT_SRC_DATABASEMANAGER_H_
#include "database.h"

class DatabaseManager
{
	public:
		static bool tableExists(const std::string& table);

		static int32_t getDatabaseVersion();
		static bool isDatabaseSetup();

		static bool optimizeTables();
		static void updateDatabase();

		static bool getDatabaseConfig(const std::string& config, int32_t& value);
		static void registerDatabaseConfig(const std::string& config, int32_t value);
};
#endif

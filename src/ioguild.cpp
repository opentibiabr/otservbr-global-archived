/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2021 Mark Samman <mark.samman@gmail.com>
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

#include "database.h"
#include "guild.h"
#include "ioguild.h"

Guild* IOGuild::loadGuild(uint32_t guildId)
{
	std::stringExtended query(128);
	query << "SELECT `name` FROM `guilds` WHERE `id` = " << guildId << " LIMIT 1";
	if (DBResult_ptr result = g_database().storeQuery(query)) {
		Guild* guild = new Guild(guildId, std::move(result->getString("name")));

		query.clear();
		query << "SELECT `id`, `name`, `level` FROM `guild_ranks` WHERE `guild_id` = " << guildId;
		if ((result = g_database().storeQuery(query))) {
			do {
				guild->addRank(result->getNumber<uint32_t>("id"), result->getString("name"), result->getNumber<uint16_t>("level"));
			} while (result->next());
		}
		return guild;
	}
	return nullptr;
}

void IOGuild::saveGuild(Guild* guild) {
	if (!guild)
		return;

	std::stringExtended query(128);
	query << "UPDATE `guilds` SET ";
	query << "`balance` = " << guild->getBankBalance();
	query << " WHERE `id` = " << guild->getId();
	g_database().executeQuery(query);
}

uint32_t IOGuild::getGuildIdByName(const std::string& name)
{
	const std::string& escapedName = g_database().escapeString(name);
	std::stringExtended query(escapedName.length() + static_cast<size_t>(64));
	query << "SELECT `id` FROM `guilds` WHERE `name` = " << escapedName << " LIMIT 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return 0;
	}
	return result->getNumber<uint32_t>("id");
}

void IOGuild::getWarList(uint32_t guildId, GuildWarVector& guildWarVector)
{
	std::stringExtended query(140);
	query << "SELECT `guild1`, `guild2` FROM `guild_wars` WHERE (`guild1` = " << guildId << " OR `guild2` = " << guildId << ") AND `ended` = 0 AND `status` = 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return;
	}

	do {
		uint32_t guild1 = result->getNumber<uint32_t>("guild1");
		if (guildId != guild1) {
			guildWarVector.push_back(guild1);
		} else {
			guildWarVector.push_back(result->getNumber<uint32_t>("guild2"));
		}
	} while (result->next());
}

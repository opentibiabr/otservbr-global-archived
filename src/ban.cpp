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

#include "ban.h"
#include "database.h"
#include "databasetasks.h"
#include "tools.h"

#include <string>
#include <utility>

bool Ban::acceptConnection(uint32_t clientIP)
{
	std::lock_guard<std::recursive_mutex> lockClass(lock);

	uint64_t currentTime = OTSYS_TIME();

	auto it = ipConnectMap.find(clientIP);
	if (it == ipConnectMap.end()) {
		ipConnectMap.emplace(std::piecewise_construct, std::forward_as_tuple(clientIP), std::forward_as_tuple(currentTime, 0, 1));
		return true;
	}

	ConnectBlock& connectBlock = it->second;
	if (connectBlock.blockTime > currentTime) {
		connectBlock.blockTime += 250;
		return false;
	}

	int64_t timeDiff = currentTime - connectBlock.lastAttempt;
	connectBlock.lastAttempt = currentTime;
	if (timeDiff <= 5000) {
		if (++connectBlock.count > 5) {
			connectBlock.count = 0;
			if (timeDiff <= 500) {
				connectBlock.blockTime = currentTime + 3000;
				return false;
			}
		}
	} else {
		connectBlock.count = 1;
	}
	return true;
}

bool IOBan::isAccountBanned(uint32_t accountId, BanInfo& banInfo)
{
	std::stringExtended query(256);
	query << "SELECT `reason`, `expires_at`, `banned_at`, `banned_by`, (SELECT `name` FROM `players` WHERE `id` = `banned_by`) AS `name` FROM `account_bans` WHERE `account_id` = " << accountId << " LIMIT 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return false;
	}

	int64_t expiresAt = result->getNumber<int64_t>("expires_at");
	if (expiresAt != 0 && time(nullptr) > expiresAt) {
		// Move the ban to history if it has expired
		query.clear();
		query << "INSERT INTO `account_ban_history` (`account_id`, `reason`, `banned_at`, `expired_at`, `banned_by`) VALUES ("
            << accountId << ','
            << g_database().escapeString(result->getString("reason")) << ','
            << static_cast<int32_t>(result->getNumber<time_t>("banned_at")) << ','
            << expiresAt << ','
            << result->getNumber<uint32_t>("banned_by") << ')';
		g_databaseTasks().addTask(query);

		query.clear();
		query << "DELETE FROM `account_bans` WHERE `account_id` = " << accountId;
		g_databaseTasks().addTask(std::move(static_cast<std::string&>(query)));
		return false;
	}

	banInfo.expiresAt = expiresAt;
	banInfo.reason = std::move(result->getString("reason"));
	banInfo.bannedBy = std::move(result->getString("name"));
	return true;
}

bool IOBan::isIpBanned(uint32_t clientIP, BanInfo& banInfo)
{
	if (clientIP == 0) {
		return false;
	}

	std::stringExtended query(140);
	query << "SELECT `reason`, `expires_at`, (SELECT `name` FROM `players` WHERE `id` = `banned_by`) AS `name` FROM `ip_bans` WHERE `ip` = " << clientIP << " LIMIT 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return false;
	}

	int64_t expiresAt = result->getNumber<int64_t>("expires_at");
	if (expiresAt != 0 && time(nullptr) > expiresAt) {
		query.clear();
		query << "DELETE FROM `ip_bans` WHERE `ip` = " << clientIP;
		g_databaseTasks().addTask(std::move(static_cast<std::string&>(query)));
		return false;
	}

	banInfo.expiresAt = expiresAt;
	banInfo.reason = std::move(result->getString("reason"));
	banInfo.bannedBy = std::move(result->getString("name"));
	return true;
}

bool IOBan::isPlayerNamelocked(uint32_t playerId)
{
	std::stringExtended query(128);
	query << "SELECT 1 FROM `player_namelocks` WHERE `player_id` = " << playerId << " LIMIT 1";
	return g_database().storeQuery(query).get() != nullptr;
}

uint32_t IOBan::getAccountID(const std::string& playerName) {
	const std::string& escapedName = g_database().escapeString(playerName);
	std::stringExtended query(escapedName.length() + 64);
	query << "SELECT `account_id` FROM `players` WHERE `name` = " << escapedName << " LIMIT 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return 0;
	}
	return result->getNumber<uint32_t>("account_id");
}

uint32_t IOBan::getAccountLastIP(const std::string& playerName) {
	const std::string& escapedName = g_database().escapeString(playerName);
	std::stringExtended query(escapedName.length() + 64);
	query << "SELECT `lastip` FROM `players` WHERE `name` = " << escapedName << " LIMIT 1";

	DBResult_ptr result = g_database().storeQuery(query);
	if (!result) {
		return 0;
	}
	return result->getNumber<uint32_t>("lastip");
}

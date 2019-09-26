/** 
 * @file account.cpp
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

#include "account.h"
#include "database.h"
#include "databasetasks.h"

uint32_t IOAccount::getCoinBalance(uint32_t accountId)
{
	std::ostringstream query;
	query << "SELECT `coins` FROM `accounts` WHERE `id` = " << accountId;

	DBResult_ptr result = Database::getInstance().storeQuery(query.str());
	if (!result) {
		return false;
	}

	return result->getNumber<uint32_t>("coins");
}

void IOAccount::addCoins(uint32_t accountId, int32_t amount)
{
	std::ostringstream query;
	query << "UPDATE `accounts` SET `coins` = `coins` + " << amount << " WHERE `id` = " << accountId;

	g_databaseTasks.addTask(query.str());
}

void IOAccount::removeCoins(uint32_t accountId, int32_t amount)
{
	std::ostringstream query;
	query << "UPDATE `accounts` SET `coins` = `coins` - " << amount << " WHERE `id` = " << accountId;

	g_databaseTasks.addTask(query.str());
}

void IOAccount::registerTransaction(uint32_t accountId, int32_t coins, const std::string& description)
{
	Database& db = Database::getInstance();

	std::ostringstream query;
	query << "INSERT INTO `store_history` (`account_id`, `coin_amount`, `description`, `time`) VALUES (" << accountId << "," << coins << "," << db.escapeString(description) << "," << time(nullptr) << ")";

	db.executeQuery(query.str());
}

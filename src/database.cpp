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

#include "configmanager.h"
#include "database.h"

#ifdef __has_include

#if __has_include(<mysql/errmsg.h>)
#include <mysql/errmsg.h>
#elif __has_include(<errmsg.h>)
#include <errmsg.h>
#else
#error "Cannot detect mysql library"
#endif

#else
#include <errmsg.h>
#endif

bool Database::init()
{
	if (mysql_library_init(0, NULL, NULL) != 0) {
		std::cout << std::endl << "Failed to initialize MySQL client library." << std::endl;
		return false;
	}
	return true;
}

void Database::end()
{
	mysql_library_end();
}

bool Database::connect()
{
	// thread-specific variables initialization
	if (mysql_thread_init() != 0) {
		std::cout << std::endl << "Failed to initialize MySQL thread-specific variables." << std::endl;
		return false;
	}

	// connection handle initialization
	handle = mysql_init(nullptr);
	if (!handle) {
		std::cout << std::endl << "Failed to initialize MySQL connection handle." << std::endl;
		return false;
	}

	// automatic reconnect
	bool reconnect = true;
	mysql_options(handle, MYSQL_OPT_RECONNECT, &reconnect);

	// connects to database
	if (!mysql_real_connect(handle, g_config().getString(ConfigManager::MYSQL_HOST).c_str(), g_config().getString(ConfigManager::MYSQL_USER).c_str(), g_config().getString(ConfigManager::MYSQL_PASS).c_str(), g_config().getString(ConfigManager::MYSQL_DB).c_str(), g_config().getNumber(ConfigManager::SQL_PORT), g_config().getString(ConfigManager::MYSQL_SOCK).c_str(), 0)) {
		std::cout << std::endl << "MySQL Error Message: " << mysql_error(handle) << std::endl;
		return false;
	}

	DBResult_ptr result = storeQuery("SHOW VARIABLES LIKE 'max_allowed_packet'");
	if (result) {
		maxPacketSize = result->getNumber<uint64_t>("Value");
	}
	return true;
}

void Database::disconnect()
{
	if (handle != nullptr) {
		mysql_close(handle);
		handle = nullptr;
	}

	mysql_thread_end();
}

bool Database::beginTransaction()
{
	if (!executeQuery("BEGIN")) {
		return false;
	}

	return true;
}

bool Database::rollback()
{
	if (mysql_rollback(handle) != 0) {
		std::cout << "[Error - mysql_rollback] Message: " << mysql_error(handle) << std::endl;
		return false;
	}

	return true;
}

bool Database::commit()
{
	if (mysql_commit(handle) != 0) {
		std::cout << "[Error - mysql_commit] Message: " << mysql_error(handle) << std::endl;
		return false;
	}

	return true;
}

bool Database::executeQuery(const std::string& query)
{
	bool success = true;

	// executes the query
	while (mysql_real_query(handle, query.c_str(), query.length()) != 0) {
		std::cout << "[Error - mysql_real_query] Query: " << query.substr(0, 256) << std::endl << "Message: " << mysql_error(handle) << std::endl;
		auto error = mysql_errno(handle);
		if (error != CR_SERVER_LOST && error != CR_SERVER_GONE_ERROR && error != CR_CONN_HOST_ERROR && error != 1053/*ER_SERVER_SHUTDOWN*/ && error != CR_CONNECTION_ERROR) {
			success = false;
			break;
		}
		std::this_thread::sleep_for(std::chrono::seconds(1));
	}

	MYSQL_RES* m_res = mysql_store_result(handle);
	if (m_res) {
		mysql_free_result(m_res);
	}

	return success;
}

DBResult_ptr Database::storeQuery(const std::string& query)
{
	retry:
	while (mysql_real_query(handle, query.c_str(), query.length()) != 0) {
		std::cout << "[Error - mysql_real_query] Query: " << query << std::endl << "Message: " << mysql_error(handle) << std::endl;
		auto error = mysql_errno(handle);
		if (error != CR_SERVER_LOST && error != CR_SERVER_GONE_ERROR && error != CR_CONN_HOST_ERROR && error != 1053/*ER_SERVER_SHUTDOWN*/ && error != CR_CONNECTION_ERROR) {
			break;
		}
		std::this_thread::sleep_for(std::chrono::seconds(1));
	}

	// we should call that every time as someone would call executeQuery('SELECT...')
	// as it is described in MySQL manual: "it doesn't hurt" :P
	MYSQL_RES* res = mysql_store_result(handle);
	if (res == nullptr) {
		std::cout << "[Error - mysql_store_result] Query: " << query << std::endl << "Message: " << mysql_error(handle) << std::endl;
		auto error = mysql_errno(handle);
		if (error != CR_SERVER_LOST && error != CR_SERVER_GONE_ERROR && error != CR_CONN_HOST_ERROR && error != 1053/*ER_SERVER_SHUTDOWN*/ && error != CR_CONNECTION_ERROR) {
			return nullptr;
		}
		goto retry;
	}

	// retrieving results of query
	DBResult_ptr result = std::make_shared<DBResult>(res);
	if (!result->hasNext()) {
		return nullptr;
	}
	return result;
}

std::string Database::escapeString(const std::string& s) const
{
	return escapeBlob(s.c_str(), s.length());
}

std::string Database::escapeBlob(const char* s, uint32_t length) const
{
	// the worst case is 2n + 1
	size_t maxLength = (length * 2) + 1;

	std::string escaped;
	escaped.resize(maxLength + 2);

	size_t position = 0;
	escaped[position++] = '\'';
	if (length != 0) {
		position += mysql_real_escape_string(handle, &escaped[position], s, length);
	}

	escaped[position++] = '\'';
	escaped.resize(position);
	return escaped;
}

DBResult::DBResult(MYSQL_RES* res)
{
	handle = res;

	unsigned int num_fields = mysql_num_fields(handle);
	listNames.reserve(num_fields);

	MYSQL_FIELD* fields = mysql_fetch_fields(handle);
	for (size_t i = 0; i < num_fields; ++i) {
		listNames.emplace(std::piecewise_construct, std::forward_as_tuple(fields[i].name, fields[i].name_length), std::forward_as_tuple(i));
	}

	row = mysql_fetch_row(handle);
	lengths = mysql_fetch_lengths(handle);
}

DBResult::~DBResult()
{
	mysql_free_result(handle);
}

std::string DBResult::getString(const std::string& s) const
{
	auto it = listNames.find(s);
	if (it == listNames.end()) {
		std::cout << "[Error - DBResult::getString] Column '" << s << "' does not exist in result set." << std::endl;
		return std::string();
	}

	if (row[it->second] == nullptr) {
		return std::string();
	}

	return std::string(row[it->second], lengths[it->second]);
}

const char* DBResult::getStream(const std::string& s, unsigned long& size) const
{
	auto it = listNames.find(s);
	if (it == listNames.end()) {
		std::cout << "[Error - DBResult::getStream] Column '" << s << "' doesn't exist in the result set" << std::endl;
		size = 0;
		return nullptr;
	}

	if (row[it->second] == nullptr) {
		size = 0;
		return nullptr;
	}

	size = lengths[it->second];
	return row[it->second];
}

size_t DBResult::countResults() const
{
	return static_cast<size_t>(mysql_num_rows(handle));
}

bool DBResult::hasNext() const
{
	return row != nullptr;
}

bool DBResult::next()
{
	row = mysql_fetch_row(handle);
	lengths = mysql_fetch_lengths(handle);
	return row != nullptr;
}

DBInsert::DBInsert(Database* dtb, std::string query) : query(std::move(query))
{
	this->dtb = dtb;
	this->length = this->query.length();
}

bool DBInsert::addRow(const std::string& row)
{
	// adds new row to buffer
	const size_t rowLength = row.length();
	length += rowLength;
	if (length > dtb->getMaxPacketSize() && !execute()) {
		return false;
	}

	if (values.empty()) {
		values.reserve(rowLength + 2);
		values.push_back('(');
		values.append(row);
		values.push_back(')');
	} else {
		values.reserve(values.length() + rowLength + 3);
		values.push_back(',');
		values.push_back('(');
		values.append(row);
		values.push_back(')');
	}
	return true;
}

bool DBInsert::addRow(std::ostringstream& row)
{
	bool ret = addRow(row.str());
	row.str(std::string());
	return ret;
}

bool DBInsert::execute()
{
	if (values.empty()) {
		return true;
	}

	// executes buffer
	bool res = dtb->executeQuery(query + values);
	values.clear();
	length = query.length();
	return res;
}

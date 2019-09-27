/**
 * @file ban.h
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

#ifndef OT_SRC_BAN_H_
#define OT_SRC_BAN_H_

struct BanInfo {
	std::string bannedBy;
	std::string reason;
	time_t expiresAt;
};

struct ConnectBlock {
	constexpr ConnectBlock(uint64_t initLastAttempt, uint64_t initBlockTime, uint32_t initCount) :
		lastAttempt(initLastAttempt), blockTime(initBlockTime), count(initCount) {}

	uint64_t lastAttempt;
	uint64_t blockTime;
	uint32_t count;
};

using IpConnectMap = std::map<uint32_t, ConnectBlock>;

class Ban
{
	public:
		bool acceptConnection(uint32_t clientip);

	protected:
		IpConnectMap ipConnectMap;
		std::recursive_mutex lock;
};

class IOBan
{
	public:
		static bool isAccountBanned(uint32_t accountId, BanInfo& banInfo);
		static bool isIpBanned(uint32_t ip, BanInfo& banInfo);
		static bool isPlayerNamelocked(uint32_t playerId);
};

#endif

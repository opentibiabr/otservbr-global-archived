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

#ifndef OT_SRC_MODULE_H_
#define OT_SRC_MODULE_H_

#include "luascript.h"

class NetworkMessage;

class Modules
{
	public:
		Modules();

		// Singleton - ensures we don't accidentally copy it
		Modules(Modules const&) = delete;
		void operator=(Modules const&) = delete;

		static Modules& getInstance() {
			// Guaranteed to be destroyed
			static Modules instance;
			// Instantiated on first use
			return instance;
		}

		bool load();
		
		// Module
		bool eventOnRecvByte(Player* player, uint8_t recvbyte, NetworkMessage& msg);

	private:
		LuaScriptInterface scriptInterface;
		std::map<uint8_t, int32_t> modules;
};

constexpr auto g_modules = &Modules::getInstance;

#endif

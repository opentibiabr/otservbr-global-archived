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
#include <csignal>

#include "signals.h"
#include "tasks.h"
#include "game.h"
#include "actions.h"
#include "configmanager.h"
#include "spells.h"
#include "talkaction.h"
#include "raids.h"
#include "mounts.h"
#include "globalevent.h"
#include "monster.h"
#include "events.h"

#include "databasetasks.h"

extern LuaEnvironment g_luaEnvironment;

using ErrorCode = boost::system::error_code;

Signals::Signals(boost::asio::io_service& service) :
	set(service)
{
	set.add(SIGINT);
	set.add(SIGTERM);
#ifndef _WIN32
	set.add(SIGUSR1);
	set.add(SIGHUP);
#else
	// This must be a blocking call as Windows calls it in a new thread and terminates
	// the process when the handler returns (or after 5 seconds, whichever is earlier).
	// On Windows it is called in a new thread.
	signal(SIGBREAK, dispatchSignalHandler);
#endif

	asyncWait();
}

void Signals::asyncWait()
{
	set.async_wait([this] (ErrorCode err, int signal) {
		if (err) {
			spdlog::error("[Signals::asyncWait] - "
                         "Signal handling error: {}", err.message());
			return;
		}
		dispatchSignalHandler(signal);
		asyncWait();
	});
}

// On Windows this function does not need to be signal-safe,
// as it is called in a new thread.
// https://github.com/otland/forgottenserver/pull/2473
void Signals::dispatchSignalHandler(int signal)
{
	switch(signal) {
		case SIGINT: //Shuts the server down
			g_dispatcher().addTask(sigintHandler);
			break;
		case SIGTERM: //Shuts the server down
			g_dispatcher().addTask(sigtermHandler);
			break;
#ifndef _WIN32
		case SIGHUP: //Reload config/data
			g_dispatcher().addTask(sighupHandler);
			break;
		case SIGUSR1: //Saves game state
			g_dispatcher().addTask(sigusr1Handler);
			break;
#else
		case SIGBREAK: //Shuts the server down
			g_dispatcher().addTask(sigbreakHandler);
			// hold the thread until other threads end
			g_dispatcher().join();
			g_databaseTasks().join();
			g_dispatcher().join();
			break;
#endif
		default:
			break;
	}
}

void Signals::sigbreakHandler()
{
	//Dispatcher thread
	spdlog::info("SIGBREAK received, shutting game server down...");
	g_game().setGameState(GAME_STATE_SHUTDOWN);
}

void Signals::sigtermHandler()
{
	//Dispatcher thread
	spdlog::info("SIGTERM received, shutting game server down...");
	g_game().setGameState(GAME_STATE_SHUTDOWN);
}

void Signals::sigusr1Handler()
{
	//Dispatcher thread
	spdlog::info("SIGUSR1 received, saving the game state...");
	g_game().saveGameState();
}

void Signals::sighupHandler()
{
	//Dispatcher thread
	spdlog::info("SIGHUP received, reloading config files...");

	g_config().reload();
	spdlog::info("Reloaded config");

	Npcs::reload();
	spdlog::info("Reloaded npcs");

	g_game().raids.reload();
	g_game().raids.startup();
	spdlog::info("Reloaded raids");

	g_monsters().reload();
	spdlog::info("Reloaded spells");

	Item::items.reload();
	spdlog::info("Reloaded items");

	g_game().mounts.reload();
	spdlog::info("Reloaded mounts");

	g_events().load();
	spdlog::info("Reloaded events");

	g_chat().load();
	spdlog::info("Reloaded chatchannels");

	g_luaEnvironment.loadFile("data/global.lua");
	spdlog::info("Reloaded global.lua");
	
	g_luaEnvironment.loadFile("data/stages.lua");
	spdlog::info("Reloaded stages.lua");

	lua_gc(g_luaEnvironment.getLuaState(), LUA_GCCOLLECT, 0);
}

void Signals::sigintHandler()
{
	//Dispatcher thread
	spdlog::info("SIGINT received, shutting game server down...");
	g_game().setGameState(GAME_STATE_SHUTDOWN);
}

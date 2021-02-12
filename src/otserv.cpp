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

#include <fstream>

#include "configmanager.h"
#include "databasemanager.h"
#include "databasetasks.h"
#include "game.h"
#include "iomarket.h"
#include "protocollogin.h"
#include "protocolstatus.h"
#include "rsa.h"

#include "scripts.h"
#include "server.h"
#include "spells.h"
#include "modules.h"
#include "webhook.h"

#if __has_include("gitmetadata.h")
	#include "gitmetadata.h"
#endif

LuaEnvironment g_luaEnvironment;

std::mutex g_loaderLock;
std::condition_variable g_loaderSignal;
std::unique_lock<std::mutex> g_loaderUniqueLock(g_loaderLock);

void startupErrorMessage(const std::string& errorStr) {
  std::cout << "\033[1;31m>> " << errorStr << std::endl;
  std::cout << ">> The program will close after pressing the enter key..." << "\033[0m" << std::endl;
  g_loaderSignal.notify_all();
  getchar();
  exit(-1);
}

void mainLoader(int argc, char* argv[], ServiceManager* servicer);

void badAllocationHandler() {
	// Use functions that only use stack allocation
	puts("Allocation failed, server out of memory.\nDecrease the size of your "
		"map or compile in 64 bits mode.\n");
	getchar();
	exit(-1);
}

#ifndef UNIT_TESTING
int main(int argc, char* argv[]) {

	// Setup bad allocation handler
	std::set_new_handler(badAllocationHandler);

	ServiceManager serviceManager;

	g_dispatcher().start();

	g_dispatcher().addTask(std::bind(mainLoader, argc, argv,
                                     &serviceManager));

	g_loaderSignal.wait(g_loaderUniqueLock);

	if (serviceManager.is_running()) {
		std::cout << ">> " << g_config().getString(ConfigManager::SERVER_NAME)
								<< " Server Online!" << std::endl << std::endl;
		serviceManager.run();
	} else {
		std::cout << ">> No services running. The server is NOT online." << std::endl;
		g_databaseTasks().shutdown();
		g_dispatcher().shutdown();
	}

	g_dispatcher().join();
	g_databaseTasks().join();
	g_database().end();
	return 0;
}
#endif

void mainLoader(int, char*[], ServiceManager* services) {
	// dispatcher thread
	g_game().setGameState(GAME_STATE_STARTUP);

	srand(static_cast<unsigned int>(OTSYS_TIME()));
#ifdef _WIN32
	SetConsoleTitle(STATUS_SERVER_NAME);
#endif
#if defined(GIT_RETRIEVED_STATE) && GIT_RETRIEVED_STATE
	std::cout << STATUS_SERVER_NAME << " - Version [" << GIT_HEAD_SHA1 << "]"
				<< " dated [" << GIT_COMMIT_DATE_ISO8601 << "]" <<std::endl;
	#if GIT_IS_DIRTY
	std::cout << "*** DIRTY - NOT OFFICIAL RELEASE ***" << std::endl;
	#endif
#else
	std::cout << STATUS_SERVER_NAME << " - Version " << STATUS_SERVER_VERSION
																<< std::endl;
#endif
	std::cout << std::endl;

	std::cout << "Compiled with " << BOOST_COMPILER << std::endl;
	std::cout << "Compiled on " << __DATE__ << ' ' << __TIME__ << " for platform ";
#if defined(__amd64__) || defined(_M_X64)
	std::cout << "x64" << std::endl;
#elif defined(__i386__) || defined(_M_IX86) || defined(_X86_)
	std::cout << "x86" << std::endl;
#elif defined(__arm__)
	std::cout << "ARM" << std::endl;
#else
	std::cout << "unknown" << std::endl;
#endif
#if defined(LUAJIT_VERSION)
	std::cout << "Linked with " << LUAJIT_VERSION << " for Lua support"
																<< std::endl;
#else
	std::cout << "Linked with " << LUA_RELEASE << " for Lua support"
																<< std::endl;
#endif
	std::cout << std::endl;

	std::cout << "A server developed by " << STATUS_SERVER_DEVELOPERS
																<< std::endl;
	std::cout << "Visit our forum for updates, support, and resources: "
		"https://otserv.com.br/ and https://forums.otserv.com.br" << std::endl;
	std::cout << std::endl;

	// check if config.lua or config.lua.dist exist
	std::ifstream c_test("./config.lua");
	if (!c_test.is_open()) {
		std::ifstream config_lua_dist("./config.lua.dist");
		if (config_lua_dist.is_open()) {
			std::cout << ">> copying config.lua.dist to config.lua" << std::endl;
			std::ofstream config_lua("config.lua");
			config_lua << config_lua_dist.rdbuf();
			config_lua.close();
			config_lua_dist.close();
		}
	} else {
		c_test.close();
	}

	// read global config
	std::cout << ">> Loading config" << std::endl;
	if (!g_config().load()) {
		startupErrorMessage("Unable to load config.lua!");
		return;
	}

	std::cout << ">> Client Version: " << g_config().getString(ConfigManager::CLIENT_VERSION_STR)
													<< std::endl;

#ifdef _WIN32
	const std::string& defaultPriority = g_config().getString(
											ConfigManager::DEFAULT_PRIORITY);
	if (strcasecmp(defaultPriority.c_str(), "high") == 0) {
		SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);
	} else if (strcasecmp(defaultPriority.c_str(), "above-normal") == 0) {
		SetPriorityClass(GetCurrentProcess(), ABOVE_NORMAL_PRIORITY_CLASS);
	}
#endif

	// set RSA key
	try {
		g_RSA().loadPEM("key.pem");
	} catch(const std::exception& e) {
		startupErrorMessage(e.what());
		return;
	}

	std::cout << ">> Establishing database connection..." << std::flush;

	if (!Database::getInstance().connect()) {
		startupErrorMessage("Failed to connect to database.");
		return;
	}

	std::cout << " MySQL " << Database::getClientVersion() << std::endl;

	// run database manager
	std::cout << ">> Running database manager" << std::endl;

	if (!DatabaseManager::isDatabaseSetup()) {
		startupErrorMessage("The database you have specified in config.lua is "
					"empty, please import the schema.sql to your database.");
		return;
	}
	g_databaseTasks().start();

	DatabaseManager::updateDatabase();

	if (g_config().getBoolean(ConfigManager::OPTIMIZE_DATABASE)
			&& !DatabaseManager::optimizeTables()) {
		std::cout << "> No tables were optimized" << std::endl;
	}

	std::cout << ">> Loading Lua libs" << std::endl;
	// Load global.lua (data/libs folder)
	if (g_luaEnvironment.loadFile("data/global.lua") == -1) {
		startupErrorMessage("Cannot load data/global.lua");
	}
	std::cout << "> Loaded global.lua" << std::endl;

	// Load stages.lua
	if (g_luaEnvironment.loadFile("data/stages.lua") == -1) {
		startupErrorMessage("Can not load data/stages.lua");
		return;
	}
	std::cout << "> Loaded stages.lua" << std::endl;

	// Load startup folder
	if (g_luaEnvironment.loadFile("data/startup/startup.lua") == -1) {
		startupErrorMessage("Can not load data/startup/startup.lua");
		return;
	}
	std::cout << "> Loaded startup.lua" << std::endl;

	std::cout << ">> Loading items.otb" << std::endl;
	// Load item.otb
	if (Item::items.loadFromOtb("data/items/items.otb") != ERROR_NONE) {
		startupErrorMessage("Unable to load items (OTB)!");
		return;
	}
	std::cout << "> Loaded items.otb" << std::endl;

	// Load vocations
	std::cout << ">> Loading XML scripts" << std::endl;
	if (!Item::items.loadFromXml()) {
		startupErrorMessage("Unable to load items (XML)!");
		return;
	}
	std::cout << "> Loaded items" << std::endl;

	// Load modules
	if (!g_modules().load()) {
		startupErrorMessage("Unable to load modules!");
		return;
	}
	std::cout << "> Loaded modules" << std::endl;

	// Load vocations
	if (!g_vocations().loadFromXml()) {
		startupErrorMessage("Unable to load vocations!");
		return;
	}
	std::cout << "> Loaded vocations" << std::endl;

	// Load spells
	if (!g_spells().loadFromXml()) {
		startupErrorMessage("Unable to load spells!");
		return;
	}
	std::cout << "> Loaded spells" << std::endl;
	
	// Load imbuements
	if (!g_imbuements().loadFromXml()) {
		startupErrorMessage("Unable to load imbuements!");
		return;
	}
	std::cout << "> Loaded imbuements" << std::endl;

	// Load schedule events
	if (!g_game().loadScheduleEventFromXml()) {
		startupErrorMessage("Unable to load event schedule!");
	}
	std::cout << "> Loaded event scheduler" << std::endl;

	// Load outfits
	if (!Outfits::getInstance().loadFromXml()) {
		startupErrorMessage("Unable to load outfits!");
		return;
	}
	std::cout << "> Loaded outfits" << std::endl;

	// Load familiars
	if (!Familiars::getInstance().loadFromXml()) {
		startupErrorMessage("Unable to load familiars!");
		return;
	}
	std::cout << "> Loaded familiars" << std::endl;

	// Load lua scripts
	std::cout << ">> Loading revscriptsys" << std::endl;
	if (!g_scripts().loadScripts("scripts/lib", true, false)) {
		startupErrorMessage("Unable to load libs!");
		return;
	}
	std::cout << "> Loaded lib" << std::endl;

	// Load folder data/scripts
	if (!g_scripts().loadScripts("scripts", false, false)) {
		startupErrorMessage("Unable to load scripts!");
		return;
	}
	std::cout << "> Loaded scripts" << std::endl;

	// Load monsters
	if (!g_scripts().loadScripts("monster", false, false)) {	
		startupErrorMessage("Unable to load monsters!");	
		return;	
	}
	std::cout << "> Loaded monsters" << std::endl;	

	// Load boosted creature
	g_game().loadBoostedCreature();

	std::cout << ">> Checking world type... " << std::flush;
	std::string worldType = asLowerCaseString(g_config().getString(
													ConfigManager::WORLD_TYPE));
	if (worldType == "pvp") {
		g_game().setWorldType(WORLD_TYPE_PVP);
	} else if (worldType == "no-pvp") {
		g_game().setWorldType(WORLD_TYPE_NO_PVP);
	} else if (worldType == "pvp-enforced") {
		g_game().setWorldType(WORLD_TYPE_PVP_ENFORCED);
	} else {
		std::cout << std::endl;

		std::ostringstream ss;
		ss << "> ERROR: Unknown world type: " << g_config().getString(
			ConfigManager::WORLD_TYPE) << ", valid world types are: pvp, no-pvp"
											" and pvp-enforced.";
		startupErrorMessage(ss.str());
		return;
	}
	std::cout << asUpperCaseString(worldType) << std::endl;

	std::cout << ">> Loading map" << std::endl;
	if (!g_game().loadMainMap(g_config().getString(ConfigManager::MAP_NAME))) {
		startupErrorMessage("Failed to load map");
		return;
	}
	std::cout << "> Loaded map" << std::endl;

	std::cout << ">> Initializing gamestate" << std::endl;
	g_game().setGameState(GAME_STATE_INIT);

	// Game client protocols
	services->add<ProtocolGame>(static_cast<uint16_t>(g_config().getNumber(
												ConfigManager::GAME_PORT)));
	services->add<ProtocolLogin>(static_cast<uint16_t>(g_config().getNumber(
												ConfigManager::LOGIN_PORT)));
	// OT protocols
	services->add<ProtocolStatus>(static_cast<uint16_t>(g_config().getNumber(
												ConfigManager::STATUS_PORT)));

	RentPeriod_t rentPeriod;
	std::string strRentPeriod = asLowerCaseString(g_config().getString(
											ConfigManager::HOUSE_RENT_PERIOD));

	if (strRentPeriod == "yearly") {
		rentPeriod = RENTPERIOD_YEARLY;
	} else if (strRentPeriod == "weekly") {
		rentPeriod = RENTPERIOD_WEEKLY;
	} else if (strRentPeriod == "monthly") {
		rentPeriod = RENTPERIOD_MONTHLY;
	} else if (strRentPeriod == "daily") {
		rentPeriod = RENTPERIOD_DAILY;
	} else {
		rentPeriod = RENTPERIOD_NEVER;
	}

	g_game().map.houses.payHouses(rentPeriod);

	IOMarket::checkExpiredOffers();
	IOMarket::getInstance().updateStatistics();

	std::cout << ">> Loaded all modules, server starting up..." << std::endl;

#ifndef _WIN32
	if (getuid() == 0 || geteuid() == 0) {
		std::cout << "> Warning: " << STATUS_SERVER_NAME << " has been executed"
				" as root user, please consider running it as a normal user."
				<< std::endl;
	}
#endif

	g_game().start(services);
	g_game().setGameState(GAME_STATE_NORMAL);

	webhook_init();
	webhook_send_message("Server is now online", "Server has successfully started.", WEBHOOK_COLOR_ONLINE);

	g_loaderSignal.notify_all();
}

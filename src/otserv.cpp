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
  spdlog::error("{}", errorStr);
  g_loaderSignal.notify_all();
  getchar();
  exit(-1);
}

void mainLoader(int argc, char* argv[], ServiceManager* servicer);

void badAllocationHandler() {
	// Use functions that only use stack allocation
	spdlog::error("Allocation failed, server out of memory, "
                 "decrease the size of your map or compile in 64 bits mode");
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
		spdlog::info("{} {}", g_config().getString(ConfigManager::SERVER_NAME),
                    "server online!");
		serviceManager.run();
	} else {
		spdlog::error("No services running. The server is NOT online!");
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
	spdlog::info("{} - Based on [{}] dated [{}]",
                STATUS_SERVER_NAME, STATUS_SERVER_VERSION, GIT_COMMIT_DATE_ISO8601);
	#if GIT_IS_DIRTY
	spdlog::warn("DIRTY - NOT OFFICIAL RELEASE");
	#endif
#else
	spdlog::info("{} - Based on {}", STATUS_SERVER_NAME, STATUS_SERVER_VERSION);
#endif

	spdlog::info("Compiled with {}", BOOST_COMPILER);

	std::string platform;
	#if defined(__amd64__) || defined(_M_X64)
		platform = "x64";
	#elif defined(__i386__) || defined(_M_IX86) || defined(_X86_)
		platform = "x86";
	#elif defined(__arm__)
		platform = "ARM";
	#else
		platform = "unknown";
	#endif

	spdlog::info("Compiled on {} {} for platform {}\n", __DATE__, __TIME__, platform);

#if defined(LUAJIT_VERSION)
	spdlog::info("Linked with {} for Lua support", LUAJIT_VERSION);
#else
	spdlog::info("Linked with {} for Lua support", LUA_RELEASE);
#endif

	spdlog::info("A server developed by: {}", STATUS_SERVER_DEVELOPERS);
	spdlog::info("Visit our forum for updates, support, and resources: "
                "https://otserv.com.br/ and https://forums.otserv.com.br");

	// check if config.lua or config.lua.dist exist
	std::ifstream c_test("./config.lua");
	if (!c_test.is_open()) {
		std::ifstream config_lua_dist("./config.lua.dist");
		if (config_lua_dist.is_open()) {
			spdlog::info("Copying config.lua.dist to config.lua");
			std::ofstream config_lua("config.lua");
			config_lua << config_lua_dist.rdbuf();
			config_lua.close();
			config_lua_dist.close();
		}
	} else {
		c_test.close();
	}

	spdlog::info("Loading config.lua");
	// Read global config
	if (!g_config().load()) {
		startupErrorMessage("Unable to load config.lua!");
		return;
	}

	spdlog::info("Server protocol: {}",
                g_config().getString(ConfigManager::CLIENT_VERSION_STR));

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

	spdlog::info("Establishing database connection...");

	if (!Database::getInstance().connect()) {
		startupErrorMessage("Failed to connect to database!");
		return;
	}

	spdlog::info("MySQL Version: {}", Database::getClientVersion());

	// Run database manager
	spdlog::info("Running database manager...");

	if (!DatabaseManager::isDatabaseSetup()) {
		startupErrorMessage("The database you have specified in config.lua is "
                           "empty, please import the schema.sql to your database.");
		return;
	}
	g_databaseTasks().start();

	DatabaseManager::updateDatabase();

	if (g_config().getBoolean(ConfigManager::OPTIMIZE_DATABASE)
			&& !DatabaseManager::optimizeTables()) {
		spdlog::info("No tables were optimized");
	}

	// Load items.otb
	spdlog::info("Loading items.otb");
	if (Item::items.loadFromOtb("data/items/items.otb") != ERROR_NONE) {
		startupErrorMessage("Can not load: data/items/items.otb");
		return;
	}
	std::cout << "> Loaded startup.lua" << std::endl;

	// Lua libs
	// Load global.lua (data/libs folder)
	spdlog::info("Loading Lua libs...");
	spdlog::info("Loading global.lua");
	if (g_luaEnvironment.loadFile("data/global.lua") == -1) {
		startupErrorMessage("Cannot load: data/global.lua");
	}
	std::cout << "> Loaded items.otb" << std::endl;

	// Load stages.lua
	spdlog::info("Loading stages.lua");
	if (g_luaEnvironment.loadFile("data/stages.lua") == -1) {
		startupErrorMessage("Can not load: data/stages.lua");
		return;
	}
	std::cout << "> Loaded items" << std::endl;

	// Load startup folder
	spdlog::info("Loading startup.lua");
	if (g_luaEnvironment.loadFile("data/startup/startup.lua") == -1) {
		startupErrorMessage("Can not load: data/startup/startup.lua");
		return;
	}
	std::cout << "> Loaded modules" << std::endl;

	// Load items.xml
	spdlog::info("Loading XML scripts...");
	spdlog::info("Loading items.xml");
	if (!Item::items.loadFromXml()) {
		startupErrorMessage("Can not load: data/items/items.xml");
		return;
	}
	std::cout << "> Loaded vocations" << std::endl;

	// Load modules
	spdlog::info("Loading modules.xml");
	if (!g_modules().load()) {
		startupErrorMessage("Can not load: data/modules/modules.xml");
		return;
	}

	// Load vocations
	spdlog::info("Loading vocations.xml");
	if (!g_vocations().loadFromXml()) {
		startupErrorMessage("Can not load: data/XML/vocations.xml");
		return;
	}
	
	// Load imbuements
	spdlog::info("Loading imbuements.xml");
	if (!g_imbuements().loadFromXml()) {
		startupErrorMessage("Can not load: data/XML/imbuements.xml");
		return;
	}
	std::cout << "> Loaded imbuements" << std::endl;

	// Load schedule events
	spdlog::info("Loading events.xml");
	if (!g_game().loadScheduleEventFromXml()) {
		startupErrorMessage("Can not load: data/XML/events.xml");
	}

	// Load outfits
	spdlog::info("Loading outfits.xml");
	if (!Outfits::getInstance().loadFromXml()) {
		startupErrorMessage("Can not load: data/XML/outfits.xml");
		return;
	}
	std::cout << "> Loaded outfits" << std::endl;

	// Load familiars
	spdlog::info("Loading familiars.xml");
	if (!Familiars::getInstance().loadFromXml()) {
		startupErrorMessage("Can not load: data/XML/familiars.xml");
		return;
	}

	// Load spells
	spdlog::info("Loading spells.xml");
	if (!g_spells().loadFromXml()) {
		startupErrorMessage("Can not load: data/spells/spells.xml");
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

	// Load lua scripts
	spdlog::info("Loading revscriptsys...");
	spdlog::info("Loading lib");
	if (!g_scripts().loadScripts("scripts/lib", true, false)) {
		startupErrorMessage("Can not load: data/scripts/libs");
		return;
	}

	// Load folder data/scripts
	spdlog::info("Loading scripts");
	if (!g_scripts().loadScripts("scripts", false, false)) {
		startupErrorMessage("Can not load: data/scripts");
		return;
	}

	// Load monsters
	spdlog::info("Loading monsters");	
	if (!g_scripts().loadScripts("monster", false, false)) {	
		startupErrorMessage("Can not load: data/monster");	
		return;	
	}

	// Load boosted creature
	g_game().loadBoostedCreature();

	std::string worldType = asLowerCaseString(g_config().getString(
                            ConfigManager::WORLD_TYPE));
	if (worldType == "pvp") {
		g_game().setWorldType(WORLD_TYPE_PVP);
	} else if (worldType == "no-pvp") {
		g_game().setWorldType(WORLD_TYPE_NO_PVP);
	} else if (worldType == "pvp-enforced") {
		g_game().setWorldType(WORLD_TYPE_PVP_ENFORCED);
	} else {
		std::string str;
		str.reserve(64);
		str.append("Unknown world type: ")
           .append(g_config().getString(ConfigManager::WORLD_TYPE))
           .append(", valid world types are: pvp, no-pvp and pvp-enforced");
		startupErrorMessage(str);
		return;
	}

	spdlog::info("World type set as {}", asUpperCaseString(worldType));

	spdlog::info("Loading map...");
	if (!g_game().loadMainMap(g_config().getString(ConfigManager::MAP_NAME))) {
		startupErrorMessage("Failed to load map");
		return;
	}
	std::cout << "> Loaded map" << std::endl;

	spdlog::info("Initializing gamestate...");
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

	spdlog::info("Loaded all modules, server starting up...");

#ifndef _WIN32
	if (getuid() == 0 || geteuid() == 0) {
		spdlog::warn("{} has been executed as root user, "
                    "please consider running it as a normal user",
                    STATUS_SERVER_NAME);
	}
#endif

	g_game().start(services);
	g_game().setGameState(GAME_STATE_NORMAL);

	webhook_init();
	webhook_send_message("Server is now online", "Server has successfully started.", WEBHOOK_COLOR_ONLINE);

	g_loaderSignal.notify_all();
}

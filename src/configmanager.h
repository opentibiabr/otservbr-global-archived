/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
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

#ifndef FS_CONFIGMANAGER_H_6BDD23BD0B8344F4B7C40E8BE6AF6F39
#define FS_CONFIGMANAGER_H_6BDD23BD0B8344F4B7C40E8BE6AF6F39

class ConfigManager
{
	public:
		enum boolean_config_t {
			ALLOW_CHANGEOUTFIT,
			ONE_PLAYER_ON_ACCOUNT,
			AIMBOT_HOTKEY_ENABLED,
			REMOVE_RUNE_CHARGES,
			EXPERIENCE_FROM_PLAYERS,
			FREE_PREMIUM,
			REPLACE_KICK_ON_LOGIN,
			ALLOW_CLONES,
			BIND_ONLY_GLOBAL_ADDRESS,
			OPTIMIZE_DATABASE,
			MARKET_PREMIUM,
			EMOTE_SPELLS,
			STAMINA_SYSTEM,
			WARN_UNSAFE_SCRIPTS,
			CONVERT_UNSAFE_SCRIPTS,
			CLASSIC_EQUIPMENT_SLOTS,
			CLASSIC_ATTACK_SPEED,
			SCRIPTS_CONSOLE_LOGS,
			REMOVE_WEAPON_AMMO,
			REMOVE_WEAPON_CHARGES,
			REMOVE_POTION_CHARGES,
			SERVER_SAVE_NOTIFY_MESSAGE,
			SERVER_SAVE_CLEAN_MAP,
			SERVER_SAVE_CLOSE,
			SERVER_SAVE_SHUTDOWN,
			FORCE_MONSTERTYPE_LOAD,
			HOUSE_OWNED_BY_ACCOUNT,
			CLEAN_PROTECTION_ZONES,
			STOREMODULES,
			ALLOW_BLOCK_SPAWN,
			ONLY_INVITED_CAN_MOVE_HOUSE_ITEMS,
			WEATHER_RAIN,
			WEATHER_THUNDER,
			FREE_QUESTS,
			ONLY_PREMIUM_ACCOUNT,
			MAP_CUSTOM_ENABLED,
			ALL_CONSOLE_LOG,

			LAST_BOOLEAN_CONFIG /* this must be the last one */
		};

		enum string_config_t {
			MAP_NAME,
			HOUSE_RENT_PERIOD,
			SERVER_NAME,
			OWNER_NAME,
			OWNER_EMAIL,
			URL,
			LOCATION,
			IP,
			MOTD,
			WORLD_TYPE,
			MYSQL_HOST,
			MYSQL_USER,
			MYSQL_PASS,
			MYSQL_DB,
			MYSQL_SOCK,
			DEFAULT_PRIORITY,
			MAP_AUTHOR,
			STORE_IMAGES_URL,
			CLIENT_VERSION_STR,
			MAP_CUSTOM_NAME,
			MAP_CUSTOM_FILE,
			MAP_CUSTOM_SPAWN,
			MAP_CUSTOM_AUTHOR,
      DISCORD_WEBHOOK_URL,

			LAST_STRING_CONFIG /* this must be the last one */
		};

		enum integer_config_t {
			SQL_PORT,
			MAX_PLAYERS,
			PZ_LOCKED,
			DEFAULT_DESPAWNRANGE,
			DEFAULT_DESPAWNRADIUS,
			RATE_EXPERIENCE,
			RATE_SKILL,
			RATE_LOOT,
			RATE_MAGIC,
			RATE_SPAWN,
			HOUSE_PRICE,
			MAX_MESSAGEBUFFER,
			ACTIONS_DELAY_INTERVAL,
			EX_ACTIONS_DELAY_INTERVAL,
			KICK_AFTER_MINUTES,
			PROTECTION_LEVEL,
			DEATH_LOSE_PERCENT,
			STATUSQUERY_TIMEOUT,
			FRAG_TIME,
			WHITE_SKULL_TIME,
			GAME_PORT,
			LOGIN_PORT,
			STATUS_PORT,
			STAIRHOP_DELAY,
			MAX_CONTAINER,
			MAX_ITEM,
			MARKET_OFFER_DURATION,
			CLIENT_VERSION,
			DEPOT_BOXES,
			FREE_DEPOT_LIMIT,
			PREMIUM_DEPOT_LIMIT,
			CHECK_EXPIRED_MARKET_OFFERS_EACH_MINUTES,
			MAX_MARKET_OFFERS_AT_A_TIME_PER_PLAYER,
			EXP_FROM_PLAYERS_LEVEL_RANGE,
			MAX_PACKETS_PER_SECOND,
			STORE_COIN_PACKET,
			DAY_KILLS_TO_RED,
			WEEK_KILLS_TO_RED,
			MONTH_KILLS_TO_RED,
			RED_SKULL_DURATION,
			BLACK_SKULL_DURATION,
			ORANGE_SKULL_DURATION,
			SERVER_SAVE_NOTIFY_DURATION,
			PUSH_DELAY,
			PUSH_DISTANCE_DELAY,
			STASH_ITEMS,
			PARTY_LIST_MAX_DISTANCE,

			LAST_INTEGER_CONFIG /* this must be the last one */
		};

		enum floating_config_t {
			RATE_MONSTER_HEALTH,
			RATE_MONSTER_ATTACK,
			RATE_MONSTER_DEFENSE,

			LAST_FLOATING_CONFIG
		};

		bool load();
		bool reload();

		const std::string& getString(string_config_t what) const;
		int32_t getNumber(integer_config_t what) const;
		int16_t getShortNumber(integer_config_t what) const;
		bool getBoolean(boolean_config_t what) const;
		float getFloat(floating_config_t what) const;

		std::string const& setConfigFileLua(const std::string& what) {
			configFileLua = { what };
			return configFileLua;
		};
		std::string const& getConfigFileLua() const {
			return configFileLua;
		};

	private:
		std::string configFileLua = { "config.lua" };
		std::string string[LAST_STRING_CONFIG] = {};
		int32_t integer[LAST_INTEGER_CONFIG] = {};
		bool boolean[LAST_BOOLEAN_CONFIG] = {};
		float floating[LAST_FLOATING_CONFIG] = {};

		bool loaded = false;
};

#endif

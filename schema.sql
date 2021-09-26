--
-- OTServBR - Global - Database schema
--

-- --------------------------------------------------------

--
-- Table structure `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
	`config` varchar(50) NOT NULL,
	`value` varchar(256) NOT NULL DEFAULT '',
	CONSTRAINT `server_config_pk` PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `server_config` (`config`, `value`) VALUES ('db_version', '17'), ('motd_hash', ''), ('motd_num', '0'), ('players_record', '0');

-- --------------------------------------------------------

--
-- Table structure `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id`        int(11)       UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`      varchar(32)   NOT NULL,
  `password`  char(40)      NOT NULL,
  `email`     varchar(255)  NOT NULL DEFAULT '',
  `premdays`  int(11)       NOT NULL DEFAULT '0',
  `lastday`   int(10)       UNSIGNED NOT NULL DEFAULT '0',
  `type`      tinyint(1)    UNSIGNED NOT NULL DEFAULT '1',
  `coins`     int(12)       UNSIGNED NOT NULL DEFAULT '0',
  `creation`  int(11)       UNSIGNED NOT NULL DEFAULT '0',
  `recruiter` INT(6)        DEFAULT 0,
  CONSTRAINT `accounts_pk` PRIMARY KEY (`id`),
  CONSTRAINT `accounts_unique` UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `coins_transactions`
--

CREATE TABLE IF NOT EXISTS `coins_transactions` (
  `id`          int(11)       UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id`  int(11)       UNSIGNED NOT NULL,
  `type`        tinyint(1)    UNSIGNED NOT NULL,
  `amount`      int(12)       UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp`   timestamp     DEFAULT CURRENT_TIMESTAMP,
  INDEX `account_id` (`account_id`),
  CONSTRAINT `coins_transactions_pk` PRIMARY KEY (`id`),
  CONSTRAINT `coins_transactions_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` bigint(20) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `blessings1` tinyint(4) NOT NULL DEFAULT '0',
  `blessings2` tinyint(4) NOT NULL DEFAULT '0',
  `blessings3` tinyint(4) NOT NULL DEFAULT '0',
  `blessings4` tinyint(4) NOT NULL DEFAULT '0',
  `blessings5` tinyint(4) NOT NULL DEFAULT '0',
  `blessings6` tinyint(4) NOT NULL DEFAULT '0',
  `blessings7` tinyint(4) NOT NULL DEFAULT '0',
  `blessings8` tinyint(4) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `manashield` SMALLINT UNSIGNED NOT NULL DEFAULT '0',
  `max_manashield` SMALLINT UNSIGNED NOT NULL DEFAULT '0',
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT '1',
  `xpboost_stamina` smallint(5) DEFAULT NULL,
  `xpboost_value` tinyint(4) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `marriage_spouse` int(11) NOT NULL DEFAULT '-1',
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT '0',
  `quickloot_fallback` tinyint(1) DEFAULT '0',
  `lookmountbody` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmountfeet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmounthead` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookmountlegs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lookfamiliarstype` int(11) unsigned NOT NULL DEFAULT '0',
  `isreward` tinyint(1) NOT NULL DEFAULT '1',
  `istutorial` tinyint(1) NOT NULL DEFAULT '0',
  INDEX `account_id` (`account_id`),
  INDEX `vocation` (`vocation`),
  CONSTRAINT `players_pk` PRIMARY KEY (`id`),
  CONSTRAINT `players_unique` UNIQUE (`name`),
  CONSTRAINT `players_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Table structure `account_bans`
--

CREATE TABLE IF NOT EXISTS `account_bans` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  INDEX `banned_by` (`banned_by`),
  CONSTRAINT `account_bans_pk` PRIMARY KEY (`account_id`),
  CONSTRAINT `account_bans_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `account_bans_player_fk`
    FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `account_ban_history`
--

CREATE TABLE IF NOT EXISTS `account_ban_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  INDEX `account_id` (`account_id`),
  INDEX `banned_by` (`banned_by`),
  CONSTRAINT `account_bans_history_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `account_bans_history_player_fk`
    FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_pk` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  INDEX `account_id` (`account_id`),
  INDEX `player_id` (`player_id`),
  CONSTRAINT `account_viplist_unique` UNIQUE (`account_id`, `player_id`),
  CONSTRAINT `account_viplist_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `account_viplist_player_fk`
    FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `boosted_creature`
--

CREATE TABLE IF NOT EXISTS `boosted_creature` (
    `boostname` TEXT,
    `date` varchar(250) NOT NULL DEFAULT '',
    `raceid` varchar(250) NOT NULL DEFAULT '',
    `looktype` int(11) NOT NULL DEFAULT "136",
    `lookfeet` int(11) NOT NULL DEFAULT "0",
    `looklegs` int(11) NOT NULL DEFAULT "0",
    `lookhead` int(11) NOT NULL DEFAULT "0",
    `lookbody` int(11) NOT NULL DEFAULT "0",
    `lookaddons` int(11) NOT NULL DEFAULT "0",
    `lookmount` int(11) DEFAULT "0",
    PRIMARY KEY  (`date`)
) AS SELECT 0 AS date, "default" AS boostname, 0 AS raceid;

-- --------------------------------------------------------

--
-- Tabble Structure `daily_reward_history`
--

CREATE TABLE IF NOT EXISTS `daily_reward_history` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`daystreak` smallint(2) NOT NULL DEFAULT 0,
	`player_id` int(11) NOT NULL,
	`timestamp` int(11) NOT NULL,
	`description` varchar(255) DEFAULT NULL,
	INDEX `player_id` (`player_id`),
	CONSTRAINT `daily_reward_history_pk` PRIMARY KEY (`id`),
	CONSTRAINT `daily_reward_history_player_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
	`key` varchar(32) NOT NULL,
	`value` text NOT NULL,
	CONSTRAINT `global_storage_unique` UNIQUE (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`level` int(11) NOT NULL DEFAULT '1',
	`name` varchar(255) NOT NULL,
	`ownerid` int(11) NOT NULL,
	`creationdata` int(11) NOT NULL,
	`motd` varchar(255) NOT NULL DEFAULT '',
	`residence` int(11) NOT NULL DEFAULT '0',
	`balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`points` int(11) NOT NULL DEFAULT '0',
	CONSTRAINT `guilds_pk` PRIMARY KEY (`id`),
	CONSTRAINT `guilds_name_unique` UNIQUE (`name`),
	CONSTRAINT `guilds_owner_unique` UNIQUE (`ownerid`),
	CONSTRAINT `guilds_ownerid_fk`
		FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`guild1` int(11) NOT NULL DEFAULT '0',
	`guild2` int(11) NOT NULL DEFAULT '0',
	`name1` varchar(255) NOT NULL,
	`name2` varchar(255) NOT NULL,
	`status` tinyint(2) NOT NULL DEFAULT '0',
	`started` bigint(15) NOT NULL DEFAULT '0',
	`ended` bigint(15) NOT NULL DEFAULT '0',
	INDEX `guild1` (`guild1`),
	INDEX `guild2` (`guild2`),
	CONSTRAINT `guild_wars_pk` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `guildwar_kills`
--

CREATE TABLE IF NOT EXISTS `guildwar_kills` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`killer` varchar(50) NOT NULL,
	`target` varchar(50) NOT NULL,
	`killerguild` int(11) NOT NULL DEFAULT '0',
	`targetguild` int(11) NOT NULL DEFAULT '0',
	`warid` int(11) NOT NULL DEFAULT '0',
	`time` bigint(15) NOT NULL,
	INDEX `warid` (`warid`),
	CONSTRAINT `guildwar_kills_pk` PRIMARY KEY (`id`),
	CONSTRAINT `guildwar_kills_unique` UNIQUE (`warid`),
	CONSTRAINT `guildwar_kills_warid_fk`
		FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
	`player_id` int(11) NOT NULL DEFAULT '0',
	`guild_id` int(11) NOT NULL DEFAULT '0',
	`date` int(11) NOT NULL,
	INDEX `guild_id` (`guild_id`),
	CONSTRAINT `guild_invites_pk` PRIMARY KEY (`player_id`, `guild_id`),
	CONSTRAINT `guild_invites_player_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE,
	CONSTRAINT `guild_invites_guild_fk`
		FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`guild_id` int(11) NOT NULL COMMENT 'guild',
	`name` varchar(255) NOT NULL COMMENT 'rank name',
	`level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else',
	INDEX `guild_id` (`guild_id`),
	CONSTRAINT `guild_ranks_pk` PRIMARY KEY (`id`),
	CONSTRAINT `guild_ranks_fk`
		FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Trigger
--
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
		INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure `guild_membership`
--

CREATE TABLE IF NOT EXISTS `guild_membership` (
	`player_id` int(11) NOT NULL,
	`guild_id` int(11) NOT NULL,
	`rank_id` int(11) NOT NULL,
	`nick` varchar(15) NOT NULL DEFAULT '',
	INDEX `guild_id` (`guild_id`),
	INDEX `rank_id` (`rank_id`),
	CONSTRAINT `guild_membership_pk` PRIMARY KEY (`player_id`),
	CONSTRAINT `guild_membership_player_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `guild_membership_guild_fk`
		FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `guild_membership_rank_fk`
		FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`owner` int(11) NOT NULL,
	`paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
	`warnings` int(11) NOT NULL DEFAULT '0',
	`name` varchar(255) NOT NULL,
	`rent` int(11) NOT NULL DEFAULT '0',
	`town_id` int(11) NOT NULL DEFAULT '0',
	`bid` int(11) NOT NULL DEFAULT '0',
	`bid_end` int(11) NOT NULL DEFAULT '0',
	`last_bid` int(11) NOT NULL DEFAULT '0',
	`highest_bidder` int(11) NOT NULL DEFAULT '0',
	`size` int(11) NOT NULL DEFAULT '0',
	`guildid` int(11),
	`beds` int(11) NOT NULL DEFAULT '0',
	INDEX `owner` (`owner`),
	INDEX `town_id` (`town_id`),
	CONSTRAINT `houses_pk` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- trigger
--
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
		UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
	`house_id` int(11) NOT NULL,
	`listid` int(11) NOT NULL,
	`list` text NOT NULL,
	INDEX `house_id` (`house_id`),
	CONSTRAINT `houses_list_house_fk`
		FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `ip_bans`
--

CREATE TABLE IF NOT EXISTS `ip_bans` (
	`ip` int(11) NOT NULL,
	`reason` varchar(255) NOT NULL,
	`banned_at` bigint(20) NOT NULL,
	`expires_at` bigint(20) NOT NULL,
	`banned_by` int(11) NOT NULL,
	INDEX `banned_by` (`banned_by`),
	CONSTRAINT `ip_bans_pk` PRIMARY KEY (`ip`),
	CONSTRAINT `ip_bans_players_fk`
		FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `market_history`
--

CREATE TABLE IF NOT EXISTS `market_history` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`player_id` int(11) NOT NULL,
	`sale` tinyint(1) NOT NULL DEFAULT '0',
	`itemtype` int(10) UNSIGNED NOT NULL,
	`amount` smallint(5) UNSIGNED NOT NULL,
	`price` int(10) UNSIGNED NOT NULL DEFAULT '0',
	`expires_at` bigint(20) UNSIGNED NOT NULL,
	`inserted` bigint(20) UNSIGNED NOT NULL,
	`state` tinyint(1) UNSIGNED NOT NULL,
	INDEX `player_id` (`player_id`,`sale`),
	CONSTRAINT `market_history_pk` PRIMARY KEY (`id`),
	CONSTRAINT `market_history_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `market_offers`
--

CREATE TABLE IF NOT EXISTS `market_offers` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`player_id` int(11) NOT NULL,
	`sale` tinyint(1) NOT NULL DEFAULT '0',
	`itemtype` int(10) UNSIGNED NOT NULL,
	`amount` smallint(5) UNSIGNED NOT NULL,
	`created` bigint(20) UNSIGNED NOT NULL,
	`anonymous` tinyint(1) NOT NULL DEFAULT '0',
	`price` int(10) UNSIGNED NOT NULL DEFAULT '0',
	INDEX `sale` (`sale`,`itemtype`),
	INDEX `created` (`created`),
	INDEX `player_id` (`player_id`),
	CONSTRAINT `market_offers_pk` PRIMARY KEY (`id`),
	CONSTRAINT `market_offers_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure `players_online`
--

CREATE TABLE IF NOT EXISTS `players_online` (
	`player_id` int(11) NOT NULL,
	CONSTRAINT `players_online_pk` PRIMARY KEY (`player_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_charm`
--

CREATE TABLE IF NOT EXISTS `player_charms` (
	`player_guid` INT(250) NOT NULL,
	`charm_points` VARCHAR(250) NULL,
	`charm_expansion` BOOLEAN NULL,
	`rune_wound` INT(250) NULL,
	`rune_enflame` INT(250) NULL,
	`rune_poison` INT(250) NULL,
	`rune_freeze` INT(250) NULL,
	`rune_zap` INT(250) NULL,
	`rune_curse` INT(250) NULL,
	`rune_cripple` INT(250) NULL,
	`rune_parry` INT(250) NULL,
	`rune_dodge` INT(250) NULL,
	`rune_adrenaline` INT(250) NULL,
	`rune_numb` INT(250) NULL,
	`rune_cleanse` INT(250) NULL,
	`rune_bless` INT(250) NULL,
	`rune_scavenge` INT(250) NULL,
	`rune_gut` INT(250) NULL,
	`rune_low_blow` INT(250) NULL,
	`rune_divine` INT(250) NULL,
	`rune_vamp` INT(250) NULL,
	`rune_void` INT(250) NULL,
	`UsedRunesBit` VARCHAR(250) NULL,
	`UnlockedRunesBit` VARCHAR(250) NULL,
	`tracker list` BLOB NULL
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
	`player_id` int(11) NOT NULL,
	`time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`level` int(11) NOT NULL DEFAULT '1',
	`killed_by` varchar(255) NOT NULL,
	`is_player` tinyint(1) NOT NULL DEFAULT '1',
	`mostdamage_by` varchar(100) NOT NULL,
	`mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
	`unjustified` tinyint(1) NOT NULL DEFAULT '0',
	`mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0',
	INDEX `player_id` (`player_id`),
	INDEX `killed_by` (`killed_by`),
	INDEX `mostdamage_by` (`mostdamage_by`),
	CONSTRAINT `player_deaths_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
	`player_id` int(11) NOT NULL,
	`sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
	`pid` int(11) NOT NULL DEFAULT '0',
	`itemtype` int(11) NOT NULL DEFAULT '0',
	`count` int(11) NOT NULL DEFAULT '0',
	`attributes` blob NOT NULL,
	CONSTRAINT `player_depotitems_unique` UNIQUE (`player_id`, `sid`),
	CONSTRAINT `player_depotitems_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_hirelings`
--

CREATE TABLE IF NOT EXISTS `player_hirelings` (
	`id` INT NOT NULL PRIMARY KEY auto_increment,
	`player_id` INT NOT NULL,
	`name` varchar(255),
	`active` tinyint unsigned NOT NULL DEFAULT '0',
	`sex` tinyint unsigned NOT NULL DEFAULT '0',
	`posx` int(11) NOT NULL DEFAULT '0',
	`posy` int(11) NOT NULL DEFAULT '0',
	`posz` int(11) NOT NULL DEFAULT '0',
	`lookbody` int(11) NOT NULL DEFAULT '0',
	`lookfeet` int(11) NOT NULL DEFAULT '0',
	`lookhead` int(11) NOT NULL DEFAULT '0',
	`looklegs` int(11) NOT NULL DEFAULT '0',
	`looktype` int(11) NOT NULL DEFAULT '136',
		FOREIGN KEY(`player_id`) REFERENCES `players`(`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_inboxitems`
--

CREATE TABLE IF NOT EXISTS `player_inboxitems` (
	`player_id` int(11) NOT NULL,
	`sid` int(11) NOT NULL,
	`pid` int(11) NOT NULL DEFAULT '0',
	`itemtype` int(11) NOT NULL DEFAULT '0',
	`count` int(11) NOT NULL DEFAULT '0',
	`attributes` blob NOT NULL,
	CONSTRAINT `player_inboxitems_unique` UNIQUE (`player_id`, `sid`),
	CONSTRAINT `player_inboxitems_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
	`player_id` int(11) NOT NULL DEFAULT '0',
	`pid` int(11) NOT NULL DEFAULT '0',
	`sid` int(11) NOT NULL DEFAULT '0',
	`itemtype` int(11) NOT NULL DEFAULT '0',
	`count` int(11) NOT NULL DEFAULT '0',
	`attributes` blob NOT NULL,
	INDEX `player_id` (`player_id`),
	INDEX `sid` (`sid`),
	CONSTRAINT `player_items_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_kills`
--

CREATE TABLE IF NOT EXISTS `player_kills` (
	`player_id` int(11) NOT NULL,
	`time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
	`target` int(11) NOT NULL,
	`unavenged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_misc`
--

CREATE TABLE IF NOT EXISTS `player_misc` (
	`player_id` int(11) NOT NULL,
	`info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
	`player_id` int(11) NOT NULL,
	`reason` varchar(255) NOT NULL,
	`namelocked_at` bigint(20) NOT NULL,
	`namelocked_by` int(11) NOT NULL,
	INDEX `namelocked_by` (`namelocked_by`),
	CONSTRAINT `player_namelocks_unique` UNIQUE (`player_id`),
	CONSTRAINT `player_namelocks_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT `player_namelocks_players2_fk`
		FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_prey`
--

CREATE TABLE IF NOT EXISTS `player_prey` (
	`player_id` int(11) NOT NULL,
	`name` varchar(50) NOT NULL,
	`mindex` smallint(6) NOT NULL,
	`mcolumn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_preytimes`
--

CREATE TABLE IF NOT EXISTS `player_preytimes` (
	`player_id` int(11) NOT NULL,
	`bonus_type1` int(11) NOT NULL,
	`bonus_value1` int(11) NOT NULL,
	`bonus_name1` varchar(50) NOT NULL,
	`bonus_type2` int(11) NOT NULL,
	`bonus_value2` int(11) NOT NULL,
	`bonus_name2` varchar(50) NOT NULL,
	`bonus_type3` int(11) NOT NULL,
	`bonus_value3` int(11) NOT NULL,
	`bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_rewards`
--

CREATE TABLE IF NOT EXISTS `player_rewards` (
	`player_id` int(11) NOT NULL,
	`sid` int(11) NOT NULL,
	`pid` int(11) NOT NULL DEFAULT '0',
	`itemtype` int(11) NOT NULL DEFAULT '0',
	`count` int(11) NOT NULL DEFAULT '0',
	`attributes` blob NOT NULL,
	CONSTRAINT `player_rewards_unique` UNIQUE (`player_id`, `sid`),
	CONSTRAINT `player_rewards_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
	`player_id` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	INDEX `player_id` (`player_id`),
	CONSTRAINT `player_spells_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_stash`
--

CREATE TABLE IF NOT EXISTS `player_stash` (
	`player_id` INT(16) NOT NULL,
	`item_id` INT(16) NOT NULL,
	`item_count` INT(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
	`player_id` int(11) NOT NULL DEFAULT '0',
	`key` int(10) UNSIGNED NOT NULL DEFAULT '0',
	`value` int(11) NOT NULL DEFAULT '0',
	CONSTRAINT `player_storage_pk` PRIMARY KEY (`player_id`, `key`),
	CONSTRAINT `player_storage_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `store_history`
--

CREATE TABLE IF NOT EXISTS `store_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) UNSIGNED NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  INDEX `account_id` (`account_id`),
  CONSTRAINT `store_history_pk` PRIMARY KEY (`id`),
  CONSTRAINT `store_history_account_fk`
    FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `tile_store`
--

CREATE TABLE IF NOT EXISTS `tile_store` (
	`house_id` int(11) NOT NULL,
	`data` longblob NOT NULL,
	INDEX `house_id` (`house_id`),
	CONSTRAINT `tile_store_account_fk`
		FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure `prey_slots`
--

CREATE TABLE IF NOT EXISTS `prey_slots` (
	`player_id` int(11) NOT NULL,
	`num` smallint(2) NOT NULL,
	`state` smallint(2) NOT NULL DEFAULT '1',
	`unlocked` smallint(2) NOT NULL DEFAULT '0',
	`current` varchar(40) NOT NULL DEFAULT '',
	`monster_list` varchar(360) NOT NULL,
	`free_reroll_in` int(11) NOT NULL DEFAULT '0',
	`time_left` smallint(5) NOT NULL DEFAULT '0',
	`next_use` int(11) NOT NULL DEFAULT '0',
	`bonus_type` smallint(3) NOT NULL,
	`bonus_value` smallint(3) NOT NULL DEFAULT '0',
	`bonus_grade` smallint(3) NOT NULL DEFAULT '0',
	`tick` smallint(3) NOT NULL DEFAULT '0',
	INDEX `player_id` (`player_id`),
	CONSTRAINT `prey_slots_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
		ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Create Account god/god
--
INSERT INTO `accounts`
(`id`,  `name`, `email`, `password`, `type`) VALUES
(1, 'god', '@god', '21298df8a3277357ee55b01df9530b535cf08ec1',  5);

--
-- Create player on GOD account
-- Create sample characters
INSERT INTO `players`
(`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `maglevel`, `mana`, `manamax`, `manaspent`, `town_id`, `conditions`, `cap`, `sex`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`) VALUES
(1, 'Rook Sample',     1, 1, 2, 0, 155, 155, 100,  113, 115, 95, 39, 129, 2, 60, 60, 5936, 1, '', 410, 1, 12, 155, 12, 155, 12, 155, 12, 93),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 90, 90, 0,    8, '', 470, 1, 10, 0,   10, 0,   10,  0,  10, 0),
(3, 'Druid Sample',    1, 1, 8, 2, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 90, 90, 0,    8, '', 470, 1, 10, 0,   10, 0,   10,  0,  10, 0),
(4, 'Paladin Sample',  1, 1, 8, 3, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 90, 90, 0,    8, '', 470, 1, 10, 0,   10, 0,   10,  0,  10, 0),
(5, 'Knight Sample',   1, 1, 8, 4, 185, 185, 4200, 113, 115, 95, 39, 129, 0, 90, 90, 0,    8, '', 470, 1, 10, 0,   10, 0,   10,  0,  10, 0),
(6, 'GOD',             6, 1, 2, 0, 155, 155, 100,  113, 115, 95, 39, 75,  0, 60, 60, 0,    8, '', 410, 1, 10, 0,   10, 0,   10,  0,  10, 0);

function onUpdateDatabase()
	print("> Updating database to version 25 (Imbuement and Prey System)")
	db.query("CREATE TABLE IF NOT EXISTS `player_prey` (`player_id` int(11) NOT NULL, `name` varchar(50) NOT NULL, `mindex` smallint(6) NOT NULL, `mcolumn` int(11) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;")
	db.query("CREATE TABLE IF NOT EXISTS `player_preytimes` (`player_id` int(11) NOT NULL, `bonus_type1` int(11) NOT NULL, `bonus_value1` int(11) NOT NULL, `bonus_name1` varchar(50) NOT NULL, `bonus_type2` int(11) NOT NULL, `bonus_value2` int(11) NOT NULL, `bonus_name2` varchar(50) NOT NULL, `bonus_type3` int(11) NOT NULL, `bonus_value3` int(11) NOT NULL, `bonus_name3` varchar(50) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;")
	db.query("ALTER TABLE `players` ADD COLUMN `prey_stamina_1` int(11) DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD COLUMN `prey_stamina_2` int(11) DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD COLUMN `prey_stamina_3` int(11) DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD COLUMN `prey_column` smallint(6) NOT NULL DEFAULT 1")
	db.query("ALTER TABLE `players` ADD COLUMN `bonus_reroll` int(11) DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD COLUMN `xpboost_stamina` smallint(5) DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD COLUMN `xpboost_value` tinyint(4) DEFAULT NULL")
	return true
end
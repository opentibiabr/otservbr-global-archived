function onUpdateDatabase()
	print("> Updating database to version 26 (Blessings Dialog System)")
	db.query("CREATE TABLE `blessings_history` (`id` int(11) NOT NULL, `player_id` int(11) NOT NULL, `blessing` tinyint(4) NOT NULL, `loss` tinyint(1) NOT NULL, `timestamp` int(11) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings1` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings2` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings1`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings3` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings2`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings4` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings3`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings5` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings4`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings6` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings5`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings7` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings6`")
	db.query("ALTER TABLE `players` ADD COLUMN `blessings8` tinyint(4) NOT NULL DEFAULT '0' AFTER `blessings7`")
	return true
end
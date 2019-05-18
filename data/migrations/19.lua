function onUpdateDatabase()
	print("> Updating database to version 19 (casting system)")
	db.query("CREATE TABLE IF NOT EXISTS `live_casts` ( `player_id` int(11) NOT NULL, `cast_name` varchar(255) NOT NULL, `password` boolean NOT NULL DEFAULT false, `description` varchar(255), `spectators` smallint(5) DEFAULT 0, UNIQUE KEY `player_id_2` (`player_id`), FOREIGN KEY (`player_id`) REFERENCES `players`(`id`) ON DELETE CASCADE ) ENGINE=InnoDB;")
	return true
end

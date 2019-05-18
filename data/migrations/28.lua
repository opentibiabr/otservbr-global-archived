function onUpdateDatabase()
	print("> Updating database to version 28 (Prepare to Snowball War Event)")
	db.query("CREATE TABLE `snowballwar` (`id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `score` int(11) NOT NULL,`data` varchar(255) NOT NULL, `hora` varchar(255) NOT NULL, PRIMARY KEY (`id`), KEY `id` (`id`)) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;")
	db.query("ALTER TABLE `players` ADD `sbw_points` int(11) NOT NULL DEFAULT '0'")
	return true
end

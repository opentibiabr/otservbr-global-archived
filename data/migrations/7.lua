function onUpdateDatabase()
	print("> Updating database to version 31 (Mount Colors)")
	db.query("ALTER TABLE `players` ADD `lookmountbody` tinyint(3) unsigned NOT NULL DEFAULT '0'")
	db.query("ALTER TABLE `players` ADD `lookmountfeet` tinyint(3) unsigned NOT NULL DEFAULT '0'")
	db.query("ALTER TABLE `players` ADD `lookmounthead` tinyint(3) unsigned NOT NULL DEFAULT '0'")
	db.query("ALTER TABLE `players` ADD `lookmountlegs` tinyint(3) unsigned NOT NULL DEFAULT '0'")
	return true
end

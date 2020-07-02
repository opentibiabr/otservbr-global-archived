function onUpdateDatabase()
	print("> Updating database to version 4 (quickloot)")
	db.query("ALTER TABLE `players` ADD `quickloot_fallback` TINYINT DEFAULT 0")
	return true
end

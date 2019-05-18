function onUpdateDatabase()
	print("> Updating database to version 19 (update on depot chests)")
	db.query("UPDATE `player_depotitems` SET `pid` = 17 WHERE `pid` = 0")
	db.query("UPDATE `player_depotitems` SET `pid` = 17 WHERE `pid` > 17")
	return true
end

function onUpdateDatabase()
	print("> Updating database to version 1 (world system)")
	db.query("ALTER TABLE `server_config` ADD `world_id` INT(11) NOT NULL DEFAULT '0' FIRST;")
	db.query("ALTER TABLE `players` ADD `world_id` INT(11) NOT NULL DEFAULT '0' AFTER `id`;")
	db.query("ALTER TABLE `houses` ADD `world_id` INT(11) NOT NULL DEFAULT '0' AFTER `house_id`;")
	db.query("ALTER TABLE `market_offers` ADD `world_id` INT(11) NOT NULL DEFAULT '0' AFTER `id`;")
	db.query("ALTER TABLE `players_online` ADD `world_id` INT(11) NOT NULL DEFAULT '0' FIRST;")
	db.query("ALTER TABLE `tile_store` ADD `world_id` INT(11) NOT NULL DEFAULT '0' FIRST;")
return false 
end
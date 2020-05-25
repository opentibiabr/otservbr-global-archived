function onUpdateDatabase()
	print("> Updating database to version 1 (sample players)")
	db.query("UPDATE `players` SET `group_id` = 1, `account_id` = 1, `level` = 2, `vocation` = 0, `health` = 155, `healthmax` = 155, `experience` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 60, `manamax` = 60, `town_id` = 1, `cap` = 410 WHERE `id` = 2;")
	db.query("UPDATE `players` SET `group_id` = 1, `account_id` = 1, `level` = 8, `vocation` = 1, `health` = 185, `healthmax` = 185, `experience` = 4200, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 3;")
	db.query("UPDATE `players` SET `group_id` = 1, `account_id` = 1, `level` = 8, `vocation` = 2, `health` = 185, `healthmax` = 185, `experience` = 4200, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 4;")
	db.query("UPDATE `players` SET `group_id` = 1, `account_id` = 1, `level` = 8, `vocation` = 3, `health` = 185, `healthmax` = 185, `experience` = 4200, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 5;")
	db.query("UPDATE `players` SET `group_id` = 1, `account_id` = 1, `level` = 8, `vocation` = 4, `health` = 185, `healthmax` = 185, `experience` = 4200, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 6;")
	return false
end

function onUpdateDatabase()
	print("> Updating database to version 1 (sample players)")
	-- Rook Sample
	db.query("UPDATE `players` SET `level` = 2, `vocation` = 0, `health` = 155, `healthmax` = 155, `experience` = 100, `soul` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `maglevel` = 2, `mana` = 60, `manamax` = 60, `manaspent` = 5936, `town_id` = 1, `cap` = 410, `skill_club` = 12, `skill_club_tries` = 155, `skill_sword` = 12, `skill_sword_tries` = 155, `skill_axe` = 12, `skill_axe_tries` = 155, `skill_dist` = 12, `skill_dist_tries` = 93 WHERE `id` = 1;")
	-- Sorcerer Sample
	db.query("UPDATE `players` SET `level` = 8, `vocation` = 1, `health` = 185, `healthmax` = 185, `experience` = 4200, `soul` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 2;")
	-- Druid Sample
	db.query("UPDATE `players` SET `level` = 8, `vocation` = 2, `health` = 185, `healthmax` = 185, `experience` = 4200, `soul` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 3;")
	-- Paladin Sample
	db.query("UPDATE `players` SET `level` = 8, `vocation` = 3, `health` = 185, `healthmax` = 185, `experience` = 4200, `soul` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 4;")
	-- Knight Sample
	db.query("UPDATE `players` SET `level` = 8, `vocation` = 4, `health` = 185, `healthmax` = 185, `experience` = 4200, `soul` = 100, `lookbody` = 113, `lookfeet` = 115, `lookhead` = 95, `looklegs` = 39, `looktype` = 129, `mana` = 90, `manamax` = 90, `town_id` = 8, `cap` = 470 WHERE `id` = 5;")
	-- GOD
	db.query("UPDATE `players` SET `health` = 155, `healthmax` = 155, `experience` = 100, `looktype` = 75, `town_id` = 8 WHERE `id` = 6;")
	return true
end

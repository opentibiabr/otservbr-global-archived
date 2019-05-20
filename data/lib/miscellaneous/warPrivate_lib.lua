--[[ War Private TFS 1.0
	Alem desda lib fazem parte desse sistema:
	- warPrivate_npc
	- warPrivate_movements
	- warPrivate_creaturescript
--]]

--[[ Global Configs ]]--
warPrivate_duration = 60 -- Time Duration of a War.

--[[ Player Storages ]]--
warPrivate_storage = 95160 -- City
warPrivate_UE = 95600 -- NOUE
warPrivate_RUNES = 95601 -- NORUNES
warPrivate_Guild = 95602 -- Guild

--- CITY 1
warPrivate_city1 = {
	city = 1,
	time = 95161,
	war = {guild = 95162, enemy = 95163, ue = 95164, runes = 95165, limite = 95300, count1 = 95302, count2 = 95303},
	wait = {invite = 95166, accept = 95167, ue = 95168, runes = 95169, limite = 95301},
	pos_guild = Position(17951, 16644, 6),
	pos_enemy = Position(17944, 16683, 8),
}

--- CITY 2
warPrivate_city2 = {
	city = 2,
	time = 95171,
	war = {guild = 95172, enemy = 95173, ue = 95174, runes = 95175, limite = 95310, count1 = 95312, count2 = 95313},
	wait = {invite = 95176, accept = 95177, ue = 95178, runes = 95179, limite =  95311},
	pos_guild = Position(18006, 17083, 8),
	pos_enemy = Position(18084, 17104, 6),
}

--- CITY 3
warPrivate_city3 = {
	city = 3,
	time = 95181,
	war = {guild = 95182, enemy = 95183, ue = 95184, runes = 95185, limite =  95320, count1 = 95322, count2 = 95323},
	wait = {invite = 95186, accept = 95187, ue = 95188, runes = 95189, limite =  95321},
	pos_guild = Position(18215, 16689, 6),
	pos_enemy = Position(18229, 16693, 6),
}

--- CITY 4
warPrivate_city4 = {
	city = 4,
	time = 95191,
	war = {guild = 95192, enemy = 95193, ue = 95194, runes = 95195, limite =  95330, count1 = 95332, count2 = 95333},
	wait = {invite = 95196, accept = 95197, ue = 95198, runes = 95199, limite =  95331},
	pos_guild = Position(18276, 16919, 7),
	pos_enemy = Position(18283, 16838, 7),
}

--- CITY 5 -- carlin
warPrivate_city5 = {
	city = 5,
	time = 95250,
	war = {guild = 95251, enemy = 95253, ue = 95254, runes = 95255, limite =  95340, count1 = 95342, count2 = 95343},
	wait = {invite = 95256, accept = 95257, ue = 95258, runes = 95259, limite =  95341},
	pos_guild = Position(18218, 17220, 7),
	pos_enemy = Position(18490, 17056, 7),
}

-- Look README.md for see the reserved action/unique numbers

TeleportAction = {
	[35001] = {
		itemId = false,
		itemPos = {{x = xxxxx, y = yyyyy, z = z}}
	}
}

TeleportUnique = {
	-- The first dragon quest
	-- Path: data\scripts\movements\quests\first_dragon\entrance_teleport.lua
	-- Tazhadur entrance
	[35001] = {
		itemId = 9565,
		itemPos = {x = 33234, y = 32276, z = 12}
	},
	-- Kalyassa entrance
	[35002] = {
		itemId = 9562,
		itemPos = {x = 33160, y = 31320, z = 5}
	},
	-- Zorvorax entrance
	[35003] = {
		itemId = 9564,
		itemPos = {x = 33003, y = 31593, z = 11}
	},
	-- Gelidrazah entrance
	[35004] = {
		itemId = 9563,
		itemPos = {x = 32276, y = 31367, z = 4}
	},
	-- Tazhadur exit
	-- Path: data\scripts\movements\quests\first_dragon\exit_teleport.lua
	[35005] = {
		itemId = 9565,
		itemPos = {x = 32013, y = 32467, z = 8}
	},
	-- Kalyassa exit
	[35006] = {
		itemId = 9562,
		itemPos = {x = 32076, y = 32457, z = 8}
	},
	-- Zorvorax exit
	[35007] = {
		itemId = 9564,
		itemPos = {x = 32006, y = 32395, z = 8}
	},
	-- Gelidrazah exit
	[35008] = {
		itemId = 9563,
		itemPos = {x = 32077, y = 32404, z = 8}
	},
	-- Lions rock quest
	-- Path: data\scripts\movements\quests\lions_rock\lions_rock.lua
	[35009] = {
		itemId = false,
		itemPos = {x = 33128, y = 32308, z = 8}
	},
	-- Dawnport quest
	-- Sacred snake teleport
	-- Path: data\scripts\movements\quests\dawnport\legion_helmet.lua
	[35010] = {
		itemId = 1387,
		itemPos = {x = 32112, y = 31936, z = 8}
	},
	-- Draconia quest
	-- Exit teleport
	-- Path: data\scripts\movements\quests\draconia\movement-exit_teleport.lua
	[35011] = {
		itemId = 1387,
		itemPos = {x = 32805, y = 31587, z = 1}
	},
	-- Path: data\scripts\movements\quests\draconia\movement-escape.lua
	[35012] = {
		itemId = 1387,
		itemPos = {x = 32815, y = 31599, z = 9}
	},

	-- Simple teleports (They are registered automatically, without just configuring the table correctly)
	-- Path: data\scripts\movements\others\teleport.lua

	-- Deeper fibula quest teleport
	-- Entrance
	[38001] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32208, y = 32433, z = 10},
		-- For use of the script
		destination = {x = 32281, y = 32389, z = 10},
		effect = CONST_ME_TELEPORT
	},
	-- Exit
	[38002] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32234, y = 32502, z = 10},
		-- For use of the script
		destination = {x = 32210, y = 32437, z = 10},
		effect = CONST_ME_TELEPORT
	},
	-- Draconia quest teleports
	[38003] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32675, y = 31646, z = 10},
		-- For use of the script
		destination = {x = 32725, y = 31589, z = 12},
		effect = CONST_ME_TELEPORT
	},
	[38004] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32669, y = 31653, z = 10},
		-- For use of the script
		destination = {x = 32679, y = 31673, z = 10},
		effect = CONST_ME_TELEPORT
	},
	[38005] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32794, y = 31576, z = 5},
		-- For use of the script
		destination = {x = 32812, y = 31577, z = 5},
		effect = CONST_ME_TELEPORT
	},
	[38006] = {
		-- For use of the Map
		itemId = 1387,
		itemPos = {x = 32812, y = 31576, z = 5},
		-- For use of the script
		destination = {x = 32794, y = 31577, z = 5},
		effect = CONST_ME_TELEPORT
	}
}

-- Look README.md for see the reserved action/unique numbers

TileAction = {
	-- Dark trails quest tile
	-- data\scripts\movements\quests\dark_trails\necrometer_tile_access.lua
	[25001] = {
		itemId = false,
		itemPos = {
			{x = 33418, y = 32108, z = 10},
			{x = 33419, y = 32108, z = 10}
		}
	},
	-- First dragon quest tile
	-- data\scripts\movements\quests\first_dragon\zorvorax_secrets.lua
	[25002] = {
		itemId = false,
		itemPos = {
			{x = 33135, y = 32652, z = 7},
			{x = 33128, y = 32654, z = 7}
		}
	},
	[25003] = {
		itemId = false,
		itemPos = {
			{x = 32348, y = 31691, z = 7},
			{x = 32343, y = 31694, z = 7}
		}
	},
	[25004] = {
		itemId = false,
		itemPos = {
			{x = 32696, y = 31720, z = 7},
			{x = 32697, y = 31720, z = 7},
			{x = 32698, y = 31720, z = 7}
		}
	},
	--Dawnport
	--Sorcerer vocation tile
	--Vocation trial: data\scripts\movements\others\dawnport_vocation_trial.lua
	[25005] = {
		itemId = 413,
		itemPos = {
			{x = 32055, y = 31889, z = 5},
			{x = 32055, y = 31890, z = 5},
			{x = 32055, y = 31891, z = 5},
			{x = 32055, y = 31892, z = 5}
		}
	},
	--Druid vocation tile
	[25006] = {
		itemId = 413,
		itemPos = {
			{x = 32063, y = 31901, z = 5},
			{x = 32064, y = 31901, z = 5},
			{x = 32065, y = 31901, z = 5},
			{x = 32066, y = 31901, z = 5}
		}
	},
	--Paladin vocation tile
	[25007] = {
		itemId = 413,
		itemPos = {
			{x = 32075, y = 31889, z = 5},
			{x = 32075, y = 31890, z = 5},
			{x = 32075, y = 31891, z = 5},
			{x = 32075, y = 31892, z = 5},
		}
	},
	--Knight vocation tile
	[25008] = {
		itemId = 413,
		itemPos = {
			{x = 32063, y = 31880, z = 5},
			{x = 32064, y = 31880, z = 5},
			{x = 32065, y = 31880, z = 5},
			{x = 32066, y = 31880, z = 5}
		}
	},
	-- Tiles data\scripts\movements\others\dawnport_tiles.lua
	--Stairs decided vocation back
	[25009] = {
		itemId = 1385,
		itemPos = {
			{x = 32063, y = 31889, z = 6},
			{x = 32064, y = 31889, z = 6},
			{x = 32065, y = 31889, z = 6},
			{x = 32066, y = 31889, z = 6}
		}
	},
	--Sorcerer door tile
	[25010] = {
		itemId = 406,
		itemPos = {
			{x = 32053, y = 31884, z = 6},
			{x = 32054, y = 31884, z = 6},
			{x = 32055, y = 31884, z = 6}
		}
	},
	--Druid door tile
	[25011] = {
		itemId = 406,
		itemPos = {
			{x = 32072, y = 31884, z = 6},
			{x = 32073, y = 31884, z = 6},
			{x = 32074, y = 31884, z = 6}
		}
	},
	--Paladin door tile
	[25012] = {
		itemId = 406,
		itemPos = {
			{x = 32058, y = 31884, z = 6},
			{x = 32059, y = 31884, z = 6},
			{x = 32060, y = 31884, z = 6}
		}
	},
	--Knight door tile
	[25013] = {
		itemId = 406,
		itemPos = {
			{x = 32067, y = 31884, z = 6},
			{x = 32068, y = 31884, z = 6},
			{x = 32069, y = 31884, z = 6}
		}
	},
	--Sorcerer chest tile
	[25014] = {
		itemId = 406,
		itemPos = {{x = 32054, y = 31880, z = 6}}
	},
	--Druid chest tile
	[25015] = {
		itemId = 406,
		itemPos = {{x = 32073, y = 31880, z = 6}}
	},
	--Paladin chest tile
	[25016] = {
		itemId = 406,
		itemPos = {{x = 32059, y = 31880, z = 6}}
	},
	--Knight chest tile
	[25017] = {
		itemId = 406,
		itemPos = {{x = 32068, y = 31880, z = 6}}
	},
	-- The cursed crystal medusa message
	[25018] = {
		itemId = 104,
		itemPos = {
			{x = 32017, y = 32917, z = 10},
			{x = 32017, y = 32918, z = 10}
		}
	},
	-- The queen of the banshees quest
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(1)-first_seal_teleport_back.lua
	[25019] = {
		itemId = 9023,
		itemPos = {
			{x = 32265, y = 31898, z = 12},
			{x = 32266, y = 31898, z = 12},
			{x = 32267, y = 31898, z = 12}
		}
	},
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(5)-fifth_seal_path.lua
	[25020] = {
		itemId = 426,
		itemPos = {
			{x = 32187, y = 31937, z = 14},
			{x = 32188, y = 31937, z = 14},
			{x = 32188, y = 31938, z = 14},
			{x = 32189, y = 31938, z = 14},
			{x = 32189, y = 31939, z = 14},
			{x = 32189, y = 31940, z = 14},
			{x = 32190, y = 31940, z = 14},
			{x = 32191, y = 31939, z = 14},
			{x = 32191, y = 31938, z = 14}
		}
	},
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(5)-fifth_seal_path.lua
	[25021] = {
		itemId = 426,
		itemPos = {
			{x = 32187, y = 31936, z = 14},
			{x = 32188, y = 31936, z = 14},
			{x = 32189, y = 31936, z = 14},
			{x = 32190, y = 31936, z = 14},
			{x = 32191, y = 31936, z = 14},
			{x = 32189, y = 31937, z = 14},
			{x = 32190, y = 31937, z = 14},
			{x = 32191, y = 31937, z = 14},
			{x = 32187, y = 31938, z = 14},
			{x = 32190, y = 31938, z = 14},
			{x = 32187, y = 31939, z = 14},
			{x = 32188, y = 31939, z = 14},
			{x = 32190, y = 31939, z = 14},
			{x = 32187, y = 31940, z = 14},
			{x = 32188, y = 31940, z = 14},
			{x = 32189, y = 31940, z = 14},
			{x = 32191, y = 31940, z = 14}
		}
	},
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(4)-fourth_seal_sacrifice.lua
	[25022] = {
		itemId = 425,
		itemPos = {{x = 32243, y = 31892, z = 14}}
	},
	-- Path: data\scripts\movements\quests\the_queen_of_the_banshees\movement(3)-third_seal_warlock_tile.lua
	[25023] = {
		itemId = 426,
		itemPos = {
			{x = 32215, y = 31838, z = 15},
			{x = 32216, y = 31838, z = 15}
		}
	},
	-- Others actions
	-- Threatened Dreams Quest
	[50301] = {
		itemId = false,
		itemPos = {
			{x = 33200, y = 31892, z = 7},
			{x = 33201, y = 31892, z = 7},
			{x = 33201, y = 31893, z = 7},
			{x = 33201, y = 31894, z = 7}
		}
	},
	[50302] = {
		itemId = false,
		itemPos = {
			{x = 33258, y = 32402, z = 7},
			{x = 33257, y = 32402, z = 7},
			{x = 33257, y = 32401, z = 7},
			{x = 33259, y = 32402, z = 7}
		}
	},
	[50303] = {
		itemId = false,
		itemPos = {
			{x = 33262, y = 32378, z = 7},
			{x = 33262, y = 32377, z = 7},
			{x = 33263, y = 32377, z = 7},
			{x = 33264, y = 32377, z = 7},
			{x = 33262, y = 32379, z = 7},
			{x = 33263, y = 32379, z = 7},
			{x = 33264, y = 32379, z = 7}
		}
	},
	[50304] = {
		itemId = false,
		itemPos = {
			{x = 33257, y = 32315, z = 7},
			{x = 33257, y = 32314, z = 7},
			{x = 33259, y = 32314, z = 7},
			{x = 33259, y = 32315, z = 7}
		}
	},
	[50306] = {
		itemId = false,
		itemPos = {
			{x = 33249, y = 32267, z = 6},
			{x = 33249, y = 32268, z = 6},
			{x = 33250, y = 32268, z = 6}
		}
	},

	-- Kilmaresh
	-- First mission
	-- 
	[50307] = {
		itemId = false,
		itemPos = {
			{ x = 33956, y = 31503, z = 2 },
			{ x = 33957, y = 31503, z = 2 }
		}
	}
}

TileUnique = {
	-- Lions rock tiles
	-- data\scripts\movements\quests\lions_rock\lionsrock.lua
	-- snake sign
	[25001] = {
		itemId = 3152,
		itemPos = {x = 33095, y = 32244, z = 9}
	},
	-- lizard sign
	[25002] = {
		itemId = 3152,
		itemPos = {x = 33128, y = 32300, z = 9}
	},
	-- scorpion sign
	[25003] = {
		itemId = 3152,
		itemPos = {x = 33109, y = 32329, z = 9}
	},
	-- hyena sign
	[25004] = {
		itemId = 3152,
		itemPos = {x = 33127, y = 32340, z = 9}
	},
	-- Lions rock quest (gems tile) scripts/actions/other/gems
	[25006] = {
		itemId = 23812,
		itemPos = {x = 33069, y = 32298, z = 9}
	},
	[25007] = {
		itemId = 23813,
		itemPos = {x = 33069, y = 32302, z = 9}
	},
	[25008] = {
		itemId = 23811,
		itemPos = {x = 33077, y = 32302, z = 9}
	},
	[25009] = {
		itemId = 23808,
		itemPos = {x = 33077, y = 32298, z = 9}
	},
	[25010] = {
		itemId = 426,
		itemPos = {x = 32225, y = 32268, z = 9}
	},

	-- Remove/create item on stepIn
	-- Reserved uniques range from 29001/30000

	-- Ornamented shield quest
	[29001] = {
		itemId = 9023,
		itemPos = {x = 32770, y = 32282, z = 10},
		targetPos = {x = 32771, y = 32297, z = 10},
		targetItem = 387
	},
	-- Draconia quest
	[29002] = {
		itemId = 426,
		itemPos = {x = 32810, y = 31595, z = 5},
		targetPos = {x = 32796, y = 31594, z = 5},
		targetItem = 1025
	},
	[29003] = {
		itemId = 426,
		itemPos = {x = 32794, y = 31595, z = 5},
		targetPos = {x = 32796, y = 31576, z = 5},
		targetItem = 1025
	}
}

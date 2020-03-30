--[[
IMPORTANT, READ
This script is the registration table for action, unique and script variables, note that it is used to create action and unique in game by Lua. The script responsible for this load is found in the folder data/scripts/globalevents/load_attributes.lua 

For example:
{actionId = 101, itemId = 355, itemPos = Position (32774, 32289, 10)},

]]

ActionTable = {
--[[
Action IDS
It is advisable to use actionID only if you need to create a function that is called multiple times in different locations.
The action is also used as storage, x storage is added in the player and the same action number gives access to a door, for example.

Reserved player action storage key ranges (const.h at the source)
[10000000 - 20000000]
[1000 - 1500]
[2001 - 2011]

Others reserved player action storages
[100 = it is locked door]
[1000 = level door. Here 1 must be used followed by the level. Example: 1010 = level 10, 1100 = level 100] 
]]
	{actionId = 24890, itemId = 4552, itemPos = Position(33135, 32652, 7), storage = Storage.FirstDragon.DesertTile, msg = "You enter the beautiful oasis. By visiting this sacred site you're infused with the power of water bringing life to the desert."},
	{actionId = 24890, itemId = 9043, itemPos = Position(33128, 32654, 7), storage = Storage.FirstDragon.DesertTile, msg = "You enter the beautiful oasis. By visiting this sacred site you're infused with the power of water bringing life to the desert."},
	{actionId = 24891, itemId = 2740, itemPos = Position(32348, 31691, 7), storage = Storage.FirstDragon.StoneSculptureTile, msg = "You enter the circle of trees and flowers. By visiting this sacred site you're infused with the power of nature and plants."},
	{actionId = 24891, itemId = 2742, itemPos = Position(32343, 31694, 7), storage = Storage.FirstDragon.StoneSculptureTile, msg = "You enter the circle of trees and flowers. By visiting this sacred site you're infused with the power of nature and plants."},
	{actionId = 24892, itemId = 9048, itemPos = Position(32696, 31720, 7), storage = Storage.FirstDragon.SuntowerTile, msg = "You entered the suntower of Ab'dendriel. By visiting this sacred site you're infused with the power of the life-giving sun."},
	{actionId = 24892, itemId = 9043, itemPos = Position(32697, 31720, 7), storage = Storage.FirstDragon.SuntowerTile, msg = "You entered the suntower of Ab'dendriel. By visiting this sacred site you're infused with the power of the life-giving sun."},
	{actionId = 24892, itemId = 9043, itemPos = Position(32698, 31720, 7), storage = Storage.FirstDragon.SuntowerTile, msg = "You entered the suntower of Ab'dendriel. By visiting this sacred site you're infused with the power of the life-giving sun."},
	
}

UniqueTable = {
--[[ 
Unique IDS
As the name implies, it should be used in unique functions, where they should only be repeated once per action. It is advisable to use the uniques, because when repeated their use, the log of the repetition is returned in distro. It also does not risk conflicting with storages and other types of actions.

]]

	-- The first dragon Quest Start
	-- Treasure Chests Start
	[24851] = {itemId = 27545, itemPos = Position(32809, 32546, 6), name = 'giant shimmering pearl', count = 1},
	[24852] = {itemId = 27545, itemPos = Position(32765, 31019, 9), name = 'gold nugget', count = 2},
	[24853] = {itemId = 27545, itemPos = Position(32046, 32894, 10), name = 'blue crystal shard', count = 1},
	[24854] = {itemId = 27543, itemPos = Position(32808, 31580, 3), name = 'violet crystal shard', count = 1},
	[24855] = {itemId = 27543, itemPos = Position(33260, 32228, 10), name = 'green crystal splinter', count = 2},
	[24856] = {itemId = 27543, itemPos = Position(33016, 32614, 6), name = 'red gem', count = 1},
	[24857] = {itemId = 27543, itemPos = Position(33054, 32393, 10), name = 'onyx chip', count = 3},
	[24858] = {itemId = 27543, itemPos = Position(32208, 31849, 10), name = 'platinum coin', count = 3},
	[24859] = {itemId = 27543, itemPos = Position(32024, 32602, 10), name = 'red crystal fragment', count = 2},
	[24860] = {itemId = 27543, itemPos = Position(33224, 31647, 7), name = 'yellow gem', count = 1},
	[24861] = {itemId = 27543, itemPos = Position(32701, 31458, 5), name = 'talon', count = 3},
	[24862] = {itemId = 27543, itemPos = Position(32647, 32091, 8), name = 'white pearl', count = 2},
	[24863] = {itemId = 27545, itemPos = Position(32577, 31896, 7), name = 'gold ingot', count = 1},
	[24864] = {itemId = 27543, itemPos = Position(33676, 31753, 6), name = 'opal', count = 3},
	[24865] = {itemId = 27545, itemPos = Position(32242, 31390, 5), name = 'small diamond', count = 2},
	[24866] = {itemId = 27543, itemPos = Position(33613, 31811, 9), name = 'green crystal shard', count = 1},
	[24867] = {itemId = 27543, itemPos = Position(32873, 32900, 9), name = 'black pearl', count = 3},
	[24868] = {itemId = 27543, itemPos = Position(32171, 32974, 7), name = 'emerald bangle', count = 1},
	[24869] = {itemId = 27545, itemPos = Position(32960, 31461, 3), name = 'green gem', count = 1},
	[24870] = {itemId = 27543, itemPos = Position(33340, 31411, 7), name = 'giant shimmering pearl', count = 1},
	-- Treasure Chests End
	-- Final Reward Start
	[24871] = {itemId = 1746, itemPos = Position(33616, 31015, 13), name = 'porcelain mask', count = 1},
	[24872] = {itemId = 27531, itemPos = Position(33617, 31015, 13), name = 'backpack', count = 1},
	[24873] = {itemId = 1746, itemPos = Position(33618, 31015, 13), name = 'colourful feathers', count = 3},
	-- Final Reward End
	[24874] = {itemId = 9825, itemPos = Position(33583, 30992, 14)}, -- The First Dragon lever.
	[24882] = {itemId = 9565, itemPos = Position(33234, 32276, 12), storage = Storage.FirstDragon.DragonCounter, value = 200, range = 10, timer = Storage.FirstDragon.TazhadurTimer, newPos = Position(32015, 32466, 8), bossName = 'Tazhadur', bossPos = Position(32018, 32465, 8)}, -- Tazhadur entrance.
	[24883] = {itemId = 9562, itemPos = Position(33160, 31320, 5), storage = Storage.FirstDragon.ChestCounter, value = 5, range = 10, timer = Storage.FirstDragon.KalyassaTimer, newPos = Position(32078, 32456, 8), bossName = 'Kalyassa', bossPos = Position(32079, 32459, 8)}, -- Kalyassa entrance.
	[24884] = {itemId = 9564, itemPos = Position(33003, 31593, 11), storage = Storage.FirstDragon.SecretsCounter, value = 3, range = 10, timer = Storage.FirstDragon.ZorvoraxTimer, newPos = Position(32008, 32396, 8), bossName = 'Zorvorax', bossPos = Position(32015, 32396, 8)}, -- Zorvorax entrance.
	[24885] = {itemId = 9563, itemPos = Position(32276, 31367, 4), storage = Storage.FirstDragon.GelidrazahAccess, value = 1, range = 10, timer = Storage.FirstDragon.GelidrazahTimer, newPos = Position(32076, 32402, 8), bossName = 'Gelidrazah The Frozen', bossPos = Position(32078, 32400, 8)}, -- Gelidrazah entrance.
	[24886] = {itemId = 9565, itemPos = Position(32013, 32467, 8), backPos = Position(33234, 32278, 12)}, -- Tazhadur exit.
	[24887] = {itemId = 9562, itemPos = Position(32076, 32457, 8), backPos = Position(33162, 31320, 5)}, -- Kalyassa exit.
	[24888] = {itemId = 9564, itemPos = Position(32006, 32395, 8), backPos = Position(33002, 31595, 11)}, -- Zorvorax exit.
	[24889] = {itemId = 9563, itemPos = Position(32077, 32404, 8), backPos = Position(32278, 31367, 4)}, -- Gelidrazah exit.
	[24893] = {itemId = 2743, itemPos = Position(33608, 31022, 14)}, --
	[24894] = {itemId = 1387, itemPos = Position(33597, 30996, 14), destination = Position(33583, 30990, 14)}, 
	[24895] = {itemId = 27828, itemPos = Position(33047, 32712, 3), destination = Position(31994, 32391, 9)},
	[24896] = {itemId = 27828, itemPos = Position(31994, 32390, 9), destination = Position(33047, 32713, 3)},
	-- The first dragon Quest End

}

--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest
	From range 6001 to 8000 is reserved for reward without a container (common)
	From range 10001 to 14000 is reserved for reward in a container
	From range 14001 to 15000 is reserved for others scripts (varied rewards)

	This file is separated into 4 categories:
	Reward keys
	Reward without container
	Reward with container
	Varied rewards

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards of the same type
]]

ChestAction = {
	-- Keys action
	[5000] = {
		itemId = false,
		itemPos = {x = xxxxx, y = yyyyy, z = zz}
	},
}

ChestUnique = {
	-- Keys quest
	-- data\scripts\actions\system\quest_reward_key.lua
	-- Deeper fibula quest key 3980
	[5000] = {
		-- For use of the map
		itemId = 385,
		itemPos = {x = 32219, y = 32401, z = 10},
		-- For use of the script
		keyAction = 3980,
		itemReward = 2091,
		storage = Storage.Quest.DeeperFibula.Key3980
	},
	-- Panpipe quest key 4055
	[5001] = {
		-- For use of the map
		itemId = 1290,
		itemPos = {x = 32652, y = 32107, z = 7},
		-- For use of the script
		keyAction = 4055,
		itemReward = 2088,
		storage = Storage.Quest.Panpipe.Key4055
	},
	-- Dawnport quest key 0010 chest
	[5002] = {
		-- For use of the map
		itemId = 1717,
		itemPos = {x = 32068, y = 31895, z = 3},
		-- For use of the script
		keyAction = 103,
		itemReward = 23763,
		storage = Storage.Quest.Dawnport.Key0010
	},
	-- Emperor's cookies quest key 3800
	[5003] = {
		-- For use of the map
		itemId = 1740,
		itemPos = {x = 32605, y = 31908, z = 3},
		-- For use of the script
		keyAction = 3800,
		itemReward = 2089,
		storage = Storage.Quest.EmperorsCookies.Key3800
	},
	-- Emperor's cookies quest key 3802
	[5004] = {
		-- For use of the map
		itemId = 1740,
		itemPos = {x = 32599, y = 31923, z = 6},
		-- For use of the script
		keyAction = 3802,
		itemReward = 2089,
		storage = Storage.Quest.EmperorsCookies.Key3802
	},

	-- Rewards without a container (commom reward), it is only received by the player, are the common rewards
	-- Just duplicate the table and configure correctly, the scripts already register the entire table automatically
	-- Path: data\scripts\actions\system\quest_reward_common.lua
	-- Halls of hope
	[6001] = {
		-- For use of the map
		itemId = 26408,
		itemPos = {x = 32349, y = 32194, z = 9},
		-- For use of the script
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward1
	},
	[6002] = {
		-- For use of the map
		itemId = 26408,
		itemPos = {x = 32382, y = 32368, z = 9},
		-- For use of the script
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward2
	},
	[6003] = {
		-- For use of the map
		itemId = 26408,
		itemPos = {x = 32287, y = 32119, z = 7},
		-- For use of the script
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward3
	},
	[6004] = {
		-- For use of the map
		itemId = 26409,
		itemPos = {x = 32389, y = 32001, z = 6},
		-- For use of the script
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward4
	},
	[6005] = {
		-- For use of the map
		itemId = 26408,
		itemPos = {x = 32449, y = 32109, z = 8},
		-- For use of the script
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward5
	},
	-- Dawnport
	-- Legion helmet quest (dawnport)
	[6006] = {
		-- For use of the map
		itemId = 3058,
		itemPos = {x = 32143, y = 31910, z = 8},
		-- For use of the script
		itemReward = {{2480, 1}},
		storage = Storage.Quest.SanctuaryOfTheLizardGod.LegionHelmet
	},
	-- Dawnport quest
	-- Torn log book
	[6007] = {
		-- For use of the map
		itemId = 1740,
		itemPos = {x = 32059, y = 31800, z = 10},
		-- For use of the script
		itemReward = {{23749, 1}},
		storage = Storage.Quest.Dawnport.TornLogBook
	},
	-- Deeper fibula quest
	-- Tower shield
	[6008] = {
		itemId = 2843,
		itemPos = {x = 32239, y = 32471, z = 10},
		itemReward = {{2528, 1}},
		storage = Storage.Quest.DeeperFibula.RewardTowerShield
	},
	-- Warrior helmet
	[6009] = {
		itemId = 2843,
		itemPos = {x = 32239, y = 32478, z = 10},
		itemReward = {{2475, 1}},
		storage = Storage.Quest.DeeperFibula.RewardWarriorHelmet
	},
	-- Dwarven ring
	[6010] = {
		itemId = 3058,
		itemPos = {x = 32233, y = 32491, z = 10},
		itemReward = {{2213, 1}},
		storage = Storage.Quest.DeeperFibula.RewardDwarvenRing
	},
	-- Elven aulet
	[6011] = {
		itemId = 2844,
		itemPos = {x = 32245, y = 32492, z = 10},
		itemReward = {{2198, 1}},
		storage = Storage.Quest.DeeperFibula.RewardElvenAmulet
	},
	-- Knight axe
	[6012] = {
		itemId = 3058,
		itemPos = {x = 32256, y = 32500, z = 10},
		itemReward = {{2430, 1}},
		storage = Storage.Quest.DeeperFibula.RewardKnightAxe
	},
	-- Short sword quest
	-- Book
	[6013] = {
		itemId = 1740,
		itemPos = {x = 32171, y = 32197, z = 7},
		itemReward = {{1955, 1}},
		storage = Storage.Quest.ShortSword.Book
	},
	-- Thais lighthouse quest
	-- Battle hammer
	[6014] = {
		itemId = 1740,
		itemPos = {x = 32225, y = 32265, z = 10},
		itemReward = {{2417, 1}},
		storage = Storage.Quest.ThaisLighthouse.BattleHammer
	},
	-- Dark shield
	[6015] = {
		itemId = 1740,
		itemPos = {x = 32226, y = 32265, z = 10},
		itemReward = {{2521, 1}},
		storage = Storage.Quest.ThaisLighthouse.DarkShield
	},
	-- Studded shield quest (rookgaard)
	-- Banana free account area
	[6016] = {
		itemId = 2725,
		itemPos = {x = 32172, y = 32169, z = 7},
		itemReward = {{2676, 1}},
		storage = Storage.Quest.StuddedShield.BananaFree
	},
	-- Banana premium account area
	[6017] = {
		itemId = 2725,
		itemPos = {x = 31983, y = 32193, z = 5},
		itemReward = {{2676, 1}},
		storage = Storage.Quest.StuddedShield.BananaPremium
	},
	-- Rope (kazordoon, emperor's cookies quest)
	[6018] = {
		itemId = 1740,
		itemPos = {x = 32604, y = 31908, z = 3},
		itemReward = {{2120, 1}},
		storage = Storage.Quest.EmperorsCookies.RopeReward
	},
	-- Explorer brooch quest (kazordoon)
	[6019] = {
		itemId = 3058,
		itemPos = {x = 32636, y = 31873, z = 10},
		itemReward = {{4873, 1}},
		storage = Storage.Quest.ExplorerBrooch.Reward
	},
	-- Orc fortress quest
	-- Knight axe
	[6020] = {
		itemId = 1738,
		itemPos = {x = 32980, y = 31727, z = 9},
		itemReward = {{2430, 1}},
		storage = Storage.Quest.OrcFortress.KnightAxe
	},
	-- Knight armor
	[6021] = {
		itemId = 1738,
		itemPos = {x = 32981, y = 31727, z = 9},
		itemReward = {{2476, 1}},
		storage = Storage.Quest.OrcFortress.KnightArmor
	},
	-- Fire sword
	[6022] = {
		itemId = 1738,
		itemPos = {x = 32985, y = 31727, z = 9},
		itemReward = {{2392, 1}},
		storage = Storage.Quest.OrcFortress.FireSword
	},
	-- Draconia quest
	[6023] = {
		itemId = 1740,
		itemPos = {x = 32803, y = 31582, z = 2},
		itemReward = {{2396, 1}, {2409, 1}},
		storage = Storage.Quest.Draconia.Reward1
	},
	[6024] = {
		itemId = 1740,
		itemPos = {x = 32804, y = 31582, z = 2},
		itemReward = {{2197, 5}, {2167, 1}},
		storage = Storage.Quest.Draconia.Reward2
	},
	-- Adorned UH rune quest
	[6025] = {
		itemId = 1738,
		itemPos = {x = 33136, y = 31601, z = 15},
		itemReward = {{12559, 1}},
		storage = Storage.Quest.AdornedUHRune.Reward
	},
	-- Barbarian axe quest
	-- Barbarian axe
	[6026] = {
		itemId = 1738,
		itemPos = {x = 33184, y = 31945, z = 11},
		itemReward = {{2429, 1}},
		storage = Storage.Quest.BarbarianAxe.BarbarianAxe
	},
	-- Scimitar
	[6027] = {
		itemId = 1738,
		itemPos = {x = 33185, y = 31945, z = 11},
		itemReward = {{2419, 1}},
		storage = Storage.Quest.BarbarianAxe.Scimitar
	},
	-- Dark armor quest
	[6028] = {
		itemId = 3128,
		itemPos = {x = 33178, y = 31870, z = 12},
		itemReward = {{2489, 1}},
		storage = Storage.Quest.DarkArmor.Reward
	},

	-- Reward inside of container, there is also the option to put a key inside
	-- If the table has a variable for key, (keyItem and keyAction) then it is inside the bag
	-- Path: data\scripts\actions\system\quest_reward_container.lua

	-- Ornamented shield quest
	[10001] = {
		itemId = 2843,
		itemPos = {x = 32778, y = 32282, z = 11},
		itemBag = 1987,
		keyItem = 2090,
		keyAction = 3702,
		itemReward = {{2600, 1}, {2457, 1}, {2524, 1}, {1955, 1}, {2383, 1}, {2201, 1}, {2164, 1}},
		weight = 194,
		storage = Storage.Quest.OrnamentedShield.Bag
	},
	[10002] = {
		itemId = 1747,
		itemPos = {x = 32769, y = 32302, z = 10},
		itemBag = 1993,
		itemReward = {{2071, 1}, {2175, 1}, {2199, 1}, {2152, 5} , {2169, 1}},
		weight = 44,
		storage = Storage.Quest.OrnamentedShield.RedBag
	},
	[10003] = {
		itemId = 1740,
		itemPos = {x = 32648, y = 31905, z = 3},
		itemBag = 1987,
		keyItem = 2089,
		keyAction = 3801,
		itemReward = {{2687, 20}, {2687, 7}},
		weight = 44,
		storage = Storage.Quest.EmperorsCookies.Key3801
	},
	[10004] = {
		itemId = 1740,
		itemPos = {x = 32644, y = 32131, z = 8},
		itemBag = 1987,
		itemReward = {{2150, 2}, {2166, 1}, {2074, 1}},
		weight = 44,
		storage = Storage.Quest.Panpipe.Reward
	},
	[10005] = {
		itemId = 1738,
		itemPos = {x = 33199, y = 31923, z = 11},
		itemBag = 1987,
		itemReward = {{2148, 98}, {2148, 77}, {2143, 3}},
		weight = 27,
		storage = Storage.Quest.BerserkerTreasure.Reward
	},

	-- Reward of others scrips files (varied rewards)
	-- The First dragon Quest
	-- Treasure chests (data\scripts\actions\quests\first_dragon\treasure_chests.lua)
	[14001] = {
		itemId = 27545,
		itemPos = {x = 32809, y = 32546, z = 6}
	},
	[14002] = {
		itemId = 27545,
		itemPos = {x = 32765, y = 31019, z = 9}
	},
	[14003] = {
		itemId = 27545,
		itemPos = {x = 32046, y = 32894, z = 10}
	},
	[14004] = {
		itemId = 27543,
		itemPos = {x = 32808, y = 31580, z = 3}
	},
	[14005] = {
		itemId = 27543,
		itemPos = {x = 33260, y = 32228, z = 10}
	},
	[14006] = {
		itemId = 27543,
		itemPos = {x = 33016, y = 32614, z = 6}
	},
	[14007] = {
		itemId = 27543,
		itemPos = {x = 33054, y = 32393, z = 10}
	},
	[14008] = {
		itemId = 27543,
		itemPos = {x = 32208, y = 31849, z = 10}
	},
	[14009] = {
		itemId = 27543,
		itemPos = {x = 32024, y = 32602, z = 10}
	},
	[14010] = {
		itemId = 27543,
		itemPos = {x = 33224, y = 31647, z = 7}
	},
	[14011] = {
		itemId = 27543,
		itemPos = {x = 32701, y = 31458, z = 5}
	},
	[14012] = {
		itemId = 27543,
		itemPos = {x = 32647, y = 32091, z = 8}
	},
	[14013] = {
		itemId = 27545,
		itemPos = {x = 32577, y = 31896, z = 7}
	},
	[14014] = {
		itemId = 27543,
		itemPos = {x = 33676, y = 31753, z = 6}
	},
	[14015] = {
		itemId = 27545,
		itemPos = {x = 32242, y = 31390, z = 5}
	},
	[14016] = {
		itemId = 27543,
		itemPos = {x = 33613, y = 31811, z = 9}
	},
	[14017] = {
		itemId = 27543,
		itemPos = {x = 32873, y = 32900, z = 9}
	},
	[14018] = {
		itemId = 27543,
		itemPos = {x = 32171, y = 32974, z = 7}
	},
	[14019] = {
		itemId = 27545,
		itemPos = {x = 32960, y = 31461, z = 3}
	},
	[14020] = {
		itemId = 27543,
		itemPos = {x = 33340, y = 31411, z = 7}
	},
	-- Final reward (data\scripts\actions\quests\first_dragon\rewards.lua)
	[14021] = {
		itemId = 1746,
		itemPos = {x = 33616, y = 31015, z = 13}
	},
	[14022] = {
		itemId = 27531,
		itemPos = {x = 33617, y = 31015, z = 13}
	},
	[14023] = {
		itemId = 1746,
		itemPos = {x = 33618, y = 31015, z = 13}
	},
	-- The shattered isles
	[14024] = {
		itemId = 5677,
		itemPos = {x = 31938, y = 32837, z = 7}
	},
	-- Dawnport vocation rewards
	-- Path: data\scripts\actions\quests\dawnport\vocation_reward.lua
	-- Sorcerer
	[14025] = {
		itemId = 1740,
		itemPos = {x = 32054, y = 31882, z = 6}
	},
	-- Druid
	[14026] = {
		itemId = 1740,
		itemPos = {x = 32073, y = 31882, z = 6}
	},
	-- Paladin
	[14027] = {
		itemId = 1740,
		itemPos = {x = 32059, y = 31882, z = 6}
	},
	-- Knight
	[14028] = {
		itemId = 1740,
		itemPos = {x = 32068, y = 31882, z = 6}
	}
}

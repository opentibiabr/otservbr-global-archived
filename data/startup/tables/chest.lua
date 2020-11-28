--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest
	From range 6001 to 14000 is reserved for script reward
	Path: data\scripts\actions\system\quest_reward_common.lua

	From range 14001 to 15000 is reserved for others scripts (varied rewards)

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Example:
	[xxxx] = {
		-- For use of the map
		itemId = xxxx,
		itemPos = {x = xxxxx, y = xxxxx, z = x},
		-- For use of the script
		container = xxxx (it's for use reward in a container, only put the id of the container here)
		action = xxxx, (it's for use one key in the chest, only put the key in itemReward and action here)
		itemReward = {{xxxx, x}},
		storage = xxxxx
	},

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards
]]

ChestAction = {
	-- Keys quest
	[5000] = {
		itemId = xxxx,
		itemPos = {
			{x = xxxxx, y = xxxxx, z = x},
			{x = xxxxx, y = xxxxx, z = x}
		},
		action = xxxx,
		itemReward = {{xxxx, 1}},
		storage = storage
	}
}

ChestUnique = {
	-- Keys quest
	-- data\scripts\actions\system\quest_reward_key.lua
	-- Deeper fibula quest key 3980
	[5000] = {
		itemId = 385,
		itemPos = {x = 32219, y = 32401, z = 10},
		action = 3980,
		itemReward = {{2091, 1}},
		storage = Storage.Quest.DeeperFibula.Key3980
	},
	-- Panpipe quest key 4055
	[5001] = {
		itemId = 1290,
		itemPos = {x = 32652, y = 32107, z = 7},
		action = 4055,
		itemReward = {{2088, 1}},
		storage = Storage.Quest.Panpipe.Key4055
	},
	-- Dawnport quest key 0010 chest
	[5002] = {
		itemId = 1717,
		itemPos = {x = 32068, y = 31895, z = 3},
		action = 103,
		itemReward = {{23763, 1}},
		storage = Storage.Quest.Dawnport.Key0010
	},
	-- Emperor's cookies quest key 3800
	[5003] = {
		itemId = 1740,
		itemPos = {x = 32605, y = 31908, z = 3},
		action = 3800,
		itemReward = {{2089, 1}},
		storage = Storage.Quest.EmperorsCookies.Key3800
	},
	-- Emperor's cookies quest key 3802
	[5004] = {
		itemId = 1740,
		itemPos = {x = 32599, y = 31923, z = 6},
		action = 3802,
		itemReward = {{2089, 1}},
		storage = Storage.Quest.EmperorsCookies.Key3802
	},
	-- Black knight quest key 5010
	[5005] = {
		itemId = 2720,
		itemPos = {x = 32800, y = 31959, z = 7},
		action = 5010,
		itemReward = {{2088, 1}},
		storage = Storage.Quest.BlackKnight.Key5010
	},
	[5006] = {
		itemId = 2720,
		itemPos = {x = 32813, y = 31964, z = 7},
		action = 5010,
		itemReward = {{2088, 1}},
		storage = Storage.Quest.BlackKnight.Key5010
	},

	-- To add a reward inside a bag, you need to add the variable "container = bagId" before "itemReward"
	-- Just duplicate the table and configure correctly, the scripts already register the entire table automatically
	-- Path: data\scripts\actions\system\quest_reward_common.lua
	-- Halls of hope
	[6001] = {
		itemId = 26408,
		itemPos = {x = 32349, y = 32194, z = 9},
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward1
	},
	[6002] = {
		itemId = 26408,
		itemPos = {x = 32382, y = 32368, z = 9},
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward2
	},
	[6003] = {
		itemId = 26408,
		itemPos = {x = 32287, y = 32119, z = 7},
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward3
	},
	[6004] = {
		itemId = 26409,
		itemPos = {x = 32389, y = 32001, z = 6},
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward4
	},
	[6005] = {
		itemId = 26408,
		itemPos = {x = 32449, y = 32109, z = 8},
		itemReward = {{26654, 1}},
		storage = Storage.HallsOfHope.Reward5
	},
	-- Dawnport
	-- Legion helmet quest (dawnport)
	[6006] = {
		itemId = 3058,
		itemPos = {x = 32143, y = 31910, z = 8},
		itemReward = {{2480, 1}},
		storage = Storage.Quest.SanctuaryOfTheLizardGod.LegionHelmet
	},
	-- Dawnport quest
	-- Torn log book
	[6007] = {
		itemId = 1740,
		itemPos = {x = 32059, y = 31800, z = 10},
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
	-- Demon helmet quest
	-- Steel boots
	[6029] = {
		itemId = 1740,
		itemPos = {x = 33313, y = 31574, z = 15},
		itemReward = {{2645, 1}},
		storage = Storage.Quest.DemonHelmet.SteelBoots
	},
	-- Demon helmet
	[6030] = {
		itemId = 1740,
		itemPos = {x = 33313, y = 31575, z = 15},
		itemReward = {{2493, 1}},
		storage = Storage.Quest.DemonHelmet.DemonHelmet
	},
	-- Demon shield
	[6031] = {
		itemId = 1740,
		itemPos = {x = 33313, y = 31576, z = 15},
		itemReward = {{2520, 1}},
		storage = Storage.Quest.DemonHelmet.DemonShield
	},
	-- Double hero quest
	-- Red gem
	[6032] = {
		itemId = 1738,
		itemPos = {x = 33109, y = 31679, z = 13},
		itemReward = {{2156, 1}},
		storage = Storage.Quest.DoubleHero.RedGem
	},
	-- Club ring
	[6033] = {
		itemId = 1738,
		itemPos = {x = 33110, y = 31679, z = 13},
		itemReward = {{2209, 1}},
		storage = Storage.Quest.DoubleHero.ClubRing
	},
	-- Edron goblin quest
	-- Silver amulet
	[6034] = {
		itemId = 1738,
		itemPos = {x = 33095, y = 31800, z = 10},
		itemReward = {{2170, 200}},
		storage = Storage.Quest.EdronGoblin.SilverAmulet
	},
	-- Steel shield
	[6035] = {
		itemId = 1738,
		itemPos = {x = 33095, y = 31801, z = 10},
		itemReward = {{2509, 1}},
		storage = Storage.Quest.EdronGoblin.SteelShield
	},
	-- Fire axe quest
	-- Fire axe
	[6036] = {
		itemId = 2843,
		itemPos = {x = 33084, y = 31650, z = 12},
		itemReward = {{2432, 1}},
		storage = Storage.Quest.FireAxe.FireAxe
	},
	-- Ring quest
	-- Time ring
	[6037] = {
		itemId = 1738,
		itemPos = {x = 33131, y = 31624, z = 15},
		itemReward = {{2169, 1}},
		storage = Storage.Quest.Ring.TimeRing
	},
	-- Sword ring
	[6038] = {
		itemId = 1738,
		itemPos = {x = 33134, y = 31624, z = 15},
		itemReward = {{2207, 1}},
		storage = Storage.Quest.Ring.SwordRing
	},
	-- Troll cave quest
	-- Garlic necklace
	[6039] = {
		itemId = 1741,
		itemPos = {x = 33143, y = 31719, z = 10},
		itemReward = {{2199, 150}},
		storage = Storage.Quest.TrollCave.GarlicNecklace
	},
	-- Brass legs
	[6040] = {
		itemId = 1741,
		itemPos = {x = 33143, y = 31721, z = 10},
		itemReward = {{2478, 1}},
		storage = Storage.Quest.TrollCave.BrassLegs
	},
	-- Vampire shield quest
	-- Dragon lance
	[6041] = {
		itemId = 1738,
		itemPos = {x = 33189, y = 31688, z = 14},
		itemReward = {{2414, 1}},
		storage = Storage.Quest.VampireShield.DragonLance
	},
	-- Dragon lance
	[6042] = {
		itemId = 1738,
		itemPos = {x = 33195, y = 31688, z = 14},
		itemReward = {{2534, 1}},
		storage = Storage.Quest.VampireShield.VampireShield
	},
	-- Weeding ring quest
	-- Dragon necklace
	[6043] = {
		itemId = 1738,
		itemPos = {x = 33158, y = 31621, z = 15},
		itemReward = {{2201, 200}},
		storage = Storage.Quest.WeddingRing.DragonNecklace
	},
	-- Weeding ring
	[6044] = {
		itemId = 1738,
		itemPos = {x = 33158, y = 31622, z = 15},
		itemReward = {{2121, 1}},
		storage = Storage.Quest.WeddingRing.WeedingRing
	},
	-- Alawars vault quest
	-- White pearl
	[6045] = {
		itemId = 1740,
		itemPos = {x = 32105, y = 31567, z = 9},
		itemReward = {{2143, 3}},
		storage = Storage.Quest.AlawarsVault.WhitePearl
	},
	-- Broadsword
	[6046] = {
		itemId = 1740,
		itemPos = {x = 32109, y = 31567, z = 9},
		itemReward = {{2413, 1}},
		storage = Storage.Quest.AlawarsVault.Broadsword
	},
	-- Black knight quest
	-- Crown armor
	[6047] = {
		itemId = 2720,
		itemPos = {x = 32868, y = 31955, z = 11},
		itemReward = {{2487, 1}},
		storage = Storage.Quest.BlackKnight.CrownArmor
	},
	-- Crown shield
	[6048] = {
		itemId = 2720,
		itemPos = {x = 32880, y = 31955, z = 11},
		itemReward = {{2519, 1}},
		storage = Storage.Quest.BlackKnight.CrownShield
	},
	-- TIme ring quest
	-- Crystal ball
	[6049] = {
		itemId = 1740,
		itemPos = {x = 33038, y = 32171, z = 9},
		itemReward = {{2192, 1}},
		storage = Storage.Quest.TimeRing.CrystalBall
	},
	-- Time ring
	[6050] = {
		itemId = 1740,
		itemPos = {x = 33039, y = 32171, z = 9},
		itemReward = {{2169, 1}},
		storage = Storage.Quest.TimeRing.TimeRing
	},
	-- Elven amulet
	[6051] = {
		itemId = 1740,
		itemPos = {x = 33040, y = 32171, z = 9},
		itemReward = {{2198, 1}},
		storage = Storage.Quest.TimeRing.ElvenAmulet
	},
	-- Behemoth quest
	-- Guardian halberd
	[6052] = {
		itemId = 1740,
		itemPos = {x = 33295, y = 31658, z = 13},
		itemReward = {{2427, 1}},
		storage = Storage.Quest.Behemoth.GuardianHalberd
	},
	-- Demon shield
	[6053] = {
		itemId = 1740,
		itemPos = {x = 33297, y = 31658, z = 13},
		itemReward = {{2520, 1}},
		storage = Storage.Quest.Behemoth.DemonShield
	},
	-- Golden armor
	[6054] = {
		itemId = 1740,
		itemPos = {x = 33298, y = 31658, z = 13},
		itemReward = {{2466, 1}},
		storage = Storage.Quest.Behemoth.GoldenArmor
	},
	-- Family brooch quest
	[6055] = {
		itemId = 1744,
		itemPos = {x = 32248, y = 31866, z = 8},
		itemReward = {{2318, 1}},
		storage = Storage.Quest.SimpleChest.FamilyBrooch
	},
	-- The queen of the banshees quest
	-- Stone skin amulet
	[6056] = {
		itemId = 1740,
		itemPos = {x = 32212, y = 31896, z = 15},
		itemReward = {{2197, 1}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.StoneSkinAmulet
	},
	-- Stone skin amulet
	[6057] = {
		itemId = 1740,
		itemPos = {x = 32226, y = 31896, z = 15},
		itemReward = {{2165, 1}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.StealthRing
	},
	-- Tower shield
	[6058] = {
		itemId = 1740,
		itemPos = {x = 32212, y = 31910, z = 15},
		itemReward = {{2528, 1}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.TowerShield
	},
	-- Giant sword
	[6059] = {
		itemId = 1740,
		itemPos = {x = 32226, y = 31910, z = 15},
		itemReward = {{2393, 1}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.GiantSword
	},
	-- Boots of haste
	[6060] = {
		itemId = 1740,
		itemPos = {x = 32218, y = 31912, z = 15},
		itemReward = {{2195, 1}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.BootsOfHaste
	},
	-- 100 platinum coins
	[6061] = {
		itemId = 1740,
		itemPos = {x = 32220, y = 31912, z = 15},
		itemReward = {{2152, 100}},
		storage = Storage.Quest.TheQueenOfTheBanshees.Reward.PlatinumCoin
	},
	-- Ornamented shield quest
	[6062] = {
		itemId = 2843,
		itemPos = {x = 32778, y = 32282, z = 11},
		container = 1987,
		action = 3702,
		itemReward = {{2090,1}, {2600, 1}, {2457, 1}, {2524, 1}, {1955, 1}, {2383, 1}, {2201, 1}, {2164, 1}},
		weight = 194,
		storage = Storage.Quest.OrnamentedShield.Bag
	},
	[6063] = {
		itemId = 1747,
		itemPos = {x = 32769, y = 32302, z = 10},
		container = 1993,
		itemReward = {{2071, 1}, {2175, 1}, {2199, 1}, {2152, 5} , {2169, 1}},
		weight = 44,
		storage = Storage.Quest.OrnamentedShield.RedBag
	},
	[6064] = {
		itemId = 1740,
		itemPos = {x = 32648, y = 31905, z = 3},
		container = 1987,
		action = 3801,
		itemReward = {{2089, 1}, {2687, 20}, {2687, 7}},
		weight = 44,
		storage = Storage.Quest.EmperorsCookies.Key3801
	},
	[6065] = {
		itemId = 1740,
		itemPos = {x = 32644, y = 32131, z = 8},
		container = 1987,
		itemReward = {{2150, 2}, {2166, 1}, {2074, 1}},
		weight = 44,
		storage = Storage.Quest.Panpipe.Reward
	},
	[6066] = {
		itemId = 1738,
		itemPos = {x = 33199, y = 31923, z = 11},
		container = 1987,
		itemReward = {{2148, 98}, {2148, 77}, {2143, 3}},
		weight = 27,
		storage = Storage.Quest.BerserkerTreasure.Reward
	},
	-- Fire axe quest
	-- Bag
	[6067] = {
		itemId = 1740,
		itemPos = {x = 33078, y = 31656, z = 11},
		container = 1987,
		itemReward = {{2214, 1}, {2201, 200}, {2145, 7}},
		weight = 27,
		storage = Storage.Quest.FireAxe.Bag
	},
	-- Poison daggers quest
	-- Backpack reward
	[6068] = {
		itemId = 1741,
		itemPos = {x = 33155, y = 31880, z = 11},
		container = 1988,
		itemReward = {{2545, 30}, {2411, 1}, {2411, 1}},
		weight = 60,
		storage = Storage.Quest.PoisonDaggers.BackpackReward
	},
	-- Shaman treasure quest
	-- Bag with 3 blank runes
	[6069] = {
		itemId = 2843,
		itemPos = {x = 33127, y = 31885, z = 9},
		container = 1987,
		itemReward = {{2260, 3}},
		weight = 15,
		storage = Storage.Quest.ShamanTreasure.Bag
	},
	-- Strong potions quest
	-- Green bag with 5 strong mana potions
	[6070] = {
		itemId = 1738,
		itemPos = {x = 33163, y = 31603, z = 15},
		container = 1991,
		itemReward = {{7589, 5}},
		weight = 23,
		storage = Storage.Quest.StrongPotions.Reward
	},
	-- Vampire shield quest
	-- Bag
	[6071] = {
		itemId = 1738,
		itemPos = {x = 33188, y = 31682, z = 14},
		container = 1987,
		itemReward = {{2174, 1}, {2144, 1}, {2194, 1}},
		weight = 16,
		storage = Storage.Quest.VampireShield.Bag
	},
	-- Key 4502 quest
	[6072] = {
		itemId = 1740,
		itemPos = {x = 32201, y = 31571, z = 10},
		container = 1987,
		action = 4502,
		itemReward = {{2089, 1}, {2148, 23}, {2260, 1}, {2410, 4}, {2490, 1}},
		weight = 80,
		storage = Storage.Quest.Key4502
	},
	-- Dragon tower quest
	-- Backpack 1
	[6073] = {
		itemId = 1738,
		itemPos = {x = 33072, y = 32169, z = 2},
		container = 1988,
		itemReward = {{7620, 1}, {7618, 1}, {2546, 30}, {2545, 60}},
		weight = 80,
		storage = Storage.Quest.DragonTower.Backpack1
	},
	-- Backpack 2
	[6074] = {
		itemId = 1738,
		itemPos = {x = 33078, y = 32169, z = 2},
		container = 1988,
		itemReward = {{2456, 1}, {2146, 2}},
		weight = 50,
		storage = Storage.Quest.DragonTower.Backpack2
	},
	-- Behemoth quest
	-- Bag
	[6075] = {
		itemId = 1740,
		itemPos = {x = 33294, y = 31658, z = 13},
		container = 1987,
		itemReward = {{2145, 3}, {2146, 4}, {2124, 1}, {2168, 1}, {2171, 1}},
		weight = 50,
		storage = Storage.Quest.Behemoth.Bag
	},
	-- Parchment room quest
	-- Bag
	[6076] = {
		itemId = 1742,
		itemPos = {x = 33063, y = 31624, z = 15},
		container = 1987,
		action = 6010,
		itemReward = {{2091, 1}, {2229, 1}, {2151, 2}, {2165, 1}, {2230, 1}},
		weight = 42,
		storage = Storage.Quest.ParchmentRoom.Bag
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
	},
	-- Others uniques
	-- Threatened Dreams Quest
	[34123] = {
		itemId = 13903,
		itemPos = {x = 32787, y = 31975, z = 11}
	}
}

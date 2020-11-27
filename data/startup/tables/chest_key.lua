--[[
	Look README.md for see the reserved action/unique numbers
	From range 5000 to 6000 is reserved for keys chest

	There is no need to tamper with the chests scripts, just register a new table and configure correctly
	So the quest will work in-game

	Example:
	[5000] = {
		itemId = xxxx,
		itemPos = {x = xxxxx, y = xxxxx, z = x},
		keyAction = xxxx,
		itemReward = xxxx,
		storage = xxxxx
	},

	Note:
	The "for use of the map" variables are only used to create the action or unique on the map during startup

	The "for use of the script" variables are used by the scripts
	To allow a single script to manage all rewards
]]

ChestKeyAction = {
	-- Keys quest
	-- data\scripts\actions\system\quest_reward_key.lua
	-- Black knight quest key 5010
	[5000] = {
		itemId = 2720,
		itemPos = {
			{x = 32800, y = 31959, z = 7},
			{x = 32813, y = 31964, z = 7}
		},
		keyAction = 5010,
		itemReward = 2088,
		storage = Storage.Quest.BlackKnight.Key5010
	}
}

ChestKeyUnique = {
	-- Keys quest
	-- data\scripts\actions\system\quest_reward_key.lua
	-- Deeper fibula quest key 3980
	[5000] = {
		itemId = 385,
		itemPos = {x = 32219, y = 32401, z = 10},
		keyAction = 3980,
		itemReward = 2091,
		storage = Storage.Quest.DeeperFibula.Key3980
	},
	-- Panpipe quest key 4055
	[5001] = {
		itemId = 1290,
		itemPos = {x = 32652, y = 32107, z = 7},
		keyAction = 4055,
		itemReward = 2088,
		storage = Storage.Quest.Panpipe.Key4055
	},
	-- Dawnport quest key 0010 chest
	[5002] = {
		itemId = 1717,
		itemPos = {x = 32068, y = 31895, z = 3},
		keyAction = 103,
		itemReward = 23763,
		storage = Storage.Quest.Dawnport.Key0010
	},
	-- Emperor's cookies quest key 3800
	[5003] = {
		itemId = 1740,
		itemPos = {x = 32605, y = 31908, z = 3},
		keyAction = 3800,
		itemReward = 2089,
		storage = Storage.Quest.EmperorsCookies.Key3800
	},
	-- Emperor's cookies quest key 3802
	[5004] = {
		itemId = 1740,
		itemPos = {x = 32599, y = 31923, z = 6},
		keyAction = 3802,
		itemReward = 2089,
		storage = Storage.Quest.EmperorsCookies.Key3802
	}
}

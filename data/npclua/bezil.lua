local internalNpcName = "Bezil"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 116,
	lookBody = 60,
	lookLegs = 76,
	lookFeet = 95
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "closed trap", clientId = 3481, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "fishing rod", clientId = 3483, sell = 40 },
	{ itemName = "machete", clientId = 3308, sell = 6 },
	{ itemName = "pick", clientId = 3456, sell = 15 },
	{ itemName = "rope", clientId = 3003, sell = 15 },
	{ itemName = "scythe", clientId = 3453, sell = 10 },
	{ itemName = "shovel", clientId = 3457, sell = 8 },
	{ itemName = "watch", clientId = 2906, sell = 6 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	-- Buyable items
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3, count = 0 },
	{ itemName = "bucket", clientId = 2873, buy = 4, count = 0 },
	{ itemName = "candelabrum", clientId = 2912, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "document", clientId = 2818, buy = 12 },
	{ itemName = "fishing rod", clientId = 3483, buy = 40 },
	{ itemName = "grey backpack", clientId = 2870, buy = 10 },
	{ itemName = "grey bag", clientId = 2862, buy = 4 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 6 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "parchment", clientId = 2817, buy = 8 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "scroll", clientId = 2815, buy = 5 },
	{ itemName = "scythe", clientId = 3453, buy = 50 },
	{ itemName = "shovel", clientId = 3457, buy = 10 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "vial of oil", clientId = 2874, buy = 20, count = 11 },
	{ itemName = "watch", clientId = 2906, buy = 20 },
	{ itemName = "waterskin of water", clientId = 2901, buy = 40, count = 1 },
	{ itemName = "worm", clientId = 3492, buy = 1 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)

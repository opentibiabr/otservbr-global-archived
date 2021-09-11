local internalNpcName = "Zuma Magehide"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 138,
	lookHead = 58,
	lookBody = 19,
	lookLegs = 0,
	lookFeet = 132,
	lookAddons = 3
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
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "axe ring", clientId = 3092, buy = 500 },
	{ itemName = "bronze amulet", clientId = 3056, buy = 100, count = 200 },
	{ itemName = "club ring", clientId = 3093, buy = 500 },
	{ itemName = "dragon necklace", clientId = 3085, buy = 1000, count = 200 },
	{ itemName = "dwarven ring", clientId = 3097, buy = 3000 },
	{ itemName = "elven amulet", clientId = 3082, buy = 500, count = 50 },
	{ itemName = "energy ring", clientId = 3051, buy = 5000 },
	{ itemName = "garlic necklace", clientId = 3083, buy = 100, count = 150 },
	{ itemName = "life ring", clientId = 3052, buy = 900 },
	{ itemName = "might ring", clientId = 3048, buy = 5000, count = 20 },
	{ itemName = "power ring", clientId = 3050, buy = 100 },
	{ itemName = "protection amulet", clientId = 3084, buy = 700, count = 250 },
	{ itemName = "ring of healing", clientId = 3098, buy = 2000 },
	{ itemName = "silver amulet", clientId = 3054, buy = 100, count = 200 },
	{ itemName = "stealth ring", clientId = 3049, buy = 5000 },
	{ itemName = "stone skin amulet", clientId = 3081, buy = 5000, count = 5 },
	{ itemName = "strange talisman", clientId = 3045, buy = 100, count = 200 },
	{ itemName = "sword ring", clientId = 3091, buy = 500 },
	{ itemName = "time ring", clientId = 3053, buy = 5000 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost), npc, player)
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, amount, name, totalCost, clientId)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)

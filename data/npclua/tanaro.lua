local internalNpcName = "Tanaro"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 144,
	lookHead = 113,
	lookBody = 0,
	lookLegs = 97,
	lookFeet = 115,
	lookAddons = 1
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
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "bottle of water", clientId = 2875, buy = 2, count = 1 },
	{ itemName = "bread", clientId = 3600, buy = 2 },
	{ itemName = "cake", clientId = 6277, buy = 50 },
	{ itemName = "cheese", clientId = 3607, buy = 4 },
	{ itemName = "cookie", clientId = 3598, buy = 2 },
	{ itemName = "egg", clientId = 3606, buy = 2 },
	{ itemName = "fish", clientId = 3578, buy = 5 },
	{ itemName = "green flask of wine", clientId = 2877, buy = 3, count = 15 },
	{ itemName = "ham", clientId = 3582, buy = 6 },
	{ itemName = "meat", clientId = 3577, buy = 3 },
	{ itemName = "roll", clientId = 3601, buy = 2 },
	{ itemName = "salmon", clientId = 3579, buy = 6 },
	{ itemName = "valentine's cake", clientId = 6392, buy = 100 },
	{ itemName = "white mushroom", clientId = 3723, buy = 6 }
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

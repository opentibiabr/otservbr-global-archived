local internalNpcName = "Chephan"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 2,
	lookBody = 26,
	lookLegs = 115,
	lookFeet = 76,
	lookAddons = 0
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

npcType.onPlayerCloseChannel = function(npc, creature)
	npcHandler:onPlayerCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "baking tray", clientId = 8020, buy = 20 },
	{ itemName = "bottle", clientId = 2875, buy = 3, count = 0 },
	{ itemName = "bucket", clientId = 7142, buy = 4 },
	{ itemName = "cleaver", clientId = 3471, buy = 15 },
	{ itemName = "cup", clientId = 2881, buy = 2, count = 0 },
	{ itemName = "fork", clientId = 3467, buy = 10 },
	{ itemName = "jug", clientId = 7243, buy = 10 },
	{ itemName = "kitchen knife", clientId = 3469, buy = 10 },
	{ itemName = "mug", clientId = 2880, buy = 4, count = 0 },
	{ itemName = "oven spatula", clientId = 3472, buy = 12 },
	{ itemName = "pan", clientId = 3466, buy = 20 },
	{ itemName = "plate", clientId = 2905, buy = 6 },
	{ itemName = "pot", clientId = 3465, buy = 30, count = 0 },
	{ itemName = "rolling pin", clientId = 3473, buy = 12 },
	{ itemName = "spoon", clientId = 3468, buy = 10 },
	{ itemName = "wooden spoon", clientId = 3470, buy = 5 }
}
-- On buy npc shop message
npcType.onPlayerBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 1988)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onPlayerSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)

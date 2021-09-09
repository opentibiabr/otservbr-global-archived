local internalNpcName = "Satsu"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 158,
	lookHead = 78,
	lookBody = 96,
	lookLegs = 118,
	lookFeet = 96,
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
	-- Sellable items
	{ itemName = "cocktail glass", clientId = 9232, sell = 50 },
	-- Buyable items
	{ itemName = "cocktail glass of beer", clientId = 9232, buy = 52, count = 3 },
	{ itemName = "cocktail glass of fruit juice", clientId = 9232, buy = 52, count = 21 },
	{ itemName = "cocktail glass of lemonade", clientId = 9232, buy = 52, count = 5 },
	{ itemName = "cocktail glass of mead", clientId = 9232, buy = 52, count = 43 },
	{ itemName = "cocktail glass of milk", clientId = 9232, buy = 52, count = 6 },
	{ itemName = "cocktail glass of rum", clientId = 9232, buy = 52, count = 27 },
	{ itemName = "cocktail glass of tea", clientId = 9232, buy = 52, count = 35 },
	{ itemName = "cocktail glass of water", clientId = 9232, buy = 52, count = 1 },
	{ itemName = "cocktail glass of wine", clientId = 9232, buy = 52, count = 15 }
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

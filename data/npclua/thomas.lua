local internalNpcName = "Thomas"
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
	lookHead = 116,
	lookBody = 11,
	lookLegs = 100,
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
	{ itemName = "blue book", clientId = 2844, sell = 20 },
	{ itemName = "gemmed book", clientId = 2842, sell = 100 },
	{ itemName = "green book", clientId = 2846, sell = 15 },
	{ itemName = "inkwell", clientId = 3509, sell = 8 },
	{ itemName = "orange book", clientId = 2843, sell = 30 },
	{ itemName = "parchment", clientId = 2814, sell = 5 },
	-- Buyable items
	{ itemName = "black book", clientId = 2838, buy = 15 },
	{ itemName = "brown book", clientId = 2837, buy = 15 },
	{ itemName = "document", clientId = 2818, buy = 12 },
	{ itemName = "greeting card", clientId = 6386, buy = 30 },
	{ itemName = "grey small book", clientId = 2839, buy = 15 },
	{ itemName = "inkwell", clientId = 3509, buy = 10 },
	{ itemName = "parchment", clientId = 2814, buy = 8 },
	{ itemName = "parchment", clientId = 2817, buy = 8 },
	{ itemName = "scroll", clientId = 2815, buy = 5 },
	{ itemName = "spellbook", clientId = 3059, buy = 150 },
	{ itemName = "valentines card", clientId = 6538, buy = 30 }
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

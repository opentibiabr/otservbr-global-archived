local internalNpcName = "Norbert"
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
	lookHead = 6,
	lookBody = 79,
	lookLegs = 93,
	lookFeet = 13,
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "coat", clientId = 3562, sell = 1 },
	{ itemName = "doublet", clientId = 3379, sell = 3 },
	{ itemName = "jacket", clientId = 3561, sell = 1 },
	{ itemName = "leather armor", clientId = 3361, sell = 12 },
	{ itemName = "studded armor", clientId = 3378, sell = 25 },
	-- Buyable items
	{ itemName = "coat", clientId = 3562, buy = 8 },
	{ itemName = "doublet", clientId = 3379, buy = 16 },
	{ itemName = "jacket", clientId = 3561, buy = 12 },
	{ itemName = "leather armor", clientId = 3361, buy = 35 },
	{ itemName = "studded armor", clientId = 3378, buy = 90 },
	{ itemName = "wedding outfit box", clientId = 9586, buy = 5000 }
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

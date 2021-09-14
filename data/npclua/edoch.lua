local internalNpcName = "Edoch"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 146,
	lookHead = 95,
	lookBody = 0,
	lookLegs = 40,
	lookFeet = 116,
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
	{ itemName = "bow", clientId = 3350, sell = 100 },
	{ itemName = "crossbow", clientId = 3349, sell = 120 },
	{ itemName = "spear", clientId = 3277, sell = 3 },
	-- Buyable items
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "blue quiver", clientId = 35848, buy = 400 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
	{ itemName = "diamond arrow", clientId = 35901, buy = 100 },
	{ itemName = "drill bolt", clientId = 16142, buy = 12 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
	{ itemName = "flaming arrow", clientId = 763, buy = 5 },
	{ itemName = "flash arrow", clientId = 761, buy = 5 },
	{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
	{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
	{ itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
	{ itemName = "quiver", clientId = 35562, buy = 400 },
	{ itemName = "red quiver", clientId = 35849, buy = 400 },
	{ itemName = "royal spear", clientId = 7378, buy = 15 },
	{ itemName = "shiver arrow", clientId = 762, buy = 5 },
	{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
	{ itemName = "spear", clientId = 3277, buy = 9 },
	{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
	{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
	{ itemName = "throwing star", clientId = 3287, buy = 42 },
	{ itemName = "vortex bolt", clientId = 14252, buy = 6 }
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

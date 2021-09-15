local internalNpcName = "Alaistar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 19,
	lookBody = 76,
	lookLegs = 60,
	lookFeet = 1,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.shop = {
	-- Sellable items
	{ itemName = "cowbell", clientId = 21204, sell = 210 },
	{ itemName = "empty potion flask", clientId = 283, sell = 5 },
	{ itemName = "empty potion flask", clientId = 284, sell = 5 },
	{ itemName = "empty potion flask", clientId = 285, sell = 5 },
	{ itemName = "execowtioner mask", clientId = 21201, sell = 240 },
	{ itemName = "giant pacifier", clientId = 21199, sell = 170 },
	{ itemName = "glob of glooth", clientId = 21182, sell = 125 },
	{ itemName = "glooth injection tube", clientId = 21103, sell = 350 },
	{ itemName = "metal jaw", clientId = 21193, sell = 260 },
	{ itemName = "metal toe", clientId = 21198, sell = 430 },
	{ itemName = "mooh'tah shell", clientId = 21202, sell = 110 },
	{ itemName = "moohtant horn", clientId = 21200, sell = 140 },
	{ itemName = "necromantic rust", clientId = 21196, sell = 390 },
	{ itemName = "poisoned fang", clientId = 21195, sell = 130 },
	{ itemName = "seacrest hair", clientId = 21801, sell = 260 },
	{ itemName = "seacrest pearl", clientId = 21747, sell = 400 },
	{ itemName = "seacrest scale", clientId = 21800, sell = 150 },
	{ itemName = "slime heart", clientId = 21194, sell = 160 },
	{ itemName = "slimy leaf tentacle", clientId = 21197, sell = 320 },
	{ itemName = "vial", clientId = 2874, sell = 5 },
	-- Buyable items
	{ itemName = "great health potion", clientId = 239, buy = 225 },
	{ itemName = "great mana potion", clientId = 238, buy = 144 },
	{ itemName = "great spirit potion", clientId = 7642, buy = 228 },
	{ itemName = "health potion", clientId = 266, buy = 50 },
	{ itemName = "mana potion", clientId = 268, buy = 56 },
	{ itemName = "strong health potion", clientId = 236, buy = 115 },
	{ itemName = "strong mana potion", clientId = 237, buy = 93 },
	{ itemName = "supreme health potion", clientId = 23375, buy = 625 },
	{ itemName = "ultimate mana potion", clientId = 23373, buy = 379 },
	{ itemName = "ultimate health potion", clientId = 7643, buy = 438 },
	{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 }
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

npcType:register(npcConfig)

local internalNpcName = "Christine"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 2,
	lookBody = 23,
	lookLegs = 2,
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
	{ itemName = "banana", clientId = 3587, buy = 5 },
	{ itemName = "bottle of glooth wine", clientId = 21145, buy = 10 },
	{ itemName = "bowl of glooth soup", clientId = 21144, buy = 4 },
	{ itemName = "bread", clientId = 3600, buy = 4 },
	{ itemName = "cake", clientId = 6277, buy = 50 },
	{ itemName = "cheese", clientId = 3607, buy = 6 },
	{ itemName = "cookie", clientId = 3598, buy = 2 },
	{ itemName = "cucumber", clientId = 8014, buy = 3 },
	{ itemName = "egg", clientId = 3606, buy = 2 },
	{ itemName = "fish", clientId = 3578, buy = 5 },
	{ itemName = "glooth sandwich", clientId = 21143, buy = 7 },
	{ itemName = "glooth steak", clientId = 21146, buy = 10 },
	{ itemName = "ham", clientId = 3582, buy = 8 },
	{ itemName = "meat", clientId = 3577, buy = 5 },
	{ itemName = "potato", clientId = 8010, buy = 4 },
	{ itemName = "red apple", clientId = 3585, buy = 3 },
	{ itemName = "roll", clientId = 3601, buy = 2 },
	{ itemName = "salmon", clientId = 3579, buy = 10 },
	{ itemName = "tomato", clientId = 3596, buy = 5 },
	{ itemName = "white mushroom", clientId = 3723, buy = 10 }
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

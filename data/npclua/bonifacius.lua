local internalNpcName = "Bonifacius"
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
	lookHead = 59,
	lookBody = 82,
	lookLegs = 97,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "banana", clientId = 3587, buy = 2 },
	{ itemName = "cheese", clientId = 3607, buy = 5 },
	{ itemName = "cookie", clientId = 3598, buy = 2 },
	{ itemName = "egg", clientId = 3606, buy = 2 },
	{ itemName = "grapes", clientId = 3592, buy = 3 },
	{ itemName = "meat", clientId = 3577, buy = 5 },
	{ itemName = "melon", clientId = 3593, buy = 8 },
	{ itemName = "orange", clientId = 3586, buy = 5 },
	{ itemName = "pumpkin", clientId = 3594, buy = 10 },
	{ itemName = "roll", clientId = 3601, buy = 2 },
	{ itemName = "salmon", clientId = 3579, buy = 4 }
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

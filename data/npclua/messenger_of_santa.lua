local internalNpcName = "Messenger of Santa"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 159,
	lookHead = 39,
	lookBody = 99,
	lookLegs = 60,
	lookFeet = 117,
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
	{ itemName = "blue christmas bundle", clientId = 6507, buy = 60 },
	{ itemName = "blue christmas garland", clientId = 6504, buy = 25 },
	{ itemName = "christmas branch", clientId = 6488, buy = 40 },
	{ itemName = "christmas card", clientId = 6387, buy = 10 },
	{ itemName = "christmas garland", clientId = 6502, buy = 25 },
	{ itemName = "christmas present green", clientId = 6509, buy = 20 },
	{ itemName = "christmas present red", clientId = 6505, buy = 20 },
	{ itemName = "christmas tree package", clientId = 10207, buy = 50 },
	{ itemName = "christmas wreath", clientId = 6501, buy = 45 },
	{ itemName = "green christmas bundle", clientId = 6508, buy = 80 },
	{ itemName = "red christmas bundle", clientId = 6506, buy = 70 },
	{ itemName = "red christmas garland", clientId = 6503, buy = 25 }
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

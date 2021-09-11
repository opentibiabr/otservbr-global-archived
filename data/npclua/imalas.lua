local internalNpcName = "Imalas"
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
	lookHead = 115,
	lookBody = 9,
	lookLegs = 39,
	lookFeet = 114,
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

keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = "I offer quite a lot of food. Ask me for a {trade} if you're hungry"})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! What do you need? If it's {food}, you've come to the right place.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Yep, take a good look.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "banana", clientId = 3587, buy = 2 },
	{ itemName = "brown bread", clientId = 3602, buy = 3 },
	{ itemName = "carrot", clientId = 3595, buy = 2 },
	{ itemName = "cheese", clientId = 3607, buy = 5 },
	{ itemName = "cherry", clientId = 3590, buy = 1 },
	{ itemName = "cookie", clientId = 3598, buy = 2 },
	{ itemName = "egg", clientId = 3606, buy = 2 },
	{ itemName = "grapes", clientId = 3592, buy = 3 },
	{ itemName = "melon", clientId = 3593, buy = 8 },
	{ itemName = "peas", clientId = 11683, buy = 2 },
	{ itemName = "pumpkin", clientId = 3594, buy = 10 },
	{ itemName = "roll", clientId = 3601, buy = 2 }
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

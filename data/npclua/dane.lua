local internalNpcName = "Dane"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 136,
	lookHead = 79,
	lookBody = 97,
	lookLegs = 86,
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
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the owner of this place of relaxation."})
keywordHandler:addKeyword({'wave cellar'}, StdModule.say, {npcHandler = npcHandler, text = "It's pretty, isn't it?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Dane."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "It is exactly |TIME|."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = "I can offer you milk, water, and lemonade."})
keywordHandler:addKeyword({'alcohol'}, StdModule.say, {npcHandler = npcHandler, text = "Alcohol makes people too aggressive. We don't need such stuff in Carlin."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, text = "Alcohol makes people too aggressive. We don't need such stuff in Carlin."})
keywordHandler:addKeyword({'wine'}, StdModule.say, {npcHandler = npcHandler, text = "Alcohol makes people too aggressive. We don't need such stuff in Carlin."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the wave cellar, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back from time to time.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "bottle of lemonade", clientId = 2875, buy = 12, count = 5 },
	{ itemName = "bottle of milk", clientId = 2875, buy = 4, count = 6 },
	{ itemName = "bottle of water", clientId = 2875, buy = 2, count = 1 }
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

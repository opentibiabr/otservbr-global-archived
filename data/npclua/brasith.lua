local internalNpcName = "Brasith"
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
	lookHead = 41,
	lookBody = 94,
	lookLegs = 97,
	lookFeet = 76
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

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "You may buy all the things we grow or gather at this place."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, text = "We abandoned the gods a long time ago. A short time after they abandoned us."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, text = "They are lost, and if they still exist they are alone in the cold and the darkness."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, text = "The Kuridai left the true path and can't see their error. Their way of living may have been suitable in the past, but if they don't come back to us, their path will lead into darkness."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, text = "We have still much to learn but we are on the correct path at least."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, text = "The Cenath forgot as many as they learned. I doubt they find the wisdom they are looking for without the things they neglected in their pursuit of knowledge."})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, text = "I don't claim to understand this creatures but sometimes they are more close to the roots than we are."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, text = "They are so many, so planless, so divided. They choose a path I do not want for my own race."})
keywordHandler:addKeyword({'plants'}, StdModule.say, {npcHandler = npcHandler, text = "Life takes many forms. Plants are a very basic form of life. Its simplicity makes them close to the core of nature."})
keywordHandler:addKeyword({'tree'}, StdModule.say, {npcHandler = npcHandler, text = "Life takes many forms. Plants are a very basic form of life. Its simplicity makes them close to the core of nature."})

npcHandler:setMessage(MESSAGE_GREET, "Ashari, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Asha Thrazi.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Asha Thrazi.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "banana", clientId = 3587, buy = 2 },
	{ itemName = "bottle of bug milk", clientId = 8758, buy = 200 },
	{ itemName = "bottle of milk", clientId = 2875, buy = 15, count = 6 },
	{ itemName = "broccoli", clientId = 11461, buy = 3 },
	{ itemName = "bulb of garlic", clientId = 8197, buy = 4 },
	{ itemName = "carrot", clientId = 3595, buy = 3 },
	{ itemName = "cauliflower", clientId = 11462, buy = 4 },
	{ itemName = "cherry", clientId = 3590, buy = 1 },
	{ itemName = "corncob", clientId = 3597, buy = 3 },
	{ itemName = "grapes", clientId = 3592, buy = 3 },
	{ itemName = "juice squeezer", clientId = 5865, buy = 100 },
	{ itemName = "melon", clientId = 3593, buy = 8 },
	{ itemName = "potato", clientId = 8010, buy = 4 },
	{ itemName = "pumpkin", clientId = 3594, buy = 10 },
	{ itemName = "strawberry", clientId = 3591, buy = 1 }
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

local internalNpcName = "Penny"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 137,
	lookHead = 58,
	lookBody = 116,
	lookLegs = 117,
	lookFeet = 59,
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

local function greetCallback(npc, creature)
	npcHandler:setMessage(MESSAGE_GREET, "Welcome home, " .. Player(creature):getSex() == PLAYERSEX_FEMALE and "Lady" or "Sir" .. " |PLAYERNAME|.")
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am miss Penny, your secretary."})
keywordHandler:addKeyword({'penny'}, StdModule.say, {npcHandler = npcHandler, text = "Yep, Penny's my name. You seem to be as smart as you're talkative."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I'm a secretary. I'm organising all those papers and your mail."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'record'}, StdModule.say, {npcHandler = npcHandler, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'paper'}, StdModule.say, {npcHandler = npcHandler, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'mail'}, StdModule.say, {npcHandler = npcHandler, text = "You can get a letter from me."})
keywordHandler:addKeyword({'?'}, StdModule.say, {npcHandler = npcHandler, text = "Don't stare at me."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, and may Justice be with you!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Wait... will you take me a diamond when you're back?")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "letter", clientId = 3505, buy = 1 },
	{ itemName = "cake", clientId = 6277, buy = 1 }
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

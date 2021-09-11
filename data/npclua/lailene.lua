local internalNpcName = "Lailene"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 279,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 113,
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

keywordHandler:addKeyword({'brotherhood of bones'}, StdModule.say, {npcHandler = npcHandler, text = "... what?! Uh - no, no. Of course I wouldn't have anything to do with... them."})

npcHandler:setMessage(MESSAGE_GREET, "What do you want in my magical robe store? I doubt I have anything that's of interest to you.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See ya, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See ya, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "batwing hat", clientId = 9103, sell = 8000 },
	{ itemName = "ethno coat", clientId = 8064, sell = 200 },
	{ itemName = "focus cape", clientId = 8043, sell = 6000 },
	{ itemName = "jade hat", clientId = 10451, sell = 9000 },
	{ itemName = "spellweavers rob", clientId = 10438, sell = 12000 },
	{ itemName = "spirit cloak", clientId = 8042, sell = 350 },
	{ itemName = "zaoan robe", clientId = 10439, sell = 12000 },
	-- Buyable items
	{ itemName = "ethno coat", clientId = 8064, buy = 750 },
	{ itemName = "magicians robe", clientId = 7991, buy = 450 },
	{ itemName = "spirit cloak", clientId = 8042, buy = 1000 }
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

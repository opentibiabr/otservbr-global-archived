local internalNpcName = "A Fluffy Squirrel"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 274
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Chchch'}
}
npcConfig.shop = {	-- Sellable items
	{ itemName = "acorn", clientId = 10296, sell = 10 },
	{ itemName = "walnut", clientId = 836, sell = 80 }
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

keywordHandler:addKeyword({'acorn'}, StdModule.say, {npcHandler = npcHandler, text = "Chh? Chhh?? <though you don't understand squirrelish, that one seems really excited>"})

npcHandler:setMessage(MESSAGE_GREET, "Chhchh?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Chh...")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Chh...")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Chchch. Chh! <you're not sure, but it seems that squirrel wants to trade your valuable acorns for useless stones that it found and considered uneatable>")

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)

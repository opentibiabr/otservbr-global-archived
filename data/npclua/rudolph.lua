local internalNpcName = "Rudolph"
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
	lookHead = 41,
	lookBody = 29,
	lookLegs = 78,
	lookFeet = 76,
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

npcHandler:setMessage(MESSAGE_GREET, "Oh, a customer. Hello |PLAYERNAME|. If you'd like to see my wonderful self-tailored clothes, ask me for a {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Oh, good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Oh, good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Sellable items
	{ itemName = "belted cape", clientId = 8044, sell = 500 },
	-- Buyable items
	{ itemName = "belted cape", clientId = 8044, buy = 1300 },
	{ itemName = "cape", clientId = 3565, buy = 9 },
	{ itemName = "green tunic", clientId = 3563, buy = 25 },
	{ itemName = "jacket", clientId = 3561, buy = 12 },
	{ itemName = "rangers cloak", clientId = 3571, buy = 550 },
	{ itemName = "leather legs", clientId = 3559, buy = 10 },
	{ itemName = "leather boots", clientId = 3552, buy = 2 },
	{ itemName = "sandals", clientId = 3551, buy = 2 },
	{ itemName = "scarf", clientId = 3572, buy = 15 }
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

local internalNpcName = "Velvet"
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
	lookHead = 59,
	lookBody = 96,
	lookLegs = 115,
	lookFeet = 95,
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

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "blue pillow", clientId = 2394, buy = 25 },
	{ itemName = "blue tapestry", clientId = 2659, buy = 25 },
	{ itemName = "green pillow", clientId = 2396, buy = 25 },
	{ itemName = "green tapestry", clientId = 2647, buy = 25 },
	{ itemName = "heart pillow", clientId = 2393, buy = 30 },
	{ itemName = "orange tapestry", clientId = 2653, buy = 25 },
	{ itemName = "purple tapestry", clientId = 2644, buy = 25 },
	{ itemName = "red pillow", clientId = 2395, buy = 25 },
	{ itemName = "red tapestry", clientId = 2656, buy = 25 },
	{ itemName = "round blue pillow", clientId = 2398, buy = 25 },
	{ itemName = "round purple pillow", clientId = 2400, buy = 25 },
	{ itemName = "round red pillow", clientId = 2399, buy = 25 },
	{ itemName = "round turquoise pillow", clientId = 2401, buy = 25 },
	{ itemName = "small blue pillow", clientId = 2389, buy = 20 },
	{ itemName = "small green pillow", clientId = 2387, buy = 20 },
	{ itemName = "small orange pillow", clientId = 2390, buy = 20 },
	{ itemName = "small purple pillow", clientId = 2386, buy = 20 },
	{ itemName = "small red pillow", clientId = 2388, buy = 20 },
	{ itemName = "small turquoise pillow", clientId = 2391, buy = 20 },
	{ itemName = "small white pillow", clientId = 2392, buy = 20 },
	{ itemName = "white tapestry", clientId = 2667, buy = 25 },
	{ itemName = "yellow pillow", clientId = 900, buy = 25 },
	{ itemName = "yellow tapestry", clientId = 2650, buy = 25 }
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

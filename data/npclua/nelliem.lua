local internalNpcName = "Nelliem"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 115,
	lookBody = 100,
	lookLegs = 105,
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "broom", clientId = 3211, buy = 12 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "empty flower pot", clientId = 306, buy = 250 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150 },
	{ itemName = "hammer", clientId = 3460, buy = 80 },
	{ itemName = "hoe", clientId = 3455, buy = 15 },
	{ itemName = "machete", clientId = 3308, buy = 35 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "pitchfork", clientId = 3451, buy = 25 },
	{ itemName = "rake", clientId = 3452, buy = 20 },
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "saw", clientId = 3461, buy = 95 },
	{ itemName = "scythe", clientId = 3453, buy = 25 },
	{ itemName = "shovel", clientId = 3457, buy = 20 },
	{ itemName = "watering can", clientId = 650, buy = 50 },
	{ itemName = "worm", clientId = 3492, buy = 1 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	npc:talk(player, string.format("You've bought %i %s for %i gold coins.", amount, name, totalCost))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, amount, name, totalCost)
	npc:talk(player, string.format("You've sold %i %s for %i gold coins.", amount, name, totalCost))
end

npcType:register(npcConfig)

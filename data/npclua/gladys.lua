local internalNpcName = "Gladys"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 148,
	lookHead = 57,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 114,
	lookAddons = 1
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
	-- Sellable items
	{ itemName = "badger boots", clientId = 22086, sell = 7500 },
	{ itemName = "closed trap", clientId = 3481, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, sell = 50 },
	{ itemName = "fishing rod", clientId = 3483, sell = 40 },
	{ itemName = "fox paw", clientId = 27462, sell = 100 },
	{ itemName = "fur armor", clientId = 22085, sell = 5000 },
	{ itemName = "machete", clientId = 3308, sell = 6 },
	{ itemName = "pick", clientId = 3456, sell = 15 },
	{ itemName = "rope", clientId = 3003, sell = 15 },
	{ itemName = "scythe", clientId = 3453, sell = 10 },
	{ itemName = "shovel", clientId = 3457, sell = 8 },
	{ itemName = "watch", clientId = 2906, sell = 6 },
	{ itemName = "werebadger claws", clientId = 22051, sell = 160 },
	{ itemName = "werebadger skull", clientId = 22055, sell = 185 },
	{ itemName = "werebear fur", clientId = 22057, sell = 185 },
	{ itemName = "werebear skull", clientId = 22057, sell = 195 },
	{ itemName = "wereboar hooves", clientId = 22053, sell = 175 },
	{ itemName = "wereboar loincloth", clientId = 22087, sell = 1500 },
	{ itemName = "wereboar tusk", clientId = 22054, sell = 165 },
	{ itemName = "werefox tail", clientId = 27463, sell = 200 },
	{ itemName = "werewolf amulet", clientId = 22060, sell = 3000 },
	{ itemName = "werewolf fang", clientId = 22052, sell = 180 },
	{ itemName = "werewolf fur", clientId = 10317, sell = 380 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	-- Buyable items
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3, count = 0 },
	{ itemName = "bucket", clientId = 2873, buy = 4, count = 0 },
	{ itemName = "candelabrum", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280 },
	{ itemName = "crowbar", clientId = 3304, buy = 260 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 35 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "pick", clientId = 3456, buy = 50 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50 },
	{ itemName = "scythe", clientId = 3453, buy = 50 },
	{ itemName = "shovel", clientId = 3457, buy = 50 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "watch", clientId = 2906, buy = 20 },
	{ itemName = "worm", clientId = 3492, buy = 1 }
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

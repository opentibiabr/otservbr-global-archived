local internalNpcName = "Fadil"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 146,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 0,
	lookFeet = 94,
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
	{ itemName = "collar of blue plasma", clientId = 23542, sell = 6000 },
	{ itemName = "collar of green plasma", clientId = 23543, sell = 6000 },
	{ itemName = "collar of red plasma", clientId = 23544, sell = 6000 },
	{ itemName = "condensed energy", clientId = 23501, sell = 260 },
	{ itemName = "crystal bone", clientId = 23521, sell = 250 },
	{ itemName = "crystallized anger", clientId = 23507, sell = 400 },
	{ itemName = "curious matter", clientId = 23511, sell = 430 },
	{ itemName = "dangerous proto matter", clientId = 23515, sell = 300 },
	{ itemName = "energy ball", clientId = 23523, sell = 300 },
	{ itemName = "energy vein", clientId = 23508, sell = 270 },
	{ itemName = "frozen lightning", clientId = 23519, sell = 270 },
	{ itemName = "glistening bone", clientId = 23522, sell = 250 },
	{ itemName = "green bandage", clientId = 25697, sell = 180 },
	{ itemName = "instable proto matter", clientId = 23516, sell = 300 },
	{ itemName = "little bowl of myrrh", clientId = 25702, sell = 500 },
	{ itemName = "odd organ", clientId = 23510, sell = 410 },
	{ itemName = "plasma pearls", clientId = 23506, sell = 250 },
	{ itemName = "plasmatic lightning", clientId = 23520, sell = 270 },
	{ itemName = "ring of blue plasma", clientId = 23529, sell = 8000 },
	{ itemName = "ring of green plasma", clientId = 23531, sell = 8000 },
	{ itemName = "ring of red plasma", clientId = 23533, sell = 8000 },
	{ itemName = "single human eye", clientId = 25701, sell = 1000 },
	{ itemName = "small energy ball", clientId = 23524, sell = 250 },
	{ itemName = "solid rage", clientId = 23517, sell = 310 },
	{ itemName = "spark sphere", clientId = 23518, sell = 350 },
	{ itemName = "sparkion claw", clientId = 23502, sell = 290 },
	{ itemName = "sparkion legs", clientId = 23504, sell = 310 },
	{ itemName = "sparkion stings", clientId = 23505, sell = 280 },
	{ itemName = "sparkion tail", clientId = 23503, sell = 300 },
	{ itemName = "strange proto matter", clientId = 23513, sell = 300 },
	{ itemName = "volatile proto matter", clientId = 23514, sell = 300 }
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

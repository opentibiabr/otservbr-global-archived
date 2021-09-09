local internalNpcName = "Imbuement Assistant"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 141,
	lookHead = 41,
	lookBody = 72,
	lookLegs = 39,
	lookFeet = 96,
	lookAddons = 3,
	lookMount = 688
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

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Hello adventurer, looking for Imbuement items? Just ask me!'}
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

-- Basic

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Currently I have been working selling items for imbuement."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Imbuement's shop!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")

npcHandler:addModule(FocusModule:new())

npcConfig.shop = {
	-- Buyable items
	{ itemName = "battle stone", clientId = 11447, buy = 100 },
	{ itemName = "blazing bone", clientId = 16131, buy = 100 },
	{ itemName = "bloody pincers", clientId = 9633, buy = 100 },
	{ itemName = "brimstone fangs", clientId = 11702, buy = 100 },
	{ itemName = "brimstone shell", clientId = 11703, buy = 100 },
	{ itemName = "broken shamanic staff", clientId = 11452, buy = 100 },
	{ itemName = "compass", clientId = 10302, buy = 100 },
	{ itemName = "crawler head plating", clientId = 14079, buy = 100 },
	{ itemName = "crystallized anger", clientId = 23507, buy = 100 },
	{ itemName = "cultish mask", clientId = 9638, buy = 100 },
	{ itemName = "cultish robe", clientId = 9639, buy = 100 },
	{ itemName = "cyclops toe", clientId = 9657, buy = 100 },
	{ itemName = "damselfly wing", clientId = 17458, buy = 100 },
	{ itemName = "deepling warts", clientId = 14012, buy = 100 },
	{ itemName = "demon horn", clientId = 5954, buy = 100 },
	{ itemName = "demonic skeletal hand", clientId = 9647, buy = 100 },
	{ itemName = "draken sulphur", clientId = 11658, buy = 100 },
	{ itemName = "elven hoof", clientId = 18994, buy = 100 },
	{ itemName = "elven scouting glass", clientId = 11464, buy = 100 },
	{ itemName = "elvish talisman", clientId = 9635, buy = 100 },
	{ itemName = "energy vein", clientId = 23508, buy = 100 },
	{ itemName = "fairy wings", clientId = 25694, buy = 100 },
	{ itemName = "fiery heart", clientId = 9636, buy = 100 },
	{ itemName = "flask of embalming fluid", clientId = 11466, buy = 100 },
	{ itemName = "frazzle skin", clientId = 20199, buy = 100 },
	{ itemName = "frosty heart", clientId = 9661, buy = 100 },
	{ itemName = "gloom wolf fur", clientId = 22007, buy = 100 },
	{ itemName = "goosebump leather", clientId = 20205, buy = 100 },
	{ itemName = "green dragon leather", clientId = 5877, buy = 100 },
	{ itemName = "green dragon scale", clientId = 5920, buy = 100 },
	{ itemName = "hellspawn tail", clientId = 10304, buy = 100 },
	{ itemName = "lion's mane", clientId = 9691, buy = 100 },
	{ itemName = "little bowl of myrrh", clientId = 25702, buy = 100 },
	{ itemName = "metal spike", clientId = 10298, buy = 100 },
	{ itemName = "mooh'tah shell", clientId = 21202, buy = 100 },
	{ itemName = "moohtant horn", clientId = 21200, buy = 100 },
	{ itemName = "mystical hourglass", clientId = 9660, buy = 100 },
	{ itemName = "ogre nose ring", clientId = 22189, buy = 100 },
	{ itemName = "orc tooth", clientId = 10196, buy = 100 },
	{ itemName = "peacock feather fan", clientId = 21975, buy = 100 },
	{ itemName = "petrified scream", clientId = 10420, buy = 100 },
	{ itemName = "piece of dead brain", clientId = 9663, buy = 100 },
	{ itemName = "piece of scarab shell", clientId = 9641, buy = 100 },
	{ itemName = "piece of swampling wood", clientId = 17823, buy = 100 },
	{ itemName = "pile of grave earth", clientId = 11484, buy = 100 },
	{ itemName = "poisonous slime", clientId = 9640, buy = 100 },
	{ itemName = "polar bear paw", clientId = 9650, buy = 100 },
	{ itemName = "protective charm", clientId = 11444, buy = 100 },
	{ itemName = "quill", clientId = 28567, buy = 100 },
	{ itemName = "rope belt", clientId = 11492, buy = 100 },
	{ itemName = "rorc feather", clientId = 18993, buy = 100 },
	{ itemName = "sabretooth", clientId = 10311, buy = 100 },
	{ itemName = "seacrest hair", clientId = 21801, buy = 100 },
	{ itemName = "silencer claws", clientId = 20200, buy = 100 },
	{ itemName = "slime heart", clientId = 21194, buy = 100 },
	{ itemName = "snake skin", clientId = 9694, buy = 100 },
	{ itemName = "some grimeleech wings", clientId = 22730, buy = 100 },
	{ itemName = "strand of medusa hair", clientId = 10309, buy = 100 },
	{ itemName = "swamp grass", clientId = 9686, buy = 100 },
	{ itemName = "thick fur", clientId = 10307, buy = 100 },
	{ itemName = "vampire teeth", clientId = 9685, buy = 100 },
	{ itemName = "vexclaw talon", clientId = 22728, buy = 100 },
	{ itemName = "war crystal", clientId = 9654, buy = 100 },
	{ itemName = "warmaster's wristguards", clientId = 10405, buy = 100 },
	{ itemName = "waspoid wing", clientId = 14081, buy = 100 },
	{ itemName = "wereboar hooves", clientId = 22053, buy = 100 },
	{ itemName = "winter wolf fur", clientId = 10295, buy = 100 },
	{ itemName = "wyrm scale", clientId = 9665, buy = 100 },
	{ itemName = "wyvern talisman", clientId = 9644, buy = 100 }
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

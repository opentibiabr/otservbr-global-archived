local internalNpcName = "A Ghostly Woman"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 140,
	lookHead = 9,
	lookBody = 85,
	lookLegs = 10,
	lookFeet = 85,
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

npcConfig.voices = {
	interval = 5000,
	chance = 50,
	{text = 'Alone ... so alone. So cold.'}
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

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "Once I was a member of the order of the nightmare knights. Now I am but a shadow who walks these cold halls."})
keywordHandler:addKeyword({'boots'}, StdModule.say, {npcHandler = npcHandler, text = "The north has a puzzle to complete."})

npcHandler:setMessage(MESSAGE_GREET, "I feel you. I hear your thoughts. You are ... alive.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Alone ... so alone. So cold.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Alone ... so alone. So cold.")

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)

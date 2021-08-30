local npcType = Game.createNpcType("Buddel (Raider Camp)")
local npcConfig = {}

npcConfig.description = "Buddel"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 143,
    lookHead = 19,
    lookBody = 57,
    lookLegs = 22,
    lookFeet = 20,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "Oh geeze, where are we again? *HICKS*", yell = false },
    { text = "*HICKS*", yell = false },
    { text = " LALALALA ... an' a bottle of RUM !!!", yell = false }
}

npcConfig.flags = {
    attackable = false,
    hostile = false,
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

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)

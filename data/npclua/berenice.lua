local npcType = Game.createNpcType("Berenice")
local npcConfig = {}

npcConfig.description = "Berenice"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 5,
    lookBody = 87,
    lookLegs = 104,
    lookFeet = 106,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Need orichalcum pearls or an atlas? Get those here.", yell = false },
    { text = "Hiring courageous explorers for a mission!", yell = false }
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

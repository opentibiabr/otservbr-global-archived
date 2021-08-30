local npcType = Game.createNpcType("Alaistar")
local npcConfig = {}

npcConfig.description = "Alaistar"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 133,
    lookHead = 19,
    lookBody = 76,
    lookLegs = 60,
    lookFeet = 1,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "Potions, runes, wands and rods, all here in the great Malunga's house.", yell = false }
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

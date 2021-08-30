local npcType = Game.createNpcType("Cornell")
local npcConfig = {}

npcConfig.description = "Cornell"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 129,
    lookHead = 114,
    lookBody = 99,
    lookLegs = 40,
    lookFeet = 115,
    lookAddons = 2
}

npcConfig.voices = {
    interval = 0,
    chance = 0,
    { text = "Passage to Grimvale available here!", yell = false }
}

npcConfig.flags = {
    attackable = false,
    hostile = false,
    floorchange = false
}

npcType.onThink = function(npc, interval)
end

npcType.onAppear = function(npc, creature)
end

npcType.onDisappear = function(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
end

npcType:register(npcConfig)

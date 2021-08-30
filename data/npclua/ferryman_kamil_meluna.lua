local npcType = Game.createNpcType("Ferryman Kamil (Meluna)")
local npcConfig = {}

npcConfig.description = "Ferryman Kamil"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 0,
    lookBody = 71,
    lookLegs = 76,
    lookFeet = 115,
    lookAddons = 3
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Leaving for Fibula Island soon!", yell = false },
    { text = "Passage for newly weds only.", yell = false }
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

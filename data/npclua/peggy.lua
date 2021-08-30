local npcType = Game.createNpcType("Peggy")
local npcConfig = {}

npcConfig.description = "Peggy"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 136,
    lookHead = 38,
    lookBody = 36,
    lookLegs = 48,
    lookFeet = 38,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Heya. Furniture on sale! Don't miss the opportunity.", yell = false }
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

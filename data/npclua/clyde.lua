local npcType = Game.createNpcType("Clyde")
local npcConfig = {}

npcConfig.description = "Clyde"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 128,
    lookHead = 116,
    lookBody = 59,
    lookLegs = 47,
    lookFeet = 114,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Sit down, have a drink and relax!", yell = false }
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

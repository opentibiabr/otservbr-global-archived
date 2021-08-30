local npcType = Game.createNpcType("Muzir")
local npcConfig = {}

npcConfig.description = "Muzir"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 146,
    lookHead = 95,
    lookBody = 4,
    lookLegs = 11,
    lookFeet = 76,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Daraman's blessings.", yell = false }
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

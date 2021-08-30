local npcType = Game.createNpcType("Janz")
local npcConfig = {}

npcConfig.description = "Janz"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 143,
    lookHead = 58,
    lookBody = 119,
    lookLegs = 118,
    lookFeet = 120,
    lookAddons = 1
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Moved into a new house? I got the perfect furniture for you.", yell = false }
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

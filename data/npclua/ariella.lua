local npcType = Game.createNpcType("Ariella")
local npcConfig = {}

npcConfig.description = "Ariella"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 155,
    lookHead = 115,
    lookBody = 3,
    lookLegs = 1,
    lookFeet = 76,
    lookAddons = 2
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Have a drink in Meriana's only tavern!", yell = false }
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
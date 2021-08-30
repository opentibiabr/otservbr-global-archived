local npcType = Game.createNpcType("Irmana")
local npcConfig = {}

npcConfig.description = "Irmana"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 78,
    lookBody = 90,
    lookLegs = 13,
    lookFeet = 14,
    lookAddons = 3
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Welcome to the house of fashion, Iron Sparrow!", yell = false }
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

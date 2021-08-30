local npcType = Game.createNpcType("Mazarius")
local npcConfig = {}

npcConfig.description = "Mazarius"

npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 1500
npcConfig.speed = 100
npcConfig.walkRadius = 2

npcConfig.health = 100
npcConfig.outfit = {
    lookType = 130,
    lookHead = 78,
    lookBody = 76,
    lookLegs = 19,
    lookFeet = 38,
    lookAddons = 1,
    lookMount = 0
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

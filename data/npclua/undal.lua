local npcType = Game.createNpcType("Undal")
local npcConfig = {}

npcConfig.description = "Undal"

npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2
npcConfig.speed = 0

npcConfig.health = 100
npcConfig.outfit = {
    lookType = 1137,
    lookHead = 0,
    lookBody = 87,
    lookLegs = 49,
    lookFeet = 87,
    lookAddons = 0,
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

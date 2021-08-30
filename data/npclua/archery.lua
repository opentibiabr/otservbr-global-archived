local npcType = Game.createNpcType("Archery")
local npcConfig = {}

npcConfig.description = "Archery"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 683,
    lookHead = 97,
    lookBody = 0,
    lookLegs = 96,
    lookFeet = 114,
    lookAddons = 3,
    lookMount = 1101
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

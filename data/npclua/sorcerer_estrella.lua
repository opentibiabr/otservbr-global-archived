local npcType = Game.createNpcType("Sorcerer Estrella")
local npcConfig = {}

npcConfig.description = "Sorcerer Estrella"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 20000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 149,
    lookHead = 59,
    lookBody = 132,
    lookLegs = 94,
    lookFeet = 114,
    lookAddons = 3
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

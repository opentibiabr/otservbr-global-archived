local npcType = Game.createNpcType("Nicholas")
local npcConfig = {}

npcConfig.description = "Nicholas"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 2,
    lookBody = 6,
    lookLegs = 95,
    lookFeet = 2,
    lookAddons = 0
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

local npcType = Game.createNpcType("Cassino")
local npcConfig = {}

npcConfig.description = "Cassino"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.speed = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 60,
    lookBody = 22,
    lookLegs = 24,
    lookFeet = 32,
    lookAddons = 2
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

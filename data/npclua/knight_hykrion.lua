local npcType = Game.createNpcType("Knight Hykrion")
local npcConfig = {}

npcConfig.description = "Knight Hykrion"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 20000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 131,
    lookHead = 95,
    lookBody = 78,
    lookLegs = 78,
    lookFeet = 95,
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

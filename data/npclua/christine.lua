local npcType = Game.createNpcType("Christine")
local npcConfig = {}

npcConfig.description = "Christine"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 2,
    lookBody = 23,
    lookLegs = 2,
    lookFeet = 115,
    lookAddons = 1
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "Selling various types of food.", yell = false }
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

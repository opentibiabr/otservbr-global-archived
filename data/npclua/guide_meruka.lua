local npcType = Game.createNpcType("Guide Meruka")
local npcConfig = {}

npcConfig.description = "Guide Meruka"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1199,
    lookHead = 95,
    lookBody = 10,
    lookLegs = 74,
    lookFeet = 3,
    lookAddons = 2
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Good bye.", yell = false }
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

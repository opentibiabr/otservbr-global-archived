local npcType = Game.createNpcType("Brengus")
local npcConfig = {}

npcConfig.description = "Brengus"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 79,
    lookBody = 76,
    lookLegs = 76,
    lookFeet = 114,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Best weapons and armors in town!", yell = false }
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

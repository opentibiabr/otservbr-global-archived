local npcType = Game.createNpcType("Kroox")
local npcConfig = {}

npcConfig.description = "Kroox"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 160,
    lookHead = 0,
    lookBody = 120,
    lookLegs = 82,
    lookFeet = 95
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "By the sons of fire! Best weapons in town!", yell = false }
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

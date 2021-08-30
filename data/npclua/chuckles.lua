local npcType = Game.createNpcType("Chuckles")
local npcConfig = {}

npcConfig.description = "Chuckles"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 99
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "My old bones feel a storm approaching. chuckles", yell = false },
    { text = "chuckles!", yell = false }
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

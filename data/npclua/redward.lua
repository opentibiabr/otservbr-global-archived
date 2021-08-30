local npcType = Game.createNpcType("Redward")
local npcConfig = {}

npcConfig.description = "Redward"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 237,
    lookHead = 20,
    lookBody = 39,
    lookLegs = 45,
    lookFeet = 7,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "Are you looking at me!?", yell = false },
    { text = "Welcome to the post office!", yell = false }
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

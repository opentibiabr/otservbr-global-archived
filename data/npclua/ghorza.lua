local npcType = Game.createNpcType("Ghorza")
local npcConfig = {}

npcConfig.description = "Ghorza"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 859,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 0,
    chance = 0,
    { text = "Spirits are restless.", yell = false },
    { text = "Great Hunger is upset.", yell = false },
    { text = "All water drying up and Vuzrog does nothing!", yell = false }
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

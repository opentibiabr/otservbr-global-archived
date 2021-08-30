local npcType = Game.createNpcType("Gail")
local npcConfig = {}

npcConfig.description = "Gail"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 77,
    lookBody = 82,
    lookLegs = 71,
    lookFeet = 114,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "I have gems and beautiful jewellery for you!", yell = false }
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

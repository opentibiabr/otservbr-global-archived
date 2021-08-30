local npcType = Game.createNpcType("Edmund")
local npcConfig = {}

npcConfig.description = "Edmund"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 472,
    lookHead = 116,
    lookBody = 114,
    lookLegs = 95,
    lookFeet = 78,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "Shop Jewels, come to trade with me.", yell = false }
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

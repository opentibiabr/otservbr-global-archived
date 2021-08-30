local npcType = Game.createNpcType("Guide Kroak")
local npcConfig = {}

npcConfig.description = "Guide Kroak"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 38,
    lookBody = 46,
    lookLegs = 68,
    lookFeet = 29,
    lookAddons = 3
}

npcConfig.voices = {
    interval = 11,
    chance = 0,
    { text = "Do not waste your time, let me help you find the way.", yell = false },
    { text = "Those sellers were seen there.", yell = false }
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

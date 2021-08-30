local npcType = Game.createNpcType("Dankwart")
local npcConfig = {}

npcConfig.description = "Dankwart"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 128,
    lookHead = 39,
    lookBody = 58,
    lookLegs = 58,
    lookFeet = 115,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Come to my tavern if you're hungry or thirsty, traveller.", yell = false }
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

local npcType = Game.createNpcType("Maryza")
local npcConfig = {}

npcConfig.description = "Maryza"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 160,
    lookHead = 41,
    lookBody = 51,
    lookLegs = 70,
    lookFeet = 95
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Sit down, have a drink and enjoy the day!", yell = false }
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

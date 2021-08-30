local npcType = Game.createNpcType("Bezil")
local npcConfig = {}

npcConfig.description = "Bezil"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 160,
    lookHead = 116,
    lookBody = 60,
    lookLegs = 76,
    lookFeet = 95
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "General equipment and all sorts of goods. Visit my store!", yell = false }
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
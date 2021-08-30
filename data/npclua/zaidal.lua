local npcType = Game.createNpcType("Zaidal")
local npcConfig = {}

npcConfig.description = "Zaidal"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 128,
    lookHead = 76,
    lookBody = 44,
    lookLegs = 77,
    lookFeet = 95,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Handmade furniture only available in the jungle. Don't miss it!", yell = false }
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

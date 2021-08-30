local npcType = Game.createNpcType("Lora")
local npcConfig = {}

npcConfig.description = "Lora"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 140,
    lookHead = 114,
    lookBody = 70,
    lookLegs = 0,
    lookFeet = 19,
    lookAddons = 1
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Farewell and enjoy the festivities.", yell = false }
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

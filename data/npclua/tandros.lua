local npcType = Game.createNpcType("Tandros")
local npcConfig = {}

npcConfig.description = "Tandros"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 132,
    lookHead = 97,
    lookBody = 79,
    lookLegs = 113,
    lookFeet = 114,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 120,
    chance = 0,
    { text = "Potions, wands and runes for aspiring magicians.", yell = false }
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

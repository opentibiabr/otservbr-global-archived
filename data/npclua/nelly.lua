local npcType = Game.createNpcType("Nelly")
local npcConfig = {}

npcConfig.description = "Nelly"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 138,
    lookHead = 59,
    lookBody = 5,
    lookLegs = 4,
    lookFeet = 19,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "If you need help with letters or parcels, just ask me. I can explain everything.", yell = false },
    { text = "Also selling runes, potions and magical equipment!", yell = false },
    { text = "Welcome to the post office!", yell = false }
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

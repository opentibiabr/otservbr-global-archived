local npcType = Game.createNpcType("Ottokar")
local npcConfig = {}

npcConfig.description = "Ottokar"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 153,
    lookHead = 132,
    lookBody = 121,
    lookLegs = 120,
    lookFeet = 114,
    lookAddons = 3
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Where to get enough food for all?", yell = false },
    { text = "Oh my! Oh my!!", yell = false },
    { text = "This time things are getting troublesome.", yell = false },
    { text = "All these troubles.", yell = false }
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

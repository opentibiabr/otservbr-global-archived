local npcType = Game.createNpcType("Oiriz")
local npcConfig = {}

npcConfig.description = "Oiriz"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 66,
    lookHead = 60,
    lookBody = 100,
    lookLegs = 82,
    lookFeet = 114,
    lookAddons = 1
}

npcConfig.voices = {
    interval = 100,
    chance = 0,
    { text = "Gems and precious jewellery for sale!", yell = false }
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

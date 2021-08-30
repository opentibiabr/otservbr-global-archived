local npcType = Game.createNpcType("Oldrak")
local npcConfig = {}

npcConfig.description = "Oldrak"

npcConfig.health = "150"
npcConfig.maxHealth = "150"
npcConfig.outfit = {
    lookType = 57,
    lookHead = 115,
    lookBody = 113,
    lookLegs = 31,
    lookFeet = 38,
    lookAddons = 3
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

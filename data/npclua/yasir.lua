local npcType = Game.createNpcType("Yasir")
local npcConfig = {}

npcConfig.description = "Yasir"

npcConfig.health = "150"
npcConfig.maxHealth = "150"
npcConfig.outfit = {
    lookType = 146,
    lookHead = 85,
    lookBody = 7,
    lookLegs = 12,
    lookFeet = 19,
    lookAddons = 2
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

local npcType = Game.createNpcType("Cledwyn")
local npcConfig = {}

npcConfig.currency = "25172"
npcConfig.description = "Cledwyn"

npcConfig.health = "150"
npcConfig.maxHealth = "150"
npcConfig.outfit = {
    lookType = 128,
    lookHead = 114,
    lookBody = 0,
    lookLegs = 76,
    lookFeet = 94,
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

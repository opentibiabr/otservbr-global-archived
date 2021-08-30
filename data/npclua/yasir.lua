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

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onCreatureAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onCreatureDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onCreatureSay(npc, creature, type, message)
end

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)

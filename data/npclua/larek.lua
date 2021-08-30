local npcType = Game.createNpcType("Larek")
local npcConfig = {}

npcConfig.description = "Larek"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 472,
    lookHead = 19,
    lookBody = 50,
    lookLegs = 10,
    lookFeet = 3,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 0,
    chance = 0,
    { text = "I should provide more cookies for the ogres. They're looking at me so hungrily.", yell = false },
    { text = "What an interesting speck of land. I have to write down all this in my essay.", yell = false },
    { text = "Hm, guess I haven't found all new plants in this secluded part of the world yet.", yell = false }
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

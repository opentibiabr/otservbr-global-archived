local npcType = Game.createNpcType("Ray")
local npcConfig = {}

npcConfig.description = "Ray"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 128,
    lookHead = 19,
    lookBody = 115,
    lookLegs = 126,
    lookFeet = 58,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 90,
    chance = 0,
    { text = "If you need help with letters or parcels, just ask me. I can explain everything.", yell = false },
    { text = "Stay in touch with your friends. Send a letter, let them know you care and such!", yell = false },
    { text = "Welcome to the post office!", yell = false },
    { text = "No, no, no, there IS no parcel bug, I'm telling you!", yell = false }
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

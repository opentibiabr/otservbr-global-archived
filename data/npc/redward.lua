local npcType = Game.createNpcType("Redward")
local npc = {}

npc.description = "Redward"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 237,
    lookHead = 20,
    lookBody = 39,
    lookLegs = 45,
    lookFeet = 7,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Are you looking at me!?", yell = false },
    { text = "Welcome to the post office!", yell = false }
}

npc.flags = {
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
    if greetMessage(message, creature) then
        npc:say("Hello, ".. creature:getName() ..", what you need?", TALKTYPE_PRIVATE_NP)
    end

    if farewellMessage(message, creature) then
        npc:say("Goodbye, ".. creature:getName() .."", TALKTYPE_PRIVATE_NP)
    end
end

npcType:register(npc)

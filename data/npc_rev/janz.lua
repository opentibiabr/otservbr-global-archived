local npcType = Game.createNpcType("Janz")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "janz.lua"
npc.description = "Janz"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 143,
    lookHead = 58,
    lookBody = 119,
    lookLegs = 118,
    lookFeet = 120,
    lookAddons = 1
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Moved into a new house? I got the perfect furniture for you.", yell = false }
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
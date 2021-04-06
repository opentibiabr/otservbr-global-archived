local npcType = Game.createNpcType("Iwar")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "iwar.lua"
npc.description = "Iwar"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 160,
    lookHead = 115,
    lookBody = 127,
    lookLegs = 123,
    lookFeet = 76
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Beds, chairs, tables, statues and everything you could imagine for decorating your home!", yell = false }
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
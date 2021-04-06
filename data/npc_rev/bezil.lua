local npcType = Game.createNpcType("Bezil")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "bezil.lua"
npc.description = "Bezil"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 160,
    lookHead = 116,
    lookBody = 60,
    lookLegs = 76,
    lookFeet = 95
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "General equipment and all sorts of goods. Visit my store!", yell = false }
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
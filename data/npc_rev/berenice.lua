local npcType = Game.createNpcType("Berenice")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "berenice.lua"
npc.description = "Berenice"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 140,
    lookHead = 5,
    lookBody = 87,
    lookLegs = 104,
    lookFeet = 106,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Need orichalcum pearls or an atlas? Get those here.", yell = false },
    { text = "Hiring courageous explorers for a mission!", yell = false }
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
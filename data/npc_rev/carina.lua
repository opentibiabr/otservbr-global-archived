local npcType = Game.createNpcType("Carina")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "carina.lua"
npc.description = "Carina"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 138,
    lookHead = 97,
    lookBody = 70,
    lookLegs = 94,
    lookFeet = 76,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Fine jewels, rings and amulets!", yell = false }
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
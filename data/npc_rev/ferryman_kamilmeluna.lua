local npcType = Game.createNpcType("Ferryman Kamil")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "ferryman_kamil_meluna.lua"
npc.description = "Ferryman Kamil"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 132,
    lookHead = 0,
    lookBody = 71,
    lookLegs = 76,
    lookFeet = 115,
    lookAddons = 3
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Leaving for Fibula Island soon!", yell = false },
    { text = "Passage for newly weds only.", yell = false }
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
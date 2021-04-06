local npcType = Game.createNpcType("Norbert")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "norbert.lua"
npc.description = "Norbert"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 128,
    lookHead = 6,
    lookBody = 79,
    lookLegs = 93,
    lookFeet = 13,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Wonderful and stylish clothes! Come and buy!", yell = false }
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
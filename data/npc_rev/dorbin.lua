local npcType = Game.createNpcType("Dorbin")
local npc = {}

npc.walkInterval = "2000"
npc.script = "dorbin.lua"
npc.description = "Dorbin"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 128,
    lookHead = 95,
    lookBody = 61,
    lookLegs = 39,
    lookFeet = 115,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Hey, need some furniture for your house? Come to my shop!", yell = false }
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
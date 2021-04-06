local npcType = Game.createNpcType("Guide Meruka")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "guide_meruka.lua"
npc.description = "Guide Meruka"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 1199,
    lookHead = 95,
    lookBody = 10,
    lookLegs = 74,
    lookFeet = 3,
    lookAddons = 2
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Good bye.", yell = false }
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
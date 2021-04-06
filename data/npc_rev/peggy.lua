local npcType = Game.createNpcType("Peggy")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "peggy.lua"
npc.description = "Peggy"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 136,
    lookHead = 38,
    lookBody = 36,
    lookLegs = 48,
    lookFeet = 38,
    lookAddons = 0
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Heya. Furniture on sale! Don't miss the opportunity.", yell = false }
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
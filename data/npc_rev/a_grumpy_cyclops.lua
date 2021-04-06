local npcType = Game.createNpcType("A Grumpy Cyclops")
local npc = {}

npc.walkInterval = "2000"
npc.script = "default.lua"
npc.description = "A Grumpy Cyclops"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 277,
    lookHead = 58,
    lookBody = 43,
    lookLegs = 38,
    lookFeet = 76,
    lookAddons = 0
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
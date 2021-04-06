local npcType = Game.createNpcType("Plunderpurse")
local npc = {}

npc.walkInterval = "0"
npc.floorChange = "0"
npc.script = "plunderpurse.lua"
npc.description = "Plunderpurse"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 151,
    lookHead = 114,
    lookBody = 131,
    lookLegs = 0,
    lookFeet = 20,
    lookAddons = 1
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
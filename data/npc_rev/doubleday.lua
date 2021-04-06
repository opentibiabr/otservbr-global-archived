local npcType = Game.createNpcType("Doubleday")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "doubleday.lua"
npc.description = "Doubleday"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 132,
    lookHead = 20,
    lookBody = 57,
    lookLegs = 39,
    lookFeet = 20,
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
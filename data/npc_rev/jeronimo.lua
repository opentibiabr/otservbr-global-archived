local npcType = Game.createNpcType("Jeronimo")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "jeronimo.lua"
npc.description = "Jeronimo"

npc.health = "150"
npc.maxHealth = "150"
npc.outfit = {
    lookType = 132,
    lookHead = 57,
    lookBody = 59,
    lookLegs = 3,
    lookFeet = 1,
    lookAddons = 3
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
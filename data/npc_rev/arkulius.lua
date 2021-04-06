local npcType = Game.createNpcType("Arkulius")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "arkulius.lua"
npc.description = "Arkulius"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 130,
    lookHead = 0,
    lookBody = 79,
    lookLegs = 90,
    lookFeet = 117,
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
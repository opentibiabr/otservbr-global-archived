local npcType = Game.createNpcType("Yasir")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "yasir.lua"
npc.description = "Yasir"

npc.health = "150"
npc.maxHealth = "150"
npc.outfit = {
    lookType = 146,
    lookHead = 85,
    lookBody = 7,
    lookLegs = 12,
    lookFeet = 19,
    lookAddons = 2
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
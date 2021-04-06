local npcType = Game.createNpcType("Mazarius")
local npc = {}

npc.walkInterval = "1500"
npc.speed = "100"
npc.walkRadius = "2"
npc.description = "Mazarius"

npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.health = 100
npc.outfit = {
    lookType = 130,
    lookHead = 78,
    lookBody = 76,
    lookLegs = 19,
    lookFeet = 38,
    lookAddons = 1,
    lookMount = 0
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

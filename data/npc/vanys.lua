local npcType = Game.createNpcType("Vanys")
local npc = {}

npc.walkInterval = "0"
npc.speed = "100"
npc.walkRadius = "2"
npc.description = "Vanys"

npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.health = 100
npc.outfit = {
    lookType = 1137,
    lookHead = 0,
    lookBody = 38,
    lookLegs = 34,
    lookFeet = 73,
    lookAddons = 0,
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

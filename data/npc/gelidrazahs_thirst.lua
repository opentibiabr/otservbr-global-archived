local npcType = Game.createNpcType("Gelidrazah'S Thirst")
local npc = {}

npc.walkInterval = "100000"
npc.speed = "0"
npc.walkRadius = "0"
npc.description = "Gelidrazah'S Thirst"

npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.health = 100
npc.outfit = {
    lookTypeex = 10948,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
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

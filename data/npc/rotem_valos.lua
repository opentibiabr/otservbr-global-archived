local npcType = Game.createNpcType("Rotem Valos")
local npc = {}

npc.description = "Rotem Valos"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 2

npc.outfit = {
    lookType = 335,
    lookHead = 79,
    lookBody = 77,
    lookLegs = 79,
    lookFeet = 94,
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

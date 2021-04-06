local npcType = Game.createNpcType("A Beggar")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "a_beggar.lua"
npc.description = "A Beggar"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 153,
    lookHead = 39,
    lookBody = 39,
    lookLegs = 39,
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
local npcType = Game.createNpcType("Kulag, The Guard")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "kulag_the_guard.lua"
npc.description = "Kulag, The Guard"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 131,
    lookHead = 0,
    lookBody = 19,
    lookLegs = 19,
    lookFeet = 19,
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
local npcType = Game.createNpcType("Charos")
local npc = {}

npc.walkInterval = "0"
npc.floorChange = "0"
npc.script = "charos.lua"
npc.description = "Charos"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 133,
    lookHead = 60,
    lookBody = 94,
    lookLegs = 114,
    lookFeet = 115,
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
local npcType = Game.createNpcType("Baxter")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "baxter.lua"
npc.description = "Baxter"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 131,
    lookHead = 77,
    lookBody = 29,
    lookLegs = 29,
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
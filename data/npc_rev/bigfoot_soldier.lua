local npcType = Game.createNpcType("Bigfoot Soldier")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "2"
npc.script = "bigfoot_soldier.lua"
npc.description = "Bigfoot Soldier"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 514,
    lookHead = 78,
    lookBody = 120,
    lookLegs = 58,
    lookFeet = 15,
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
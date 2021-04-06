local npcType = Game.createNpcType("A Bearded Woman")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "a_bearded_woman.lua"
npc.description = "A Bearded Woman"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 140,
    lookHead = 60,
    lookBody = 22,
    lookLegs = 24,
    lookFeet = 32,
    lookAddons = 1
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
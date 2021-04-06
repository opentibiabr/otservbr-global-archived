local npcType = Game.createNpcType("Grumpy Stone")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "grumpy_stone.lua"
npc.description = "Grumpy Stone"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 0,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0
}

npc.voices = {
    interval = 33,
    chance = 0,
    { text = "That's annoying!", yell = false },
    { text = "Grrrr ... We would need a pair of hands.", yell = false }
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
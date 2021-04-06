local npcType = Game.createNpcType("Irmana")
local npc = {}

npc.walkInterval = "2000"
npc.script = "irmana.lua"
npc.description = "Irmana"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 140,
    lookHead = 78,
    lookBody = 90,
    lookLegs = 13,
    lookFeet = 14,
    lookAddons = 3
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Welcome to the house of fashion, Iron Sparrow!", yell = false }
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
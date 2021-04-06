local npcType = Game.createNpcType("Frederik")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "frederik.lua"
npc.description = "Frederik"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 128,
    lookHead = 76,
    lookBody = 85,
    lookLegs = 96,
    lookFeet = 91,
    lookAddons = 2
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Potions, runes, wands and rods, all here in the great Malunga's house.", yell = false }
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
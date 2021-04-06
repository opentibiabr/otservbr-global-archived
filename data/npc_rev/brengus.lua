local npcType = Game.createNpcType("Brengus")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "brengus.lua"
npc.description = "Brengus"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 132,
    lookHead = 79,
    lookBody = 76,
    lookLegs = 76,
    lookFeet = 114,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Best weapons and armors in town!", yell = false }
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
local npcType = Game.createNpcType("Dankwart")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "dankwart.lua"
npc.description = "Dankwart"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 128,
    lookHead = 39,
    lookBody = 58,
    lookLegs = 58,
    lookFeet = 115,
    lookAddons = 0
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Come to my tavern if you're hungry or thirsty, traveller.", yell = false }
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
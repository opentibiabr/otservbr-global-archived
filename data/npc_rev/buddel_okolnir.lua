local npcType = Game.createNpcType("Buddel")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "buddel_okolnir.lua"
npc.description = "Buddel"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 143,
    lookHead = 19,
    lookBody = 57,
    lookLegs = 22,
    lookFeet = 20,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Oh geeze, where are we again? *HICKS*", yell = false },
    { text = "*HICKS*", yell = false },
    { text = " LALALALA ... an' a bottle of RUM !!!", yell = false }
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
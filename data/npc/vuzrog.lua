local npcType = Game.createNpcType("Vuzrog")
local npc = {}

npc.description = "Vuzrog"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 857,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0
}

npc.voices = {
    interval = 2,
    chance = 0,
    { text = "More meat! More cookies!", yell = false },
    { text = "Hrmpf, Vuzrog hungry!", yell = false }
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

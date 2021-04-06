local npcType = Game.createNpcType("Xed")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "xed.lua"
npc.description = "Xed"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 129,
    lookHead = 78,
    lookBody = 36,
    lookLegs = 57,
    lookFeet = 97,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Selling bows, crossbows and ammunition!", yell = false }
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
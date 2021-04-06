local npcType = Game.createNpcType("Guide Kroak")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "guide_kroak.lua"
npc.description = "Guide Kroak"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 132,
    lookHead = 38,
    lookBody = 46,
    lookLegs = 68,
    lookFeet = 29,
    lookAddons = 3
}

npc.voices = {
    interval = 11,
    chance = 0,
    { text = "Do not waste your time, let me help you find the way.", yell = false },
    { text = "Those sellers were seen there.", yell = false }
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
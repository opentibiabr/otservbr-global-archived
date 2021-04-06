local npcType = Game.createNpcType("Yawno")
local npc = {}

npc.description = "Yawno"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookTypeex = 3058,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0
}

npc.voices = {
    interval = 14,
    chance = 0,
    { text = "It... *yawn* will show up... sooner or later... *yaaawn*", yell = false },
    { text = "Mmhnmnmnmmmh... no, nooo...! Lemme sleep... I don't wanna go to school...", yell = false }
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

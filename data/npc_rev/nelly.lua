local npcType = Game.createNpcType("Nelly")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "nelly.lua"
npc.description = "Nelly"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 138,
    lookHead = 59,
    lookBody = 5,
    lookLegs = 4,
    lookFeet = 19,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "If you need help with letters or parcels, just ask me. I can explain everything.", yell = false },
    { text = "Also selling runes, potions and magical equipment!", yell = false },
    { text = "Welcome to the post office!", yell = false }
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
local npcType = Game.createNpcType("Larek")
local npc = {}

npc.description = "Larek"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 472,
    lookHead = 19,
    lookBody = 50,
    lookLegs = 10,
    lookFeet = 3,
    lookAddons = 0
}

npc.voices = {
    interval = 0,
    chance = 0,
    { text = "I should provide more cookies for the ogres. They're looking at me so hungrily.", yell = false },
    { text = "What an interesting speck of land. I have to write down all this in my essay.", yell = false },
    { text = "Hm, guess I haven't found all new plants in this secluded part of the world yet.", yell = false }
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

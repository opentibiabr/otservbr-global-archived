local npcType = Game.createNpcType("Servant Sentry")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "servant_sentry.lua"
npc.description = "Servant Sentry"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 396
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
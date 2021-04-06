local npcType = Game.createNpcType("Ghost Of A Priest")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "ghost_of_a_priest.lua"
npc.description = "Ghost Of A Priest"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 355
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
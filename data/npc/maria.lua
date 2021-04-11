local npcType = Game.createNpcType("Maria")
local npc = {}

npc.description = "Maria"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 136,
    lookHead = 77,
    lookBody = 41,
    lookLegs = 62,
    lookFeet = 116,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Hello, hello! Put your feet up and relax in the Hard Rock Tavern.", yell = false }
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
    local player = creature:getPlayer()
    if player then	
        if npc:greet(message, player) then
            return true
        elseif npc:unGreet(message, player) then
            return true
        end
    end
end

npcType:register(npc)

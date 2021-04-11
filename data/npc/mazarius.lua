local npcType = Game.createNpcType("Mazarius")
local npc = {}

npc.description = "Mazarius"

npc.maxHealth = npc.health
npc.walkInterval = 1500
npc.speed = 100
npc.walkRadius = 2

npc.health = 100
npc.outfit = {
    lookType = 130,
    lookHead = 78,
    lookBody = 76,
    lookLegs = 19,
    lookFeet = 38,
    lookAddons = 1,
    lookMount = 0
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

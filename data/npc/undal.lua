local npcType = Game.createNpcType("Undal")
local npc = {}

npc.description = "Undal"

npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 2
npc.speed = 0

npc.health = 100
npc.outfit = {
    lookType = 1137,
    lookHead = 0,
    lookBody = 87,
    lookLegs = 49,
    lookFeet = 87,
    lookAddons = 0,
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

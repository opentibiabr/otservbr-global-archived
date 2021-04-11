local npcType = Game.createNpcType("Gelidrazah'S Thirst")
local npc = {}

npc.description = "Gelidrazah'S Thirst"

npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 2
npc.speed = 0

npc.health = 100
npc.outfit = {
    lookTypeex = 10948,
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
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

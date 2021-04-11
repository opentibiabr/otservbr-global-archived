local npcType = Game.createNpcType("Oldrak")
local npc = {}

npc.description = "Oldrak"

npc.health = "150"
npc.maxHealth = "150"
npc.outfit = {
    lookType = 57,
    lookHead = 115,
    lookBody = 113,
    lookLegs = 31,
    lookFeet = 38,
    lookAddons = 3
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

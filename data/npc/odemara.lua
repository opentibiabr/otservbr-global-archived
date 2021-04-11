local npcType = Game.createNpcType("Odemara")
local npc = {}

npc.description = "Odemara"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 138,
    lookHead = 22,
    lookBody = 99,
    lookLegs = 5,
    lookFeet = 76,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "This is a good day for buying gems! Come and see how they sparkle!", yell = false }
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

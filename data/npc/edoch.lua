local npcType = Game.createNpcType("Edoch")
local npc = {}

npc.description = "Edoch"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 146,
    lookHead = 95,
    lookBody = 0,
    lookLegs = 40,
    lookFeet = 116,
    lookAddons = 0
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Have you run out of ammunition? Come to my store.", yell = false }
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

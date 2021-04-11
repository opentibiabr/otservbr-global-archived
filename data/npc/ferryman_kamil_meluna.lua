local npcType = Game.createNpcType("Ferryman Kamil (Meluna)")
local npc = {}

npc.description = "Ferryman Kamil"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 132,
    lookHead = 0,
    lookBody = 71,
    lookLegs = 76,
    lookFeet = 115,
    lookAddons = 3
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Leaving for Fibula Island soon!", yell = false },
    { text = "Passage for newly weds only.", yell = false }
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

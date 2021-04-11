local npcType = Game.createNpcType("Gree Dee")
local npc = {}

npc.description = "Gree Dee"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 129,
    lookHead = 97,
    lookBody = 77,
    lookLegs = 87,
    lookFeet = 115,
    lookAddons = 0
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Come and buy at a cheap rate!", yell = false },
    { text = "Feel FREE to buy my ITEMS!", yell = true }
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

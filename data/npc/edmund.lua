local npcType = Game.createNpcType("Edmund")
local npc = {}

npc.description = "Edmund"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 472,
    lookHead = 116,
    lookBody = 114,
    lookLegs = 95,
    lookFeet = 78,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Shop Jewels, come to trade with me.", yell = false }
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

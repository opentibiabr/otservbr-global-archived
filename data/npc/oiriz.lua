local npcType = Game.createNpcType("Oiriz")
local npc = {}

npc.description = "Oiriz"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 66,
    lookHead = 60,
    lookBody = 100,
    lookLegs = 82,
    lookFeet = 114,
    lookAddons = 1
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Gems and precious jewellery for sale!", yell = false }
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

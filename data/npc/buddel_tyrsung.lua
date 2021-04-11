local npcType = Game.createNpcType("Buddel (Tyrsung)")
local npc = {}

npc.description = "Buddel"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 143,
    lookHead = 19,
    lookBody = 57,
    lookLegs = 22,
    lookFeet = 20,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Oh geeze, where are we again? *HICKS*", yell = false },
    { text = "*HICKS*", yell = false },
    { text = " LALALALA ... an' a bottle of RUM !!!", yell = false }
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

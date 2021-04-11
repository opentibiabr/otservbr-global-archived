local npcType = Game.createNpcType("Ottokar")
local npc = {}

npc.description = "Ottokar"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 153,
    lookHead = 132,
    lookBody = 121,
    lookLegs = 120,
    lookFeet = 114,
    lookAddons = 3
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Where to get enough food for all?", yell = false },
    { text = "Oh my! Oh my!!", yell = false },
    { text = "This time things are getting troublesome.", yell = false },
    { text = "All these troubles.", yell = false }
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

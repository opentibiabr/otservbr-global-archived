local npcType = Game.createNpcType("Ray")
local npc = {}

npc.description = "Ray"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 128,
    lookHead = 19,
    lookBody = 115,
    lookLegs = 126,
    lookFeet = 58,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "If you need help with letters or parcels, just ask me. I can explain everything.", yell = false },
    { text = "Stay in touch with your friends. Send a letter, let them know you care and such!", yell = false },
    { text = "Welcome to the post office!", yell = false },
    { text = "No, no, no, there IS no parcel bug, I'm telling you!", yell = false }
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

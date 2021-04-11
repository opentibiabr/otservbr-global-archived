local npcType = Game.createNpcType("Bradford")
local npc = {}

npc.description = "Bradford"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 128,
    lookHead = 38,
    lookBody = 93,
    lookLegs = 82,
    lookFeet = 116,
    lookAddons = 2
}

npc.voices = {
    interval = 100,
    chance = 0,
    { text = "Ahem. sings. Laaaaand of the twin suns, how beautiful you are...", yell = false },
    { text = "Ahem. sings.Yo ho ho and a bottle of rum!", yell = false },
    { text = "Ahem. sings. Love... and death... and romance... lalala... and so on.", yell = false },
    { text = "Ahem. sings. Ohhh Tibia, my one true love...", yell = false },
    { text = "Ahem. sings. A stooory is told, adventures unfold...", yell = false },
    { text = "Ahem. sings. It's brother against brother, steel against steel...", yell = false },
    { text = "Ahem. sings. Demons dance in the hall of bones!", yell = false },
    { text = "Okay, now I need some rum to keep my throat wet.", yell = false }
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

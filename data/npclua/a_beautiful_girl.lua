local npcType = Game.createNpcType("A Beautiful Girl")
local npc = {}

npc.description = "A Beautiful Girl"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 140,
    lookHead = 77,
    lookBody = 81,
    lookLegs = 79,
    lookFeet = 95,
    lookAddons = 0
}

npc.flags = {
    hostile = false,
    floorchange = false
}

npc.shop = {
    {id = 3725, buy = 60, sell = 30},
    {id = 3264, buy = 60, sell = 30},
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
    --[[npc:processOnSay(
        message,
        creature:getPlayer(),
        { NpcInteraction:new({"hi"}, "So you have come, ".. creature:getPlayer() ..". I hoped you would not...", interactionTypes.INTERACTION_GREET) }
    )]]
    if msgContains(message, "trade") then
        npc:openShopWindow(creature)
    end
    if msgContains(message, "bye") then
        npc:closeShopWindow(creature)
    end
end

npcType:register(npc)

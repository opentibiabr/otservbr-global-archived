local npcType = Game.createNpcType("Zurak")
local npc = {}

npc.description = "Zurak (Arena)"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 0

npc.outfit = {
    lookType = 114
}

npc.flags = {
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
    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"trip", "passage", "back"},
                ["position"] = Position(33158, 31228, 7),
                ["topic"] = 1,
                ["message"] = "You want to go back?",
                ["acceptedMessage"] = "It'zz your doom you travel to.",
                ["declinedMessage"] = "Zzoftzzkinzz zzo full of fear."
            }),
            NpcInteraction:new({"job", "hurry"}, "Me zzimple ferryman. I arrange {trip} to Zao."),
        }
    )
end

npcType:register(npc)

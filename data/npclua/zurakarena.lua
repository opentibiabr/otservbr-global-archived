local npcType = Game.createNpcType("A Beautiful Girl")
local npc = {}

npc.description = "Zurak"

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
    local tripInteraction = NpcInteraction:new("You want to go back?")
                        :setTopic(1);
    local hintInteraction = NpcInteraction:new("Me zzimple ferryman. I arrange {trip} to Zao.")
                        :setTopic(0);

    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            ["hi"] = NpcInteraction:new(nil, messageTypes.MESSAGE_GREET),
            ["trip"] = tripInteraction,
            ["passage"] = tripInteraction,
            ["back"] = tripInteraction,
            ["yes"] = NpcInteraction:new("It'zz your doom you travel to.")
                        :setTopic(0, 1)
                        :setTeleportConfig(Position(33158, 31228, 7)),
            ["no"] = NpcInteraction:new("Zzoftzzkinzz zzo full of fear.")
                        :setTopic(0, 1),
            ["job"] = hintInteraction,
            ["hurry"] = hintInteraction,
            ["bye"] = NpcInteraction:new(nil, messageTypes.MESSAGE_FAREWELL),
        }
    )
end

npcType:register(npc)

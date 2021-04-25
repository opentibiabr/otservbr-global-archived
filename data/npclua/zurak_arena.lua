local npcType = Game.createNpcType("Zurak")
local npcConfig = {}

npcConfig.description = "Zurak (Arena)"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
    lookType = 114
}

npcConfig.flags = {
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

local interactions = {
    NpcInteraction:createGreetInteraction(),
    NpcInteraction:createReplyInteraction(
            {"trip", "passage", "back"},
            "You want to go back?",
            {current = 1, previous = 0}
    ):addSubInteraction(
        NpcInteraction:createReplyInteraction( {"yes"}, "It'zz your doom you travel to.", {current = 0, previous = 1})
    ):addSubInteraction(
        NpcInteraction:createReplyInteraction( {"no"},"Zzoftzzkinzz zzo full of fear.", {current = 0, previous = 1}),
        interactionRelationType.RELATION_CANCELLATION
    ):addCompletionUpdateProcessor(
        PlayerProcessingConfigs:new():addPosition(Position(33158, 31228, 7))
    ),
    NpcInteraction:createReplyInteraction({"job", "hurry"}, "Me zzimple ferryman. I arrange {trip} to Zao."),
    NpcInteraction:createFarewellInteraction(),
}

npcType.onSay = function(npc, creature, type, message)
    return npc:processOnSay(message, creature, interactions)
end

npcType:register(npcConfig)

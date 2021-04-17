local npcType = Game.createNpcType("Zurak (Arena)")
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
    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            NpcInteraction:new({"trip", "passage", "back"}, "You want to go back?")
                :setTopic(1)
                :addSubInteraction(
                    "yes",
                    NpcInteraction:new("It'zz your doom you travel to.")
                        :setTeleportConfig(Position(33158, 31228, 7))
                ):addSubInteraction(
                    "no",
                    NpcInteraction:new("It'zz your doom you travel to.")
                        :setTeleportConfig(Position(33158, 31228, 7))
                ),
            NpcInteraction:new({"yes"}, "It'zz your doom you travel to.")
                :setTopic(0, 1)
                :setTeleportConfig(Position(33158, 31228, 7)),
            NpcInteraction:new({"no"}, "Zzoftzzkinzz zzo full of fear.")
                :setTopic(0, 1),
            NpcInteraction:new({"job", "hurry"}, "Me zzimple ferryman. I arrange {trip} to Zao.")
                :setTopic(0),
        }
    )
end

npcType:register(npc)

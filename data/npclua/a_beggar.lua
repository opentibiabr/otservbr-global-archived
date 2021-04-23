local npcType = Game.createNpcType("A Beggar")
local npcConfig = {} 

npcConfig.description = "A Beggar"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 153,
    lookHead = 39,
    lookBody = 39,
    lookLegs = 39,
    lookFeet = 76,
    lookAddons = 0
}

npcConfig.flags = {
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
    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            NpcInteraction:new({"hi"}, "Hi! What is it, what d'ye {want}?", interactionTypes.INTERACTION_GREET),
            NpcInteraction
                :new({"want"}, "The guys from the magistrate sent you here, didn't they?")
                :setTopic(1)
                :addStorageCheck(Storage.DarkTrails.Mission01, 1),
            NpcInteraction
                :new(
                    {"yes"},
                    {
                        "Thought so. You'll have to talk to the king though. The beggar king that is. The king does not grant an audience to just everyone. You know how those kings are, don't you? ... ",
                        "However, to get an audience with the king, you'll have to help his subjects a bit. ... ",
                        "His subjects that would be us, the poor, you know? ... ",
                        "So why don't you show your dedication to the poor? Go and help Chavis at the poor house. He's collecting food for people like us. ... ",
                        "If you brought enough of the stuff you'll see that the king will grant you entrance in his {palace}."
                    }
                ):setTopic(0, 1)
                :addStorageChange(Storage.DarkTrails.Mission01, 2)
                :addStorageChange(Storage.DarkTrails.Mission02, 1),
        }
    )
end

npcType:register(npcConfig)

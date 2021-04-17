local npcType = Game.createNpcType("A Beggar")
local npc = {}

npc.name = "A Beggar"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 153,
    lookHead = 39,
    lookBody = 39,
    lookLegs = 39,
    lookFeet = 76,
    lookAddons = 0
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
    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            ["hi"] = NpcConfig:new("Hi! What is it, what d'ye {want}?", messageTypes.MESSAGE_GREET),
            ["want"] = NpcConfig
                :new("The guys from the magistrate sent you here, didn't they?")
                :setTopic(1)
                :addStorageCheck(Storage.DarkTrails.Mission01, 1),
            ["yes"] = NpcConfig
                :new({
                    "Thought so. You'll have to talk to the king though. The beggar king that is. The king does not grant an audience to just everyone. You know how those kings are, don't you? ... ",
                    "However, to get an audience with the king, you'll have to help his subjects a bit. ... ",
                    "His subjects that would be us, the poor, you know? ... ",
                    "So why don't you show your dedication to the poor? Go and help Chavis at the poor house. He's collecting food for people like us. ... ",
                    "If you brought enough of the stuff you'll see that the king will grant you entrance in his {palace}."
                }):setTopic(0, 1)
                :addStorageChange(Storage.DarkTrails.Mission01, 2)
                :addStorageChange(Storage.DarkTrails.Mission02, 1),
            ["bye"] = NpcConfig:new(nil, messageTypes.MESSAGE_FAREWELL),
        }
    )
end

npcType:register(npc)

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
    local configs = {
        -- [keyword] = {topic, previousTopic, message = "" or {}, storages = {storage = value}
        ["hi"] = {
            message = "So you have come, ".. player:getName() ..". I hoped you would not...",
            greet = true
        },
        ["bye"] = {
            message = "Fuck off you asshole",
            farewell = true
        }
    }

    return npc:processOnSay(message, creature:getPlayer(), configs)
end

npcType:register(npc)

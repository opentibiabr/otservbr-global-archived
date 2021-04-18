local npcType = Game.createNpcType("Captain Bluebear")
local npc = {}

npc.description = "Captain Bluebear"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 0

npc.outfit = {
    lookType = 129,
    lookHead = 19,
    lookBody = 69,
    lookLegs = 125,
    lookFeet = 50,
    lookAddons = 0
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
    local player = creature:getPlayer()
    return npc:processOnSay(
        message,
        player,
        {
            NpcInteraction:new({"hi", "hello"}, "Welcome on board, ".. player:getName() .." Where can I {sail} you today?", interactionTypes.INTERACTION_GREET),
            NpcInteraction:new({"name"}, "My name is Captain Bluebear from the Royal Tibia Line."),
            NpcInteraction:new({"job", "captain"}, "I am the captain of this sailing-ship."),
            NpcInteraction:new({"ship", "line", "company", "tibia"}, "The Royal Tibia Line connects all seaside towns of Tibia."),
            NpcInteraction:new({"good"}, "We can transport everything you want."),
            NpcInteraction:new({"passenger"}, ""),
            NpcInteraction:new({"trip", "route", "passage", "town", "destination", "sail", "go"}, "Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Venore}, {Port Hope}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Roshamuul}, {Oramond} or {Edron}?"),
            NpcInteraction:new({"ice", "senja", "folda", "vega"}, "I\'m sorry, but we don\'t serve the routes to the Ice Islands."),
            NpcInteraction:new({"darashia", "darama"}, "I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there."),
            NpcInteraction:new({"ghost"}, "Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!"),
            NpcInteraction:new({"thais"}, "This is Thais. Where do you want to go?"),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("carlin", 110, Position(32387, 31820, 6), 1)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("ab'dendriel", 130, Position(32734, 31668, 6), 2)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("edron", 160, Position(33175, 31764, 6), 3)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("venore", 170, Position(32954, 32022, 6), 4)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("port hope", 160, Position(32527, 32784, 6), 5)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("roshamuul", 210, Position(33494, 32567, 7), 6)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("svargrond", 180, Position(32341, 31108, 6), 7)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("liberty bay", 180, Position(32285, 32892, 6), 8)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("yalahar", 200, Position(32816, 31272, 6), 9)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("oramond", 150, Position(33479, 31985, 7), 10)),
            NpcInteraction:createTravelInteraction(NpcTravelConfig:new("krailos", 230, Position(33492, 31712, 6), 11)),
            NpcInteraction:new({"bye", "farewell"}, "Good bye. Recommend us if you were satisfied with our service.", interactionTypes.INTERACTION_FAREWELL),
        }
    )
end

npcType:register(npc)

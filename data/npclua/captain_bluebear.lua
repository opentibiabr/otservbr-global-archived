local npcType = Game.createNpcType("Captain Bluebear")
local npcConfig = {} 

npcConfig.description = "Captain Bluebear"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
    lookType = 129,
    lookHead = 19,
    lookBody = 69,
    lookLegs = 125,
    lookFeet = 50,
    lookAddons = 0
}

npcConfig.voices = {
    interval = 2000,
    chance = 20,
    { text = 'Passages to Carlin, Ab\'Dendriel, Edron, Venore, Port Hope, Liberty Bay, Yalahar, Roshamuul, Krailos, Oramond and Svargrond.' }
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

npcType.onSay = function(npc, creature, type, message)
    return npc:processOnSay(
        message,
        creature,
        {
            NpcInteraction:new({"hi", "hello"}, "Welcome on board, ".. creature:getName() .." Where can I {sail} you today?", interactionTypes.INTERACTION_GREET),
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
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"carlin"},
                ["cost"] = 110,
                ["position"] = Position(32387, 31820, 6),
                ["topic"] = 1
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"ab'dendriel"},
                ["cost"] = 130,
                ["position"] = Position(32734, 31668, 6),
                ["topic"] = 2
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"edron"},
                ["cost"] = 160,
                ["position"] = Position(33175, 31764, 6),
                ["topic"] = 3
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"venore"},
                ["cost"] = 170,
                ["position"] = Position(32954, 32022, 6),
                ["topic"] = 4
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"port hope"},
                ["cost"] = 160,
                ["position"] = Position(32527, 32784, 6),
                ["topic"] = 5
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"roshamuul"},
                ["cost"] = 210,
                ["position"] = Position(33494, 32567, 7),
                ["topic"] = 6
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"svargrond"},
                ["cost"] = 180,
                ["position"] = Position(32341, 31108, 6),
                ["topic"] = 7
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"liberty bay"},
                ["cost"] = 180,
                ["position"] = Position(32285, 32892, 6),
                ["topic"] = 8
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"yalahar"},
                ["cost"] = 200,
                ["position"] = Position(32816, 31272, 6),
                ["topic"] = 9
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"oramond"},
                ["cost"] = 150,
                ["position"] = Position(33479, 31985, 6),
                ["topic"] = 10
            }),
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"krailos"},
                ["cost"] = 230,
                ["position"] = Position(33492, 31712, 6),
                ["topic"] = 11
            }),
            NpcInteraction:new({"bye", "farewell"}, "Good bye. Recommend us if you were satisfied with our service.", interactionTypes.INTERACTION_FAREWELL),
        }
    )
end

npcType:register(npcConfig)

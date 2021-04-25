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

local interactions = {
    NpcInteraction:createGreetInteraction("Welcome on board %s, Where can I {sail} you today?"),
    NpcInteraction:createReplyInteraction({"name"}, "My name is Captain Bluebear from the Royal Tibia Line."),
    NpcInteraction:createReplyInteraction({"job", "captain"}, "I am the captain of this sailing-ship."),
    NpcInteraction:createReplyInteraction({"ship", "line", "company", "tibia"}, "The Royal Tibia Line connects all seaside towns of Tibia."),
    NpcInteraction:createReplyInteraction({"good"}, "We can transport everything you want."),
    NpcInteraction:createReplyInteraction({"passenger"}, ""),
    NpcInteraction:createReplyInteraction({"trip", "route", "passage", "town", "destination", "sail", "go"}, "Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Venore}, {Port Hope}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Roshamuul}, {Oramond} or {Edron}?"),
    NpcInteraction:createReplyInteraction({"ice", "senja", "folda", "vega"}, "I\'m sorry, but we don\'t serve the routes to the Ice Islands."),
    NpcInteraction:createReplyInteraction({"darashia", "darama"}, "I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there."),
    NpcInteraction:createReplyInteraction({"ghost"}, "Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!"),
    NpcInteraction:createReplyInteraction({"thais"}, "This is Thais. Where do you want to go?"),
    NpcInteraction:createTravelInteraction("carlin", 110, Position(32387, 31820, 6), 'postman', 1)
        :addCompletionUpdateProcessor(
            PlayerProcessingConfigs:new()
               :addCallback(
                    function(player)
                        if player:getStorageValue(Storage.Postman.Mission01) == 1 then
                            player:setStorageValue(Storage.Postman.Mission01, 2)
                        end
                    end
                )
        ),
    NpcInteraction:createTravelInteraction("ab'dendriel", 130, Position(32734, 31668, 6), 'postman', 2),
    NpcInteraction:createTravelInteraction("edron", 160, Position(33175, 31764, 6), 'postman', 3),
    NpcInteraction:createTravelInteraction("venore", 170, Position(32954, 32022, 6), 'postman', 4),
    NpcInteraction:createTravelInteraction("port hope", 160, Position(32527, 32784, 6), 'postman', 5),
    NpcInteraction:createTravelInteraction("roshamuul", 210, Position(33494, 32567, 7), 'postman', 6),
    NpcInteraction:createTravelInteraction("svargrond", 180, Position(32341, 31108, 6), 'postman', 7),
    NpcInteraction:createTravelInteraction("liberty bay", 180, Position(32285, 32892, 6), 'postman', 8),
    NpcInteraction:createTravelInteraction("yalahar", 200, Position(32816, 31272, 6), 'postman', 9)
        :addInitValidationProcessor(
            PlayerProcessingConfigs:new()
                :addCallback(
                    function (player)
                        return player:getStorageValue(Storage.SearoutesAroundYalahar.Thais) ~= 1
                            and player:getStorageValue(Storage.SearoutesAroundYalahar.TownsCounter) < 5
                    end
                )
        ),
    NpcInteraction:createTravelInteraction("oramond", 150, Position(33479, 31985, 7), 'postman', 10),
    NpcInteraction:createTravelInteraction("krailos", 230, Position(33492, 31712, 6), 'postman', 11),
    NpcInteraction:createFarewellInteraction("Good bye %s. Recommend us if you were satisfied with our service."),
}

npcType.onSay = function(npc, creature, type, message)
    return npc:processOnSay(message, creature, interactions)
end

npcType:register(npcConfig)

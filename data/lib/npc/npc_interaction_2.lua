NpcInteraction = {}
NpcMessages = {}
NpcTopic = {}

function NpcTopic:new(current, previous)
    obj = {
        current = current or 0,
        previous = previous or nil,
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcMessages:new(obj)
    obj = obj or {
        -- TODO: to insert default messages
        greetMessage = "",
        farewellMessage = "",
        confirmedMessage = "",
        declinedMessage = "",
        deniedMessage = "",
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcInteraction:new()
    obj = {
        keywords = {},
        subInteractions = {},
        messages = NpcMessages:new(),
        topic = NpcTopic:new(),
        onInitPlayerProcessors = {
            validator = nil,
            updater = nil,
        },
        onCompletePlayerProcessors = {
            validator = nil,
            updater = nil,
        },
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

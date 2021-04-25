NpcInteraction = {}
NpcMessages = {}
NpcTopic = {}

InteractionRelationType = {
    RELATION_CONFIRMATION = 1,
    RELATION_CANCELLATION = 2,
}

function NpcTopic:new(obj)
    obj = obj or {}
    obj = {
        current = obj.current or 0,
        previous = obj.previous or nil,
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcMessages:new(obj)
    obj = obj or {}
    obj = {
        reply = obj.reply or "",
        confirmation = obj.confirmation or "",
        cancellation = obj.cancellation or "",
        cannotExecute = obj.cannotExecute or "",
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcInteraction:new(keywords, messages, topic)
    obj = {
        keywords = keywords or {},
        messages = NpcMessages:new(messages or {}),
        topic = NpcTopic:new(topic or {}),
        parent = nil,
        children = {},
        onInitPlayerProcessors = {
            validators = {},
            updaters = {},
        },
        onCompletePlayerProcessors = {
            validators = {},
            updaters = {},
        },
    }

    if getmetatable(obj.messages) ~= NpcMessages then
        error("Invalid argument: messages needs to be of type NpcMessages")
    end

    if getmetatable(obj.topic) ~= NpcTopic then
        error("Invalid argument: topic needs to be of type NpcTopic")
    end

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcInteraction:execute(message, player, npc)
    if self:checkPlayerInteraction(player, npc) and self:hasMessageValidKeyword(message) then
        -- If initial processor validations failed, skip all the rest
        if not self:runOnInitPlayerProcessors(player, npc) then
            return false
        end

        npc:talk(player, self.messages.reply)
        self:updatePlayerInteraction(player, npc)

        if self.parent and self.parent.relationType == InteractionRelationType.RELATION_CONFIRMATION then
            self.parent.interaction:runOnCompletePlayerProcessors(player, npc)
        end

        if #self.children == 0 then
            self:runOnCompletePlayerProcessors(player, npc)
        end

        return true
    end

    for _, child in pairs(self.children) do
        child:execute(message, player, npc)
    end

    return false
end

function NpcInteraction:hasMessageValidKeyword(message)
    for _, keyword in pairs(self.keywords) do
        if msgContains(message, keyword) then
            return true
        end
    end
    return false
end

function NpcInteraction:checkPlayerInteraction(player, npc)
    if not self.topic.previous then
        return npc:isInteractingWithPlayer(player)
    end

    if self.topic.previous == -1 then
        return not npc:isInteractingWithPlayer(player)
    end

    return npc:isPlayerInteractingOnTopic(player, self.topic.previous)
end

function NpcInteraction:updatePlayerInteraction(player, npc)
    if self.topic.current == -1 then
        npc:removePlayerInteraction(player)
    else
        npc:setPlayerInteraction(player, self.topic.current)
    end
end

function NpcInteraction:runOnInitPlayerProcessors(player, npc)
    for _, processor in pairs(self.onInitPlayerProcessors.validators) do
        if not processor:validate(player, npc) then return false end
    end

    for _, processor in pairs(self.onInitPlayerProcessors.updaters) do
        processor:update(player, npc)
    end

    return true
end

function NpcInteraction:runOnCompletePlayerProcessors(player, npc)
    for _, processor in pairs(self.onCompletePlayerProcessors.validators) do
        if not processor:validate(player, npc) then
            if npc then npc:talk(player, self.messages.cannotExecute) end
            return false
        end
    end

    for _, processor in pairs(self.onCompletePlayerProcessors.updaters) do
        processor:update(player, npc)
    end

    return true
end

function NpcInteraction:getValidNpcInteractionForMessage(message, npc, player)
    for _, keyword in pairs(self.keywords) do
        if msgContains(message, keyword) then return self end
    end

    for _, subInteraction in pairs(self.children) do
        local child = subInteraction:getValidNpcInteractionForMessage(message, npc, player)
        if child and child.topic.previous and npc:isPlayerInteractingOnTopic(player, child.topic.previous) then
            return child
        end
    end

    return nil
end

function NpcInteraction:addSubInteraction(subInteraction, relationType)
    if not self:isValidSubInteraction(subInteraction) then return self end
    subInteraction.parent = { interaction = self, relationType = relationType or InteractionRelationType.RELATION_CONFIRMATION }
    self.children[#self.children + 1] = subInteraction

    return self
end

function NpcInteraction:addInitValidationProcessor(validator)
    if not self:isValidProcessor(validator) then return self end
    self.onInitPlayerProcessors.validators[#self.onInitPlayerProcessors.validators + 1] = validator

    return self
end

function NpcInteraction:addInitUpdateProcessor(updater)
    if not self:isValidProcessor(updater) then return self end
    self.onInitPlayerProcessors.updaters[#self.onInitPlayerProcessors.updaters + 1] = updater

    return self
end

function NpcInteraction:addCompletionValidationProcessor(validator)
    if not self:isValidProcessor(validator) then return self end
    self.onCompletePlayerProcessors.validators[#self.onCompletePlayerProcessors.validators + 1] = validator

    return self
end

function NpcInteraction:addCompletionUpdateProcessor(updater)
    if not self:isValidProcessor(updater) then return self end
    self.onCompletePlayerProcessors.updaters[#self.onCompletePlayerProcessors.updaters + 1] = updater

    return self
end

function NpcInteraction:isValidSubInteraction(interaction)
    if getmetatable(interaction) ~= NpcInteraction then
        error("Invalid argument: subInteraction needs to be of type NpcInteraction")
        return false
    end
    return true
end

function NpcInteraction:isValidProcessor(procesor)
    if getmetatable(procesor) ~= PlayerProcessingConfigs then
        error("Invalid argument: processor needs to be of type PlayerProcessingConfigs")
    end
    return true
end

function NpcInteraction:createGreetInteraction(message, keywords)
    return NpcInteraction:new(
        keywords or {"hi", "hello"},
        {reply = message or "Hello, %s, what you need?"},
        {previous = -1}
    )
end

function NpcInteraction:createFarewellInteraction(message, keywords)
    return NpcInteraction:new(
        keywords or {"bye", "farewell"},
        {reply = message or "Goodbye, %s."},
        {current = -1}
    )
end

function NpcInteraction:createReplyInteraction(keywords, message, topic)
    return NpcInteraction:new(
        keywords,
        {reply = message},
        topic
    )
end

function NpcInteraction:createTravelInteraction(town, cost, position, discount, travelTopic)
    return NpcInteraction:createReplyInteraction(
        {town},
        buildTravelMessage("Do you seek a passage to %s for %s?", town, cost),
        {current = travelTopic, previous = 0}
    ):addSubInteraction(
        NpcInteraction:createReplyInteraction( {"yes"}, "Set the sails!", {current = 0, previous = travelTopic})
    ):addSubInteraction(
        NpcInteraction:createReplyInteraction( {"no"},"We would like to serve you some time.", {current = 0, previous = travelTopic}),
        InteractionRelationType.RELATION_CANCELLATION
    ):addCompletionUpdateProcessor(
        PlayerProcessingConfigs:new()
           :addPosition(position)
           :addCallback(
            function(player)
                PlayerProcessingConfigs:new():removeAmount(player:calculateTravelPrice(cost, discount)):update(player)
                    end
                )
    )
end
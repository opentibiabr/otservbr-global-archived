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

function NpcInteraction:createConfirmationInteraction(keywords, messages, childTopic)
    return NpcInteraction:new(
            keywords,
            messages,
            {current = childTopic, previous = 0}
    ):addSubInteraction(
            NpcInteraction:createReplyInteraction( {"yes"}, nil, {current = 0, previous = childTopic})
    ):addSubInteraction(
            NpcInteraction:createReplyInteraction( {"no"},nil, {current = 0, previous = childTopic}),
            InteractionRelationType.RELATION_CANCELLATION
    )
end

function NpcInteraction:createTravelInteraction(player, town, cost, position, messages, discount, travelTopic)
    cost = player and player:calculateTravelPrice(cost, discount) or cost

    return NpcInteraction:createConfirmationInteraction(
            {town},
            {
                reply = buildTravelMessage(messages.reply, town, cost),
                confirmation = messages.confirmation,
                cancellation = messages.cancellation,
                cannotExecute = messages.cannotExecute,
            },
            travelTopic
    ):addCompletionUpdateProcessor(PlayerProcessingConfigs:new():addPosition(position):removeAmount(cost))
end
lu = require('luaunit')

function test_NpcInteraction_EmptyConstructor()
    local interaction = NpcInteraction:new()
    lu.assertEquals(interaction.parent, nil)
    lu.assertEquals(interaction.children, {})
    lu.assertEquals(interaction.keywords, {})

    lu.assertIsTrue(getmetatable(interaction.messages) == NpcMessages)
    lu.assertIsTrue(getmetatable(interaction.topic) == NpcTopic)

    lu.assertNotIsNil(interaction.onInitPlayerProcessors)
    lu.assertEquals(interaction.onInitPlayerProcessors.validators, {})
    lu.assertEquals(interaction.onInitPlayerProcessors.updaters, {})

    lu.assertNotIsNil(interaction.onCompletePlayerProcessors)
    lu.assertEquals(interaction.onCompletePlayerProcessors.validators, {})
    lu.assertEquals(interaction.onCompletePlayerProcessors.updaters, {})

    lu.assertIsTrue(getmetatable(interaction) == NpcInteraction)
end

function test_NpcInteraction_ConstructorParameters()
    local keywords = {"hi", "hello"}

    local messages = {
        greetMessage = "Hello moto!",
        farewellMessage = "Bye, bastard!",
        confirmedMessage = "Hmm, you were wise in confirm!",
        declinedMessage = "Fuck you.",
        deniedMessage = "You're joking, ehn?",
    }

    local topic = {
        current = 123,
        previous = 255,
    }

    local interaction = NpcInteraction:new(keywords, messages, topic)

    lu.assertEquals(interaction.keywords, keywords)
    lu.assertMessages(interaction.messages, messages)
    lu.assertTopic(interaction.topic, topic)

    lu.assertIsTrue(getmetatable(interaction.messages) == NpcMessages)
    lu.assertIsTrue(getmetatable(interaction.topic) == NpcTopic)
end

function test_NpcInteraction_AddSubInteraction()
    local interaction = NpcInteraction:new({"parent"})
    local subInteraction1 = NpcInteraction:new({"sub_interaction_1"})
    local subInteraction2 = NpcInteraction:new({"sub_interaction_2"})

    interaction:addSubInteraction(subInteraction1)
    interaction:addSubInteraction(subInteraction2)

    lu.assertEquals(#interaction.children, 2)
    lu.assertEquals(interaction.children[1].keywords, {"sub_interaction_1"})
    lu.assertEquals(interaction.children[2].keywords, {"sub_interaction_2"})

    lu.assertEquals(subInteraction2.parent.keywords, subInteraction1.parent.keywords)

    lu.assertEquals(subInteraction1.parent.keywords, {"parent"})
    lu.assertIsTrue(getmetatable(subInteraction1.parent) == NpcInteraction)
end

function test_NpcInteraction_AddEmptySubInteractionFails()
    lu.assertErrorMsgContains(
            'Invalid argument: subInteraction needs to be of type NpcInteraction',
            function () NpcInteraction:new():addSubInteraction() end
    )
end

function test_NpcInteraction_AddInvalidSubInteractionFails()
    lu.assertErrorMsgContains(
            'Invalid argument: subInteraction needs to be of type NpcInteraction',
            function () NpcInteraction:new():addSubInteraction({}) end
    )
end

function test_NpcInteraction_AddInitValidationProcessor()
    local interaction = NpcInteraction:new()
    interaction:addInitValidationProcessor(PlayerProcessingConfigs:new():addAmount(25123))
    interaction:addInitValidationProcessor(PlayerProcessingConfigs:new():addAmount(0))

    lu.assertEquals(#interaction.onInitPlayerProcessors.validators, 2)
    lu.assertEquals(interaction.onInitPlayerProcessors.validators[1].moneyAmount, 25123)
    lu.assertEquals(interaction.onInitPlayerProcessors.validators[2].moneyAmount, 0)
end

function test_NpcInteraction_AddInitValidationProcessorWithEmptyProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addInitValidationProcessor() end
    )
end

function test_NpcInteraction_AddInitValidationProcessorWithInvalidProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addInitValidationProcessor({}) end
    )
end

function test_NpcInteraction_AddInitUpdateProcessor()
    local interaction = NpcInteraction:new()
    interaction:addInitUpdateProcessor(PlayerProcessingConfigs:new():addAmount(25120))
    interaction:addInitUpdateProcessor(PlayerProcessingConfigs:new():addAmount(0))

    lu.assertEquals(#interaction.onInitPlayerProcessors.updaters, 2)
    lu.assertEquals(interaction.onInitPlayerProcessors.updaters[1].moneyAmount, 25120)
    lu.assertEquals(interaction.onInitPlayerProcessors.updaters[2].moneyAmount, 0)
end

function test_NpcInteraction_AddInitUpdateProcessorWithEmptyProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addInitUpdateProcessor() end
    )
end

function test_NpcInteraction_AddInitUpdateProcessorWithInvalidProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addInitUpdateProcessor({}) end
    )
end

function test_NpcInteraction_AddCompletionValidationProcessor()
    local interaction = NpcInteraction:new()
    interaction:addCompletionValidationProcessor(PlayerProcessingConfigs:new():addAmount(25121))
    interaction:addCompletionValidationProcessor(PlayerProcessingConfigs:new():addAmount(0))

    lu.assertEquals(#interaction.onCompletePlayerProcessors.validators, 2)
    lu.assertEquals(interaction.onCompletePlayerProcessors.validators[1].moneyAmount, 25121)
    lu.assertEquals(interaction.onCompletePlayerProcessors.validators[2].moneyAmount, 0)
end

function test_NpcInteraction_AddCompletionValidationProcessorWithInvalidProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addCompletionValidationProcessor({}) end
    )
end

function test_NpcInteraction_AddCompletionValidationProcessorWithEmptyProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addCompletionValidationProcessor() end
    )
end

function test_NpcInteraction_AddCompletionUpdateProcessor()
    local interaction = NpcInteraction:new()
    interaction:addCompletionUpdateProcessor(PlayerProcessingConfigs:new():addAmount(25122))
    interaction:addCompletionUpdateProcessor(PlayerProcessingConfigs:new():addAmount(0))

    lu.assertEquals(#interaction.onCompletePlayerProcessors.updaters, 2)
    lu.assertEquals(interaction.onCompletePlayerProcessors.updaters[1].moneyAmount, 25122)
    lu.assertEquals(interaction.onCompletePlayerProcessors.updaters[2].moneyAmount, 0)
end

function test_NpcInteraction_AddCompletionUpdateProcessorWithEmptyProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addCompletionUpdateProcessor() end
    )
end

function test_NpcInteraction_AddCompletionUpdateProcessorWithInvalidProcessorThrows()
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:new():addCompletionUpdateProcessor({}) end
    )
end

function test_NpcInteraction_HasMessageValidKeyword()
    local interaction = NpcInteraction:new({"donuts", "somoha", "brazil"})
    lu.assertIsTrue(interaction:hasMessageValidKeyword("I love donuts bro, lets eat it"))
    lu.assertIsTrue(interaction:hasMessageValidKeyword("Don't you dare going to somoha"))
    lu.assertIsTrue(interaction:hasMessageValidKeyword("Waaait! Brazil? Noooo"))

    lu.assertIsFalse(interaction:hasMessageValidKeyword("I love donut bro, lets eat it"))
    lu.assertIsFalse(interaction:hasMessageValidKeyword("Don't you dare going to s omoha"))
    lu.assertIsFalse(interaction:hasMessageValidKeyword("Waaait! Brzil? Noooo"))
    lu.assertIsFalse(interaction:hasMessageValidKeyword(""))

end

function test_NpcInteraction_UpdatePlayerInteraction()
    local player = FakePlayer:new()
    local npc = {}
    function npc:removePlayerInteraction(player)
        player.topic = nil
    end
    function npc:setPlayerInteraction(player, topic)
        player.topic = topic
    end

    lu.assertIsNil(player.topic)

    local interaction = NpcInteraction:new({}, {}, {current = 5})
    interaction:updatePlayerInteraction(player, npc)
    lu.assertEquals(player.topic, 5)

    local interaction = NpcInteraction:new({}, {}, {current = 3})
    interaction:updatePlayerInteraction(player, npc)
    lu.assertEquals(player.topic, 3)

    local interaction = NpcInteraction:new({}, {}, {current = -1})
    interaction:updatePlayerInteraction(player, npc)
    lu.assertIsNil(player.topic)
end

function test_NpcInteraction_RunOnInitPlayerProcessor()
    local player = FakePlayer:new()
    local interaction = NpcInteraction:new()
    local call = 0

    local updateProcessor = PlayerProcessingConfigs:new()
    local validationProcessor = PlayerProcessingConfigs:new()

    updateProcessor.update = function()
        call = call + 1
    end

    validationProcessor.validate = function()
        call = call + 1
    end

    interaction:addInitUpdateProcessor(updateProcessor)
    interaction:addInitValidationProcessor(validationProcessor)

    interaction:runOnInitPlayerProcessors(player)

    lu.assertEquals(call, 2)
end

function test_NpcInteraction_RunOnCompletePlayerProcessors()
    local player = FakePlayer:new()
    local interaction = NpcInteraction:new()
    local call = 0

    local updateProcessor = PlayerProcessingConfigs:new()
    local validationProcessor = PlayerProcessingConfigs:new()

    updateProcessor.update = function()
        call = call + 1
    end

    validationProcessor.validate = function()
        call = call + 1
    end

    interaction:addCompletionUpdateProcessor(updateProcessor)
    interaction:addCompletionValidationProcessor(validationProcessor)

    interaction:runOnCompletePlayerProcessors(player)

    lu.assertEquals(call, 2)
end

function test_NpcInteraction_GetValidNpcInteractionForMessage()
    local player = FakePlayer:new()
    local npc = {}
    function npc:isPlayerInteractingOnTopic(player, topic)
        return topic == 1
    end

    local interaction = NpcInteraction:new({"parent"}, {}, {current = 1})
    local subInteraction = NpcInteraction:new({"child"}, {}, {current = 2, previous = 1})
    local subInteraction2 = NpcInteraction:new({"another"}, {}, {current = 1, previous = 3})
    local subInteraction3 = NpcInteraction:new({"empty"})

    interaction:addSubInteraction(subInteraction):addSubInteraction(subInteraction2):addSubInteraction(subInteraction3)

    lu.assertEquals(interaction:getValidNpcInteractionForMessage("has parent", npc, player), interaction)
    lu.assertEquals(interaction:getValidNpcInteractionForMessage("has child", npc, player), subInteraction)

    lu.assertEquals(interaction:getValidNpcInteractionForMessage("has another", npc, player), nil)
    lu.assertEquals(interaction:getValidNpcInteractionForMessage("has empty", npc, player), nil)
end

function test_NpcInteraction_IsValidSubInteraction()
    lu.assertIsTrue(NpcInteraction:isValidSubInteraction(NpcInteraction:new()))
    lu.assertErrorMsgContains(
            'Invalid argument: subInteraction needs to be of type NpcInteraction',
            function () NpcInteraction:isValidSubInteraction({}) end
    )
end

function test_NpcInteraction_IsValidProcessor()
    lu.assertIsTrue(NpcInteraction:isValidProcessor(PlayerProcessingConfigs:new()))
    lu.assertErrorMsgContains(
            'Invalid argument: processor needs to be of type PlayerProcessingConfigs',
            function () NpcInteraction:isValidProcessor({}) end
    )
end
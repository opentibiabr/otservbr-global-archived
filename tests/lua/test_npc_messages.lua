lu = require('luaunit')

function test_NpcMessages_EmptyConstructor()
    local expectedMessages = {
        greetMessage = "",
        farewellMessage = "",
        confirmedMessage = "",
        declinedMessage = "",
        deniedMessage = "",
    }

    local messages = NpcMessages:new()

    lu.assertMessages(messages, expectedMessages)
    lu.assertIsTrue(getmetatable(messages) == NpcMessages)
end

function test_NpcMessages_ConstructorWithParameters()
    local expectedMessages = {
        greetMessage = "Hello moto!",
        farewellMessage = "Bye, bastard!",
        confirmedMessage = "Hmm, you were wise in confirm!",
        declinedMessage = "Fuck you.",
        deniedMessage = "You're joking, ehn?",
    }

    local messages = NpcMessages:new(expectedMessages)

    lu.assertMessages(messages, expectedMessages)
    lu.assertIsTrue(getmetatable(messages) == NpcMessages)
end
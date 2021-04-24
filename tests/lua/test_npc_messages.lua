lu = require('luaunit')

function test_NpcMessages_EmptyConstructor()
    local expectedMessages = {
        replyMessage = "",
        confirmedMessage = "Thank you, %s. It was a pleasure doing business with you.",
        declinedMessage = "Then not.",
        deniedMessage = "I'm sorry %s, I can't do that.",
    }

    local messages = NpcMessages:new()

    lu.assertMessages(messages, expectedMessages)
    lu.assertIsTrue(getmetatable(messages) == NpcMessages)
end

function test_NpcMessages_ConstructorWithParameters()
    local expectedMessages = {
        replyMessage = "Fuck you man!",
        confirmedMessage = "Hmm, you were wise in confirm!",
        declinedMessage = "You Bastard..",
        deniedMessage = "You're joking, ehn?",
    }

    local messages = NpcMessages:new(expectedMessages)

    lu.assertMessages(messages, expectedMessages)
    lu.assertIsTrue(getmetatable(messages) == NpcMessages)
end
lu = require('luaunit')

function lu.assertMessages(actual, expected)
    lu.assertEquals(actual.greetMessage, expected.greetMessage)
    lu.assertEquals(actual.farewellMessage, expected.farewellMessage)
    lu.assertEquals(actual.confirmedMessage, expected.confirmedMessage)
    lu.assertEquals(actual.declinedMessage, expected.declinedMessage)
    lu.assertEquals(actual.deniedMessage, expected.deniedMessage)
end

function lu.assertTopic(actual, expected)
    lu.assertEquals(actual.current, expected.current)
    lu.assertEquals(actual.previous, expected.previous)
end
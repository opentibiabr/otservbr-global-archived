lu = require('luaunit')

function testConstructWithNilPlayerThrows()
    lu.assertErrorMsgContains(
        'PlayerValidator needs a valid player to instantiate',
        function () PlayerValidator:new() end
    )
end

function testConstructWithInvalidPlayerThrows()
    lu.assertErrorMsgContains(
        'attempt to call method \'isPlayer\' (a nil value)',
        function () PlayerValidator:new({}) end
    )
end

function testDefaultConstructorValues()
    local player = FakePlayer:new()
    local validator = PlayerValidator:new(player)
    lu.assertIsNil(validator.position)
    lu.assertEquals(validator.player, player)
    lu.assertEquals(validator.moneyAmount, 0)
    lu.assertEquals(validator.storages, {})
    lu.assertEquals(validator.items, {})
    lu.assertEquals(validator.callbacks, {})
    lu.assertEquals(validator.valid, true)
end

function testEmptyExecuteReturnTrue()
    local player = FakePlayer:new()
    local validator = PlayerValidator:new(player)
    lu.assertIsTrue(validator:execute())
end
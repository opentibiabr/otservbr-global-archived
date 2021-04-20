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

function testValidateMoney()
    local player = FakePlayer:new({totalMoney = 12})
    local validator = PlayerValidator:new(player)

    validator:validateMoney()
    lu.assertIsTrue(validator.valid)

    validator:addAmount(11)
    validator:validateMoney()
    lu.assertIsTrue(validator.valid)

    validator:addAmount(1)
    validator:validateMoney()
    lu.assertIsTrue(validator.valid)

    validator:addAmount(1)
    validator:validateMoney()
    lu.assertIsFalse(validator.valid)
    validator.valid = true

    validator:addAmount(120)
    validator:validateMoney()
    lu.assertIsFalse(validator.valid)
    validator.valid = true

    validator:addAmount(-1305)
    validator:validateMoney()
    lu.assertIsTrue(validator.valid)
end

function testValidatePosition()
    local player = FakePlayer:new({position = 123})
    local validator = PlayerValidator:new(player):addPosition(123)

    validator:validatePosition()
    lu.assertIsTrue(validator.valid)

    validator:addPosition(321)
    validator:validatePosition()
    lu.assertIsFalse(validator.valid)
end

function testValidateItems()
    local player = FakePlayer:new({itemCount = { [2173] = 1, [1732] = 9}})
    local validator = PlayerValidator:new(player)
                        :addItem(2173, 1)
                        :addItem(1732, 8)

    validator:validatePosition()
    lu.assertIsTrue(validator.valid)

    validator:addPosition(321)
    validator:validatePosition()
    lu.assertIsFalse(validator.valid)
end
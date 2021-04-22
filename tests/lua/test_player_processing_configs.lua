lu = require('luaunit')

function testNewPlayerProcessingConfigs()
    local processor = PlayerProcessingConfigs:new()
    lu.assertIsNil(processor.position)
    lu.assertEquals(processor.moneyAmount, nil)
    lu.assertEquals(processor.storages, {})
    lu.assertEquals(processor.items, {})
    lu.assertEquals(processor.callbacks, {})
end

function testAddStorage()
    local processor = PlayerProcessingConfigs:new({}):addStorage(5055, 2)
    lu.assertEquals(processor.storages[5055], 2)

    processor:addStorage(5054, 23)
    lu.assertEquals(processor.storages[5054], 23)

    processor:addStorage(5055, 1)
    lu.assertEquals(processor.storages[5055], 1)
end

function testAddAmount()
    local processor = PlayerProcessingConfigs:new({}):addAmount(123)
    lu.assertEquals(processor.moneyAmount, 123)

    processor:addAmount(123)
    lu.assertEquals(processor.moneyAmount, 246)

    processor:addAmount(-246)
    lu.assertEquals(processor.moneyAmount, 0)

    processor:addAmount(0)
    lu.assertEquals(processor.moneyAmount, 0)
end

function testAddItem()
    local processor = PlayerProcessingConfigs:new({}):addItem(2172, 11)
    lu.assertEquals(processor.items[2172], 11)

    processor:addItem(2132, 1)
    lu.assertEquals(processor.items[2132], 1)

    processor:addItem(2132, 2)
    lu.assertEquals(processor.items[2132], 2)
end

function testAddPosition()
    local processor = PlayerProcessingConfigs:new({}):addPosition({x = 1, y = 2, z = 3})
    lu.assertEquals(processor.position, {x = 1, y = 2, z = 3})

    processor:addPosition({x = 3, y = 2, z = 3})
    lu.assertEquals(processor.position, {x = 3, y = 2, z = 3})
end

function testAddCallback()
    local cb = function () return "test" end
    local processor = PlayerProcessingConfigs:new({}):addCallback(cb)
    lu.assertEquals(processor.callbacks[1], cb)

    cb = function () return "test_2" end
    processor:addCallback(cb)
    lu.assertEquals(processor.callbacks[2], cb)

    lu.assertEquals(processor.callbacks[1](), "test")
    lu.assertEquals(processor.callbacks[2](), "test_2")
end

function testProcessingValidation()
    local processor = PlayerProcessingConfigs:new()
                         :addAmount(10)
                         :addPosition(123)
                         :addStorage(2173, 1)
                         :addItem(2173, 1)
                         :addCallback(function () return true end)

    local validPlayer = FakePlayer:new({
        storageValue = { [2173] = 1 },
        itemCount = { [2173] = 1 },
        position = 123,
        totalMoney = 11
    })

    lu.assertIsTrue(processor:validate(validPlayer))

    local invalidPlayer = FakePlayer:new({
        storageValue = { [2173] = 0 },
        itemCount = { [2173] = 0 },
        position = 125,
        totalMoney = 10
    })
    lu.assertIsFalse(processor:validate(invalidPlayer))
end
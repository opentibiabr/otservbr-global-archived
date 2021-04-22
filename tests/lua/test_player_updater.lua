lu = require('luaunit')

function testUpdaterConstructWithNilPlayerThrows()
    lu.assertErrorMsgContains(
        'PlayerUpdater needs a valid player to run',
        function () PlayerUpdater(self, nil) end
    )
end

function testUpdaterConstructWithInvalidPlayerThrows()
    lu.assertErrorMsgContains(
        'attempt to call method \'isPlayer\' (a nil value)',
        function () PlayerUpdater(self, {}) end
    )
end

function testEmptyUpdaterDoesNothing()
    local player = FakePlayer:new()
    local mutatedPlayer = player
    PlayerUpdater(PlayerProcessingConfigs:new(), mutatedPlayer)
    lu.assertEquals(player, mutatedPlayer)
end

function testUpdateMoney()
    local player = FakePlayer:new()

    PlayerUpdater(
        PlayerProcessingConfigs:new():addAmount(10),
        player
    )
    lu.assertEquals(player.totalMoney, 10)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addAmount(-10),
        player
    )
    lu.assertEquals(player.totalMoney, 0)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addAmount(-10),
        player
    )
    lu.assertEquals(player.totalMoney, -10)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addAmount(200),
        player
    )
    lu.assertEquals(player.totalMoney, 190)
end

function testUpdatePosition()
    local player = FakePlayer:new()

    PlayerUpdater(
        PlayerProcessingConfigs:new():addPosition(123),
        player
    )
    lu.assertEquals(player.position, 123)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addPosition(0),
        player
    )
    lu.assertEquals(player.position, 0)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addPosition(256),
        player
    )
    lu.assertEquals(player.position, 256)
end

function testUpdateItems()
    local player = FakePlayer:new()

    PlayerUpdater(
        PlayerProcessingConfigs:new():addItem(2173, 1),
        player
    )
    lu.assertEquals(player.itemCount[2173], 1)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addItem(2173, 1),
        player
    )
    lu.assertEquals(player.itemCount[2173], 2)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addItem(2172, 1),
        player
    )
    lu.assertEquals(player.itemCount[2172], 1)
    lu.assertEquals(player.itemCount[2173], 2)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addItem(2173, -5),
        player
    )
    lu.assertEquals(player.itemCount[2172], 1)
    lu.assertEquals(player.itemCount[2173], -3)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addItem(2172, -1),
        player
    )
    lu.assertEquals(player.itemCount[2172], 0)
    lu.assertEquals(player.itemCount[2173], -3)
end

function testUpdateStorages()
    local player = FakePlayer:new()

    PlayerUpdater(
        PlayerProcessingConfigs:new():addStorage(2173, 1),
        player
    )
    lu.assertEquals(player.storageValue[2173], 1)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addStorage(2173, 5),
        player
    )
    lu.assertEquals(player.storageValue[2173], 5)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addStorage(2172, -1),
        player
    )
    lu.assertEquals(player.storageValue[2172], -1)
    lu.assertEquals(player.storageValue[2173], 5)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addStorage(2172, 2),
        player
    )
    lu.assertEquals(player.storageValue[2172], 2)
    lu.assertEquals(player.storageValue[2173], 5)
end

function testUpdateCallbacks()
    local player = FakePlayer:new()

    PlayerUpdater(
        PlayerProcessingConfigs:new():addCallback(
            function(_player) _player:addMoney(100)  end
        ),
        player
    )
    lu.assertEquals(player.totalMoney, 100)

    PlayerUpdater(
        PlayerProcessingConfigs:new():addCallback(
            function(_player) _player:addMoney(-50)  end
        ),
        player
    )
    lu.assertEquals(player.totalMoney, 50)
end
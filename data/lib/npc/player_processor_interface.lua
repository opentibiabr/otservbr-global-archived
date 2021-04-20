--NpcInteraction = {}
--NpcTopic = {}
--NpcMessages = {}
PlayerProcessorInterface = {}

function PlayerProcessorInterface:new(player)
    obj = {
        player = player,
        moneyAmount = 0,
        storages = {},
        items = {},
        position = nil,
        callbacks = {},
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PlayerProcessorInterface:addStorage(key, value)
    self.storages[key] = value
    return self
end

function PlayerProcessorInterface:addAmount(amount)
    self.moneyAmount = self.moneyAmount + amount
    return self
end

function PlayerProcessorInterface:addItem(itemId, count)
    self.items[itemId] = count
    return self
end

function PlayerProcessorInterface:addPosition(position)
    self.position = position
    return self
end

function PlayerProcessorInterface:addCallback(callback)
    self.callbacks[#self.callbacks + 1] = callback
    return self
end

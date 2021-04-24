PlayerProcessingConfigs = {}

function PlayerProcessingConfigs:new()
    obj = {
        moneyAmount = nil,
        position = nil,
        storages = {},
        items = {},
        callbacks = {},
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PlayerProcessingConfigs:validate(player, actor)
    return PlayerValidator(self, player, actor)
end

function PlayerProcessingConfigs:update(player, actor)
    return PlayerUpdater(self, player, actor)
end

function PlayerProcessingConfigs:addStorage(key, value)
    self.storages[key] = value
    return self
end

function PlayerProcessingConfigs:addAmount(amount)
    self.moneyAmount = (self.moneyAmount or 0) + amount
    return self
end

function PlayerProcessingConfigs:addItem(itemId, count)
    self.items[itemId] = count
    return self
end

function PlayerProcessingConfigs:addPosition(position)
    self.position = position
    return self
end

function PlayerProcessingConfigs:addCallback(callback)
    self.callbacks[#self.callbacks + 1] = callback
    return self
end

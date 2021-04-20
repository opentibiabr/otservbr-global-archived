--NpcInteraction = {}
--NpcTopic = {}
--NpcMessages = {}
PlayerProcessorInterface = {
    player = Player()
}

function PlayerProcessorInterface:new(player)
    obj = {
        player = Player(player),
        moneyAmount = 0,
        storages = {},
        items = {},
        position = nil,
        callbacks = {},
    }

    if not self.player or not self.player:isPlayer() then
        error("PlayerProcessorInterface needs a valid player to instantiate")
    end

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PlayerProcessorInterface:addStorage(key, value)
    self.storages[key] = value
end

function PlayerProcessorInterface:addAmount(amount)
    self.money = self.money + amount
end

function PlayerProcessorInterface:addItem(itemId, count)
    self.items[itemId] = count
end

function PlayerProcessorInterface:addPosition(position)
    self.position = position
end

function PlayerProcessorInterface:addCallback(callback)
    self.callbacks[#self.callbacks + 1] = callback
end

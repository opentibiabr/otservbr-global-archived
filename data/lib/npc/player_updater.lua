PlayerUpdater = {}
setmetatable(PlayerUpdater, {
    __call =
    function(self, configs, player)
        if not player or not player:isPlayer() then
            error("PlayerUpdater needs a valid player to run")
        end

        for i,parse in pairs(self) do
            parse(configs, player)
        end
    end
})

PlayerUpdater.updateMoney = function (configs, player)
    if not configs.moneyAmount then return end
    if configs.moneyAmount < 0 then
        player:removeMoneyIncludingBalance(math.abs(configs.moneyAmount))
    elseif configs.moneyAmount > 0 then
        player:addMoney(configs.moneyAmount)
    end
end

PlayerUpdater.updatePosition = function (configs, player)
    if not configs.position then return end
    player:teleportTo(configs.position)
end

PlayerUpdater.updateItems = function (configs, player)
    for itemId, count in pairs(configs.items) do
        if count < 0 then
            player:removeItem(itemId, math.abs(count))
        elseif count > 0 then
            player:addItem(itemId, count)
        end
    end
end

PlayerUpdater.updateStorages = function (configs, player)
    for storage, value in pairs(configs.storages) do
        player:setStorageValue(storage, value)
    end
end

PlayerUpdater.runUpdateCallbacks = function (configs, player)
    for _, callback in pairs(configs.callbacks) do
        print(player)
        callback(player)
    end
end
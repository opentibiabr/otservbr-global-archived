FakePlayer = {}
function FakePlayer:new(obj)
    obj = obj or {}

    obj.itemCount = obj.itemCount or {}
    obj.storageValue = obj.storageValue or {}

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function FakePlayer:isPlayer()
    return true
end

function FakePlayer:getTotalMoney()
    return self.totalMoney
end

function FakePlayer:getPosition()
    return self.position
end

function FakePlayer:getItemCount(itemId)
    return self.itemCount[itemId]
end

function FakePlayer:getStorageValue(storage)
    return self.storageValue[storage]
end
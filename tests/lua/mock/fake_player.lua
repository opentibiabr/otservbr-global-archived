FakePlayer = {}
function FakePlayer:new()
    obj = {}

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function FakePlayer:isPlayer()
    return true
end
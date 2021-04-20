require "player_processor_interface";

PlayerUpdater = PlayerProcessorInterface:new()
function PlayerUpdater:new(player)
    obj = PlayerProcessorInterface:new(player)

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function PlayerUpdater:updateStorages()

end

function PlayerUpdater:updatePosition()

end

function PlayerUpdater:updateMoney()

end

function PlayerUpdater:updateItems()

end

function PlayerUpdater:runUpdateCallbacks()

end
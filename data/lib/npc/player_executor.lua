require "player_processor_interface";
PlayerExecutor = PlayerProcessorInterface:new()

function PlayerExecutor:new(player)
    obj = PlayerProcessorInterface:new(player)
    setmetatable(obj, self)
    self.__index = self
    return obj
end

NpcConfig = {
    message = nil,
    topic = 0,
    previousTopic = nil,
    greet    = false,
    farewell = false,
    storageChanges = {},
    storageChecks = {},
    callbackFunctions = {},
}

-- Creates a new NpcHandler with an empty callbackFunction stack.
function NpcConfig:new(message, greet, farewell)
    local obj = {}

    obj.message = message
    obj.topic = 0
    obj.previousTopic = nil
    obj.greet = greet or false
    obj.farewell = farewell or false
    obj.storageChanges = {}
    obj.storageChecks = {}
    obj.callbackFunctions = {}

    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NpcConfig:execute(npc, player)
    if not self:shouldAnswerPlayer(npc, player) then
        return false
    end

    npc:talk(player, self:getMessageFromConfig(player))

    for storage,value in pairs(self.storageChanges) do
         player:setStorageValue(storage, value)
    end

    self:updatePlayerInteraction(npc, player)
    return true
end

function NpcConfig:setTopic(topic, previousTopic)
    self.topic = topic or 0
    self.previousTopic = previousTopic or nil
    return self
end

function NpcConfig:addStorageCheck(storage, value)
    self.storageChecks[storage] = value
    return self
end

function NpcConfig:addStorageChange(storage, value)
    self.storageChanges[storage] = value
    return self
end

function NpcConfig:addCallbackFunction(callback)
    self.callbackFunctions[#self.callbackFunctions + 1] = callback
    return self
end

function NpcConfig:shouldAnswerPlayer(npc, player)
    if self.previousTopic and not npc:isPlayerInteractingOnTopic(player, self.previousTopic) then
        return false
    end

    if self.greet then
        return not npc:isInteractingWithPlayer(player)
    end

    for storage,value in pairs(self.storageChecks) do
        if player:getStorageValue(storage) ~= value then return false end
    end

    return npc:isInteractingWithPlayer(player)
end

function NpcConfig:updatePlayerInteraction(npc, player)
    if self.farewell then
        npc:removePlayerInteraction(player)
    else
        npc:setPlayerInteraction(player, self.topic or 0)
    end
end

function NpcConfig:getMessageFromConfig(player)
    if self.message then
        return self.message
    end

    if self.greet then
        return "Hello, ".. player:getName() ..", what you need?"
    elseif self.farewell then
        return "Goodbye, ".. player:getName() .."."
    end

    return "Err.. " .. player:getName() .. ", what did you say?"
end

function NpcConfig:executeCallbacks(npc, player)
end
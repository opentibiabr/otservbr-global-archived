messageTypes = {
    MESSAGE_COMMON = 1
    MESSAGE_GREET = 2,
    MESSAGE_FAREWELL = 3,
}

NpcConfig = {
    message = nil,
    topic = nil,
    previousTopic = nil,
    messageType = nil,
    storageChanges = {},
    storageChecks = {},
    teleport = {},
    callbackFunctions = {},
}

-- Creates a new NpcConfig with message and type (defaults to MESSAGE_COMMON)
function NpcConfig:new(message, messageType)
    local obj = {}

    obj.message = message
    obj.topic = 0
    obj.previousTopic = nil
    obj.messageType = messageType or messageTypes.MESSAGE_COMMON
    obj.storageChanges = {}
    obj.storageChecks = {}
    obj.teleport = nil
    obj.callbackFunctions = {}

    setmetatable(obj, self)
    self.__index = self
    return obj
end

-- Executes a configuration, running all validations and actions configured
function NpcConfig:execute(npc, player)
    if not self:shouldAnswerPlayer(npc, player) then
        return false
    end

    npc:talk(player, self:getMessageFromConfig(player))

    self:performTeleport(player)
    self:updatePlayerStorages(player)
    self:updatePlayerInteraction(npc, player)

    return true
end

-- Define to what topic the player goes after a valid interaction (default 0)
-- and what previousTopic should the player be at to process the message (default nil)
function NpcConfig:setTopic(topic, previousTopic)
    self.topic = topic or 0
    self.previousTopic = previousTopic or nil
    return self
end

-- Add storage values <key, value> to be checked (only interacts if all are correct)
function NpcConfig:addStorageCheck(storage, value)
    self.storageChecks[storage] = value
    return self
end

-- Add storage values <key, value> to be set after a valid interaction
function NpcConfig:addStorageChange(storage, value)
    self.storageChanges[storage] = value
    return self
end

-- Add a teleport configuration to where the player will be send after a valid interaction
-- Accepts custom departureEffect (defaults to CONST_ME_TELEPORT)
-- Accepts custom destinationEffect (defaults to departureEffect or CONST_ME_TELEPORT)
function NpcConfig:setTeleportConfig(position, departureEffect, destinationEffect)
    self.teleport = {
        ["position"] = position,
        ["departureEffect"] = departureEffect or CONST_ME_TELEPORT,
        ["destinationEffect"] = departureEffect or departureEffect or CONST_ME_TELEPORT,
    }
    return self
end

-- Add a custom function to be executed in the end of a valid interaction
function NpcConfig:addCallbackFunction(callback)
    self.callbackFunctions[#self.callbackFunctions + 1] = callback
    return self
end

-- Perform all the validations to proceed with the current interaction
function NpcConfig:shouldAnswerPlayer(npc, player)
    if self.previousTopic and not npc:isPlayerInteractingOnTopic(player, self.previousTopic) then
        return false
    end

    if not self:hasValidPlayerInteraction(player) then return false end
    if not self:hasPlayerValidStorages(player) then return false  end

    return true
end

function NpcConfig:getMessageFromConfig(player)
    if self.message then
        return self.message
    end

    if self.messageType == messageTypes.MESSAGE_GREET then
        return "Hello, ".. player:getName() ..", what you need?"
    if self.messageType == messageTypes.MESSAGE_FAREWELL then
        return "Goodbye, ".. player:getName() .."."
    end

    return "Err.. " .. player:getName() .. ", how can I help?!"
end

-- VALIDATIONS
-- Check if player can interact with the NpcConfig
-- Greet only happens if no interaction is set, all other messages need an ongoing interaction
function NpcConfig:hasValidPlayerInteraction(player)
    if self.messageType == messageTypes.MESSAGE_GREET then
        return not npc:isInteractingWithPlayer(player)
    end
    return npc:isInteractingWithPlayer(player)
end

-- Perform all configured storage checks
function NpcConfig:hasPlayerValidStorages(player)
    for storage,value in pairs(self.storageChecks) do
        if player:getStorageValue(storage) ~= value then return false end
    end
    return true
end

-- EXECUTIONS
-- Set player interaction in the configured topic
-- Greet sets to 0 (begin) and Farewell removes interaction
function NpcConfig:updatePlayerInteraction(npc, player)
    if self.messageType == messageTypes.MESSAGE_FAREWELL then
        npc:removePlayerInteraction(player)
    elseif self.messageType == messageTypes.MESSAGE_GREET then
        npc:setPlayerInteraction(player, 0)
    elseif self.topic then
        npc:setPlayerInteraction(player, self.topic)
    end
end

-- Executes all configured storage updates
function NpcConfig:updatePlayerStorages(player)
    for storage,value in pairs(self.storageChanges) do
        player:setStorageValue(storage, value)
    end
end

-- Executes configured teleport
function NpcConfig:performTeleport(player)
    if self.teleport then
        destination = self.teleport.position

        player:getPosition():sendMagicEffect(self.teleport.departureEffect)
        player:teleportTo(destination)
        destination:sendMagicEffect(self.teleport.destinationEffect)
    end
end

-- Executes configured callbacks
function NpcConfig:executeCallbacks(npc, player)
end
-- Available message types
messageTypes = {
    MESSAGE_COMMON = 1,
    MESSAGE_GREET = 2,
    MESSAGE_FAREWELL = 3
}

-- Every interaction of an NPC can be structured like that
NpcInteraction = {
    keys = nil,
    message = nil,
    topic = nil,
    previousTopic = nil,
    messageType = nil,
    storageChanges = nil,
    storageChecks = nil,
    teleport = nil,
    subInteractions = nil,
    callbackFunctions = nil,
}

-- Creates a new NpcInteraction with message and type (defaults to MESSAGE_COMMON)
function NpcInteraction:new(keys, message, messageType)
    local obj = {}

    obj.keys = keys or {}
    obj.message = message
    obj.messageType = messageType or messageTypes.MESSAGE_COMMON
    obj.topic = 0
    obj.previousTopic = nil
    obj.teleport = nil
    obj.subInteractions = {}
    obj.storageChanges = {}
    obj.storageChecks = {}
    obj.callbackFunctions = {}

    setmetatable(obj, self)
    self.__index = self
    return obj
end

-- Executes a configuration, running all validations and actions configured
function NpcInteraction:execute(npc, player)
    if not self:shouldAnswerPlayer(npc, player) then
        return false
    end

    npc:talk(player, self.message)

    self:performTeleport(npc, player)
    self:updatePlayerStorages(player)
    self:updatePlayerInteraction(npc, player)

    return true
end

-- Check if key is valid
function NpcInteraction:getValidInteraction(npc, player, message)
    for _,keyword in pairs(self.keys) do
        if msgContains(message, keyword) then return self end
    end

    for _,subInteraction in pairs(self.subInteractions) do
        local validSubInteraction = subInteraction:getValidInteraction(npc, player, message)
        if validSubInteraction and self.topic and npc:isPlayerInteractingOnTopic(player, self.topic) then
            return validSubInteraction
        end
    end

    return false
end

-- Define to what topic the player goes after a valid interaction (default 0)
-- and what previousTopic should the player be at to process the message (default nil)
function NpcInteraction:setTopic(topic, previousTopic)
    self.topic = topic or 0
    self.previousTopic = previousTopic or nil
    return self
end

-- Add storage values <key, value> to be checked (only interacts if all are correct)
function NpcInteraction:addStorageCheck(storage, value)
    self.storageChecks[storage] = value
    return self
end

-- Add storage values <key, value> to be set after a valid interaction
function NpcInteraction:addStorageChange(storage, value)
    self.storageChanges[storage] = value
    return self
end

-- Add a teleport configuration to where the player will be send after a valid interaction
-- Accepts custom departureEffect (defaults to CONST_ME_TELEPORT)
-- Accepts custom destinationEffect (defaults to departureEffect or CONST_ME_TELEPORT)
function NpcInteraction:setTeleportConfig(position, cost, departureEffect, destinationEffect)
    self.teleport = {
        ["position"] = position,
        ["cost"] = cost or nil,
        ["departureEffect"] = departureEffect or CONST_ME_TELEPORT,
        ["destinationEffect"] = departureEffect or departureEffect or CONST_ME_TELEPORT,
    }
    return self
end

-- Add a sub interaction that can be executed
function NpcInteraction:addSubInteraction(interaction)
    if not interaction then return self end
    self.subInteractions[#self.subInteractions + 1] = interaction
    return self
end

-- Add a custom function to be executed in the end of a valid interaction
function NpcInteraction:addCallbackFunction(callback)
    self.callbackFunctions[#self.callbackFunctions + 1] = callback
    return self
end

-- Perform all the validations to proceed with the current interaction
function NpcInteraction:shouldAnswerPlayer(npc, player)
    if self.previousTopic and not npc:isPlayerInteractingOnTopic(player, self.previousTopic) then
        return false
    end

    if not self:hasValidPlayerInteraction(npc, player) then return false end
    if not self:hasPlayerValidStorages(player) then return false  end

    return true
end

function NpcInteraction:newDefaultByType(player, messageType)
    if messageType == messageTypes.MESSAGE_GREET then
        return NpcInteraction:new(
            {"hi", "hello"},
            "Hello, ".. player:getName() ..", what you need?",
            messageType
        )
    end

    if messageType == messageTypes.MESSAGE_FAREWELL then
        return NpcInteraction:new(
            {"bye", "farewell"},
            "Goodbye, ".. player:getName() ..".",
            messageType
        )
    end

    return NpcInteraction:new(
        {},
        "Sorry " .. player:getName() .. ", I didn't understand"
    )
end

-- VALIDATIONS
-- Check if player can interact with the NpcInteraction
-- Greet only happens if no interaction is set, all other messages need an ongoing interaction
function NpcInteraction:hasValidPlayerInteraction(npc, player)
    if self.messageType == messageTypes.MESSAGE_GREET then
        return not npc:isInteractingWithPlayer(player)
    end

    return npc:isInteractingWithPlayer(player)
end

-- Perform all configured storage checks
function NpcInteraction:hasPlayerValidStorages(player)
    for storage,value in pairs(self.storageChecks) do
        if player:getStorageValue(storage) ~= value then return false end
    end
    return true
end

-- EXECUTIONS
-- Set player interaction in the configured topic
-- Greet sets to 0 (begin) and Farewell removes interaction
function NpcInteraction:updatePlayerInteraction(npc, player)
    if self.messageType == messageTypes.MESSAGE_FAREWELL then
        npc:removePlayerInteraction(player)
    elseif self.messageType == messageTypes.MESSAGE_GREET then
        npc:setPlayerInteraction(player, 0)
    elseif self.topic then
        npc:setPlayerInteraction(player, self.topic)
    end
end

-- Executes all configured storage updates
function NpcInteraction:updatePlayerStorages(player)
    for storage,value in pairs(self.storageChanges) do
        player:setStorageValue(storage, value)
    end
end

-- Executes configured teleport
function NpcInteraction:performTeleport(npc, player)
    if self.teleport then
        if self.teleport.cost and not self:chargePlayer(npc, player, self.teleport.cost) then return end

        destination = self.teleport.position

        player:getPosition():sendMagicEffect(self.teleport.departureEffect)
        player:teleportTo(destination)
        destination:sendMagicEffect(self.teleport.destinationEffect)

        -- resets iteraction, needs to be addEvent to go in the end of the callstack
        addEvent(function() npc:removePlayerInteraction(player) end, 0)
    end
end

-- Executes configured callbacks
function NpcInteraction:executeCallbacks(npc, player)
end

function NpcInteraction:chargePlayer(npc, player, cost)
    npc:talk(player, "You do not have enough money!")
    if not player:removeMoneyNpc(cost) then
        npc:talk(player, "You do not have enough money!")
        return false
    end
    return true
end
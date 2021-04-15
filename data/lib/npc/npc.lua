local GREET_KEYWORD = "hi"
local FAREWELL_KEYWORD = "bye"

-- Checks whether a message is being sent to npc
-- msgContains(message, keyword)
function msgContains(message, keyword)
	local message, keyword = message:lower(), keyword:lower()
	if message == keyword then
		return true
	end

	return message:find(keyword) and not message:find('(%w+)' .. keyword)
end

-- Npc talk
-- npc:talk({text, text2}) or npc:talk(text)
function Npc:talk(creature, text)
	if type(text) == "table" then
		for i = 0, #text do
			self:sendMessage(creature, text[i])
		end
	else
		self:sendMessage(creature, text)
	end
end

-- Npc send message to player
-- npc:sendMessage(text)
function Npc:sendMessage(creature, text)
	return self:say(text, TALKTYPE_PRIVATE_NP, true, creature)
end

function Npc:processOnSay(message, player, configs)
    if not player then
        return false
    end

    if not self:isInTalkRange(player:getPosition() then
        return false
    end

    for keyword, config in pairs(configs) do
        if msgContains(message, keyword) then
            if not self:shouldAnswerPlayer(player, config) then
                return false
            end

            self:talk(player, self:getMessageFromConfig(player, config))

            for storage,value in pairs(config.storages or {}) do
                 player:setStorageValue(storage, value)
            end

            self:updatePlayerInteraction(player, config)
            return true
        end
    end

    return true
end

function Npc:shouldAnswerPlayer(player, config)
    if config.previousTopic and not self:isPlayerInteractingOnTopic(player, config.previousTopic) then
        return false
    end

    return config.greet or self:isInteractingWithPlayer(player)
end

function Npc:updatePlayerInteraction(player, config)
    if config.farewell then
        self:removePlayerInteraction(player)
    else
        npc:setPlayerInteraction(player, config.topic or 0)
    end
end

function Npc:getMessageFromConfig(player, config)
    if config.message then
        return config.message
    end

    if config.greet then
        return "Hello, ".. player:getName() ..", what you need?"
    elseif config.farewell then
        return "Goodbye, ".. player:getName() .."."
    end

    return "Err.. " .. player:getName() .. ", what did you say?"
end

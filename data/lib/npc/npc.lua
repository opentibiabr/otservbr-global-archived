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

-- Npc send greetings message
function Npc:greet(creature, text)
    self:setPlayerInteraction(creature)
    if text then
        self:sendMessage(creature, text)
    else
        self:sendMessage(creature, "Hello, ".. creature:getName() ..", what you need?")
    end
end

-- Npc send farewell message
function Npc:farewell(creature, text)
	self:removePlayerInteraction(creature)
    if text then
        self:sendMessage(creature, text)
    else
        self:sendMessage(creature, "Goodbye, ".. creature:getName() ..".")
    end
end

function Npc:processOnSay(message, player, configs)
    if not player then
        return false
    end

    if not self:isInTalkRange(player:getPosition() then
        return true
    end

    if msgContains(message, GREET_KEYWORD) and not self:isInteractingWithPlayer() then
        self:greet(player, configs[GREET_KEYWORD].message)
        return true
    end

    if not self:isInteractingWithPlayer(player) then
        return true
    end

    if msgContains(message, FAREWELL_KEYWORD) then
        self:farewell(player, configs[FAREWELL_KEYWORD].message)
        return true
    end

    for keyword, config in pairs(configs) do
        if config.previousTopic and not self:isPlayerInteractingOnTopic(player, config.previousTopic) then
            return false
        end

        if msgContains(message, keyword) then
            self:talk(player, config.message)
            return true
        end

        for storage,value in pairs(config.storages or {}) do
             player:setStorageValue(storage, value)
        end

        npc:setPlayerInteraction(player, config.topic or 0)
    end

    return false
end

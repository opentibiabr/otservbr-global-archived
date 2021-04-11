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
-- npc:greetMessage(message, creature) = Automatic text
-- npc:greetMessage(message, creature, text) = Define a text
function Npc:greet(message, creature, text)
	if msgContains(message, "hi") and self:isInTalkRange(creature:getPosition()) and not self:isInteractingWithPlayer(creature) then
		self:addPlayerInteraction(creature:getId())
		if text then
			self:sendMessage(creature, text)
		else
			self:sendMessage(creature, "Hello, ".. creature:getName() ..", what you need?")
		end
	end
end

-- Npc send farewell message
-- npc:farewellMessage(message, creature) = Automatic text
-- npc:farewellMessage(message, creature, text) = Define a text
function Npc:unGreet(message, creature, text)
	if msgContains(message, "bye") and self:isInTalkRange(creature:getPosition()) and self:isInteractingWithPlayer(creature) then
		self:removePlayerInteraction(creature:getId())
		if text then
			self:sendMessage(creature, text)
		elseif message == false then
			return true
		else
			self:sendMessage(creature, "Goodbye, ".. creature:getName() ..".")
		end
	end
end

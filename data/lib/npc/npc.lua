local playerFocusNpc = {}

function msgContains(message, keyword)
	local message, keyword = message:lower(), keyword:lower()
	if message == keyword then
		return true
	end

	return message:find(keyword) and not message:find('(%w+)' .. keyword)
end

function addFocus(creature)
	if not table.contains(playerFocusNpc, creature:getId()) then
		table.insert(playerFocusNpc, creature:getId())
		return true
	end
end

function removeFocus(creature)
	if table.contains(playerFocusNpc, creature:getId()) then
		for i = 1, #playerFocusNpc do
			if playerFocusNpc[i] == creature:getId() then
				table.remove(playerFocusNpc, i)
				return true
			end
		end
	end
end

function greetMessage(message, creature)
	if msgContains(message, "hi") and addFocus(creature) then
		return true
	end
end

function farewellMessage(message, creature)
	if msgContains(message, "bye") and removeFocus(creature) then
		return true
	end
end

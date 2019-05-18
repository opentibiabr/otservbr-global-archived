function onSay(player, words, param)
	if player:getAccountType() <= ACCOUNT_TYPE_GOD then
		return true
	end

	local target = Player(param)
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	if target:getAccountType() ~= ACCOUNT_TYPE_SENIORTUTOR then
		player:sendCancelMessage("You can only promote a senior tutor to GM.")
		return false
	end

	target:setAccountType(ACCOUNT_TYPE_GAMEMASTER)
	target:setStorageValue(15956, 1)
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been promoted to a GM by " .. player:getName() .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have promoted " .. target:getName() .. " to a GM.")
	return false
end

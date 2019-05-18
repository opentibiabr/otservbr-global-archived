function onSay(player, words, param)
	if player:getAccountType() <= ACCOUNT_TYPE_TUTOR then
		return true
	end

	local target = Player(param)
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	if target:getAccountType() ~= ACCOUNT_TYPE_TUTOR then
		player:sendCancelMessage("You can only promote a normal tutor to a senior tutor.")
		return false
	end

	target:setAccountType(ACCOUNT_TYPE_SENIORTUTOR)
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been promoted to a senior tutor by " .. player:getName() .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have promoted " .. target:getName() .. " to a senior tutor.")
	return false
end

function onSay(player, words, param)
	if player:getGroup():getAccess() and param ~= "" then
		local split = param:split(",")
		player:teleportTo(Position(split[1], split[2], split[3]))
	else
		local position = player:getPosition()
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your current position is: " .. position.x .. ", " .. position.y .. ", " .. position.z .. ".")
	end
	return false
end

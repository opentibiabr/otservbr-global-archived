local talk = Talkaction("/effect")

function onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local effect = tonumber(param)
	local position = player:getPosition()
	local toPositionLow = {z = position.z}
	local toPositionHigh = {z = position.z}

	toPositionLow.x = position.x - 7
	toPositionHigh.x = position.x + 7
	for i = -5, 5 do
		toPositionLow.y = position.y + i
		toPositionHigh.y = toPositionLow.y
		position:sendDistanceEffect(toPositionLow, effect)
		position:sendDistanceEffect(toPositionHigh, effect)
	end

	toPositionLow.y = position.y - 5
	toPositionHigh.y = position.y + 5
	for i = -6, 6 do
		toPositionLow.x = position.x + i
		toPositionHigh.x = toPositionLow.x
		position:sendDistanceEffect(toPositionLow, effect)
		position:sendDistanceEffect(toPositionHigh, effect)
	end
	return false
end

talk:register()
talk:separator(" ")

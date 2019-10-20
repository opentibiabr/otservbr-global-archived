function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local position = player:getPosition()
	local isGhost = not player:isInGhostMode()

	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are now invisible.")
		position:sendMagicEffect(CONST_ME_YALAHARIGHOST)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are visible again.")
		position.x = position.x + 1
		position:sendMagicEffect(CONST_ME_SMOKE)
	end
	return false
end

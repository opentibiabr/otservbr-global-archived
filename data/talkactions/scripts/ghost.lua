function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
	local position = player:getPosition()
	local isGhost = not player:isInGhostMode()
	
	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are now invisible.")
		position:sendMagicEffect(7)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are visible again.")
		-- position.x = position.x + 1
		position:sendMagicEffect(67)
	end
	return false
end

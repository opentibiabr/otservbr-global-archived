function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if param == '' then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Command param required.")
		return false
	end

	local tile = param:split(",")
	local pos
	if tile[2] and tile[3] then
		pos = Position(tile[1], tile[2], tile[3])
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid param specified.")
		return false
	end

	local tmp = player:getPosition()
	if player:teleportTo(pos) and not player:isInGhostMode() then
		tmp:sendMagicEffect(CONST_ME_POFF)
		pos:sendMagicEffect(CONST_ME_TELEPORT)
	end

	return false
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local position = player:getPosition()
	if position.y == toPosition.y then
		return false
	end

	toPosition.y = position.y > toPosition.y and toPosition.y - 1 or toPosition.y + 1
	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end

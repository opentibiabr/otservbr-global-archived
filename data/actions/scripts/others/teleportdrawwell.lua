function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if item:getActionId() ~= 1000 then
		return false
	end

	fromPosition.z = fromPosition.z + 1
	player:teleportTo(fromPosition)
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end

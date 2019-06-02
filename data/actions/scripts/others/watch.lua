function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The time is " .. getTibianTime() .. ".")
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end

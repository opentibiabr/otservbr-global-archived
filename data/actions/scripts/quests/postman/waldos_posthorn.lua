function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.postman.Mission08) == 1 then
		player:setStorageValue(Storage.postman.Mission08, 2)
		player:addItem(2332, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found Waldo's posthorn.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dead human is empty.')
	end
	return true
end

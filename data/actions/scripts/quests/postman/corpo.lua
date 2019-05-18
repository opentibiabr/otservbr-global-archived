function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if player:getStorageValue(Storage.postman.Mission08) == 1 then
		player:setStorageValue(Storage.postman.Mission08, 2)
		player:addItem(2078, 1)
		else 
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already got the Post Horn.")
	end 	
	
	return true
end

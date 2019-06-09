function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 3084) then
		if(player:getStorageValue(Storage.InServiceofYalahar.MatrixReward) < 1) then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixReward, 1)
			player:addItem(9744, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a matrix.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif(item.uid == 3085) then
		if(player:getStorageValue(Storage.InServiceofYalahar.MatrixReward) < 1) then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixReward, 1)
			player:addItem(9743, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a matrix.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end

local iglue = Action()

function iglue.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Rookgaard.CaptainIglue) < 0 then
		if player:getStorageValue(Storage.Rookgaard.CaptainIglueLeft) < 1 then
			if item.uid == 64117 then
				doSetItemText(doPlayerAddItem(player,2598,1), 'Treasure of Captain Iglue')
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found letter.")
				player:setStorageValue(Storage.Rookgaard.CaptainIglueLeft,1)
				player:setStorageValue(Storage.Rookgaard.CaptainIglue,0)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
			end
		elseif player:getStorageValue(Storage.Rookgaard.CaptainIglueRight) < 1 then
			if item.uid ==64118 then
				player:addItem(2668, 4)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found salmon.")
				player:setStorageValue(Storage.Rookgaard.CaptainIglueRight,1)
				player:setStorageValue(Storage.Rookgaard.CaptainIglue,0)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	
	elseif player:getStorageValue(Storage.Rookgaard.CaptainIglue) == 0 then
		if player:getStorageValue(Storage.Rookgaard.CaptainIglueLeft) < 1 then
			if item.uid == 64117 then
				doSetItemText(doPlayerAddItem(player,2598,1), 'Treasure of Captain Iglue')
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found letter.")
				player:setStorageValue(Storage.Rookgaard.CaptainIglueLeft,1)
				player:setStorageValue(Storage.Rookgaard.CaptainIglue,1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
			end
		elseif player:getStorageValue(Storage.Rookgaard.CaptainIglueRight) < 1 then
			if item.uid ==64118 then
				player:addItem(2668, 4)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found salmon.")
				player:setStorageValue(Storage.Rookgaard.CaptainIglueRight,1)
				player:setStorageValue(Storage.Rookgaard.CaptainIglue,1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	
	return true
end

iglue:uid(64117, 64118)
iglue:register()

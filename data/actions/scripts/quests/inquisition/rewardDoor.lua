function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 9021) then
		if(player:getStorageValue(Storage.TheInquisition.Questline) == 23) then
			return (player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You forgot to ask Henricus for outfit."))
		end
		if(player:getStorageValue(Storage.TheInquisition.Questline) >= 24) then
			if(item.itemid == 5105) then
				player:teleportTo(toPosition, true)
				item:transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end

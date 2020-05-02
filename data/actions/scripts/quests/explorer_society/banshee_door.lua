function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.bansheeDoor) == 1 then
		if item.itemid == 1225 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

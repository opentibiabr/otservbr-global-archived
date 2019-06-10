function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.ExplorerSociety.TheElvenPoetry) == 36 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 36 then
		if item.itemid == 1223 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

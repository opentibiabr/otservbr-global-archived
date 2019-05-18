function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 5114 then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.Kiss) == 1 and player:getStorageValue(Storage.QueenOfBansheesQuest.LastSeal) < 1 then
		player:teleportTo(toPosition, true)
		item:transform(item.itemid + 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The door seems to be sealed against unwanted intruders.')
	end
	return true
end

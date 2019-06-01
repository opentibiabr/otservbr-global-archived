function onUse(cid, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

		fromPosition.z = fromPosition.z - 1
		doTeleportThing(cid, fromPosition, FALSE)
		player:setStorageValue(Storage.Exaust.Time, os.time())
	return TRUE
end
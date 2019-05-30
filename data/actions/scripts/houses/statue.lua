function onUse(cid, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if (item:getId() == 26094) then
		item:transform(26096)
	elseif (item:getId() == 26095) then
		item:transform(26097)
	elseif (item:getId() == 26096) then
		item:transform(26094)
	elseif (item:getId() == 26097) then
		item:transform(26095)
	end
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end
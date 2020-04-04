function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35620) then
		if(getPlayerStorageValue(cid, 95592) == 33) and getPlayerStorageValue(cid, 93419) < 1 then
			doPlayerAddItem(cid, 10159, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a bloodkiss flower.")
			setPlayerStorageValue(cid, 93419, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The flower is empty.")
		end
	end
	return true
end
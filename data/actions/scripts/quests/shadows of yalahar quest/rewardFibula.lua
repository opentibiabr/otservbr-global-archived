function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35618) then
		if(getPlayerStorageValue(cid, 95592) == 27) and getPlayerStorageValue(cid, 93416) < 1 then
			doPlayerAddItem(cid, 10157, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a worm queen tooth.")
			setPlayerStorageValue(cid, 93416, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The cheast is empty.")
		end
	end
	return true
end
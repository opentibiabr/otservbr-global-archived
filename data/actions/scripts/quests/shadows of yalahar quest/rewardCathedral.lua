function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35619) then
		if(getPlayerStorageValue(cid, 95592) == 30) and getPlayerStorageValue(cid, 93417) < 1 then
			doPlayerAddItem(cid, 10155, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a shadow orb.")
			setPlayerStorageValue(cid, 93417, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	end
	return true
end
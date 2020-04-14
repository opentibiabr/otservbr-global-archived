function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35591) then
		if(getPlayerStorageValue(cid, 95592) == 7) then
			setPlayerStorageValue(cid, 95592, 8)
			setPlayerStorageValue(cid, 82961, 2) -- quest log
			doPlayerAddItem(cid, 10167, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a mago mechanic core.")
		else
			doPlayerSendTextMessage(cid, 19, "The strange machine is empty.")
		end
	end
	return true
end
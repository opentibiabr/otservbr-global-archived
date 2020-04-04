function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35598) then
		if(getPlayerStorageValue(cid, 95592) == 19) and getPlayerStorageValue(cid, 93415) < 1 then
			doPlayerAddItem(cid, 10170, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a old power core.")
			setPlayerStorageValue(cid, 93415, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The strange machine is empty.")
		end
	end
	return true
end
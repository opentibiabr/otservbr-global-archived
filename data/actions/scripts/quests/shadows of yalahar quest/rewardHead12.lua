function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35607) then
		if(getPlayerStorageValue(cid, 95592) == 39) and getPlayerStorageValue(cid, 99195) < 1 then
			doPlayerAddItem(cid, 10173, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a golem head.")
			setPlayerStorageValue(cid, 99195, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	end
	return true
end
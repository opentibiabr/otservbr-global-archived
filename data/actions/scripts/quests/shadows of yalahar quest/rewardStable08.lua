function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35600) then
		if(getPlayerStorageValue(cid, 95592) == 21) and getPlayerStorageValue(cid, 93410) < 1 then
			doPlayerAddItem(cid, 10166, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a stabilizer.")
			setPlayerStorageValue(cid, 93410, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	end
	return true
end
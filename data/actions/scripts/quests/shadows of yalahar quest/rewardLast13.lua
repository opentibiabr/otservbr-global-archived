function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35612) then
		if(getPlayerStorageValue(cid, 95592) == 44) then
			doPlayerAddItem(cid, 18516, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a golem wrench.")
			setPlayerStorageValue(cid, 95592, 45)
		else
			doPlayerSendTextMessage(cid, 19, "The chest is empty.")
		end
	end
	return true
end
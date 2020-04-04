function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35596) then
		if(getPlayerStorageValue(cid, 95592) == 17) and getPlayerStorageValue(cid, 93418) < 1 then
			doPlayerAddItem(cid, 10165, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a golem blueprint.")
			setPlayerStorageValue(cid, 93418, 1)
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	end
	return true
end
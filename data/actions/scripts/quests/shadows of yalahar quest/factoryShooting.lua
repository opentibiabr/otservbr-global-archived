function onUse(cid, item, fromPosition, itemEx, toPosition)
	pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 5, z = 11}
	if(item.itemid == 2581) then
		if(getPlayerStorageValue(cid, 95592) == 6) then
			if(getTileItemById(pos, 10059).uid > 0) then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Hit!")
				doSendMagicEffect(pos, CONST_ME_FIREATTACK)
				setPlayerStorageValue(cid, 95592, 7)
				for i = 2, 4 do
					effectPos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - i, z = 11}
					doSendMagicEffect(effectPos, CONST_ME_TELEPORT)
				end	
			end
		end	
	end
	return true
end
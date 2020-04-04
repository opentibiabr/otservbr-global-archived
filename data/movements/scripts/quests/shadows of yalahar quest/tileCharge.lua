function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 35594) then
		if(getPlayerStorageValue(cid, 95592) == 14) then
			setPlayerStorageValue(cid, 95592, 15)
			doCreatureSay(cid, "You have gained a charge!", TALKTYPE_ORANGE_1)
			doSendMagicEffect(getCreaturePosition(cid), 48)
		end
	end
	return true
end
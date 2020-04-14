function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 35605) then
		if(getPlayerStorageValue(cid, 95592) == 36) then
			setPlayerStorageValue(cid, 95592, 37)
			doCreatureSay(cid, "You are showered by strange energy!", TALKTYPE_ORANGE_1)
			doSendMagicEffect({x = 32879, y = 31290, z = 11}, 48)
			doSendMagicEffect({x = 32879, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32880, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32881, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32881, y = 31290, z = 11}, 48)
			doSendMagicEffect({x = 32880, y = 31290, z = 11}, 48)
		end
	end
	return true
end
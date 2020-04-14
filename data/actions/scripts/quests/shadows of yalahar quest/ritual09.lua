function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.actionid == 59530 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91325) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91325, 1)
		end
	end

	elseif item.actionid == 59531 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91326) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91326, 1)
		end
	end

	elseif item.actionid == 59532 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91327) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91327, 1)
		end
	end

	elseif item.actionid == 59533 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91328) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91328, 1)
		end
	end

	elseif item.actionid == 59534 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91329) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91329, 1)
		end
	end

	elseif item.actionid == 59535 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91330) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91330, 1)
		end
	end

	elseif item.actionid == 59536 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91331) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91331, 1)
		end
	end

	elseif item.actionid == 59537 then 	
		if(item.itemid == 10111) then	
			if(getPlayerStorageValue(cid, 95592) == 23) and getPlayerStorageValue(cid, 91332) < 1 then						
			doCreatureSay(cid, "You learned something about the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95595, getPlayerStorageValue(cid, 95595) + 1)
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
			setPlayerStorageValue(cid, 91332, 1)
		end
	end


	elseif item.actionid == 59538 then 	
		if(item.itemid == 10110) then	
			if(getPlayerStorageValue(cid, 95595) == 7) and getPlayerStorageValue(cid, 91333) < 1 then						
			doCreatureSay(cid, "You have written down the ritual.", TALKTYPE_ORANGE_1)					
			doSendMagicEffect(getCreaturePosition(cid), 28)
			setPlayerStorageValue(cid, 95592, 24)
			setPlayerStorageValue(cid, 91333, 1) -- storage for exaust time
			setPlayerStorageValue(cid, 82968, getPlayerStorageValue(cid, 82968) + 1) -- quest log
		end
	end



	

		end
	return true
end

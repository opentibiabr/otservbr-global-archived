function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 4670 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission23) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24a) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission24a, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			item:remove(1)
		end
	elseif target.actionid == 4671 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission23) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24b) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission24b, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			item:remove(1)
		end
	elseif target.actionid == 4672 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission23) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24c) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission24c, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			item:remove(1)
		end
	elseif target.actionid == 4673 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission23) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24d) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission24d, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			item:remove(1)
		end
	end
	if player:getStorageValue(Storage.GravediggerOfDrefia.Mission24a) == 1
	and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24b) == 1
	and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24c) == 1
	and player:getStorageValue(Storage.GravediggerOfDrefia.Mission24d) == 1 then
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission24e, 1)
	end
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 2367 and player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) < 1 then
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 1)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	elseif item.itemid == 2373 and player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) == 1 then
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 2)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	elseif item.itemid == 2370 and player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) == 2 then
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 3)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	elseif item.itemid == 2372 and player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) == 3 then
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 4)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	elseif item.itemid == 2369 and player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) == 4 then
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 5)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You played them in correct order and got the access through door!")
	elseif item.itemid == 1241 then
		if player:getStorageValue(Storage.TheAncientTombs.VashresamunInstruments) == 5 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You first must play the instruments in correct order to get the access!")
		end
	else
		player:setStorageValue(Storage.TheAncientTombs.VashresamunInstruments, 0)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You played them wrong, now you must begin with first again! ")
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, Player(cid):getPosition(), 0, -20, -20, CONST_ME_GROUNDSHAKER)
	end
	return true
end
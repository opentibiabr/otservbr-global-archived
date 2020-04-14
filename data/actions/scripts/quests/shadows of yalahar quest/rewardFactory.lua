function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35591) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 7) then
			player:addItem(10167, 1)
			player:say("You have found a mago mechanic core.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 8)
			setPlayerStorageValue(cid, 82961, 2) -- quest log
		else
			player:say("The strange machine is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
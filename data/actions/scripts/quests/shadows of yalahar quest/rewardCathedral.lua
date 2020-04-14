function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35619) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 30) and player:getStorageValue(Storage.ShadownofYalahar.rewardCathedral) < 1 then
			player:addItem(10155, 1)
			player:say("You have found a shadow orb.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardCathedral, 1)
		else
			player:say("The box is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
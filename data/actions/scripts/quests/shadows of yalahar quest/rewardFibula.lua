function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35618) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 27) and player:getStorageValue(Storage.ShadownofYalahar.rewardFibula) < 1 then
			player:addItem(10157, 1)
			player:say("You have found a worm queen tooth.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardFibula, 1)
		else
			player:say("The cheast is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
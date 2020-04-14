function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35600) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 21) and player:getStorageValue(Storage.ShadownofYalahar.rewardStable) < 1 then
			player:addItem(10166, 1)
			player:say("You have found a stabilizer.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardStable, 1)
		else
			player:say("The box is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
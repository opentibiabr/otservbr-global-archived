function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35598) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 19) and player:getStorageValue(Storage.ShadownofYalahar.rewardPower) < 1 then
			player:addItem(10170, 1)
			player:say("You have found a old power core.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardPower, 1)
		else
			player:say("The strange machine is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
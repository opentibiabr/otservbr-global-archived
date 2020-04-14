function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35607) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 39) and player:getStorageValue(Storage.ShadownofYalahar.rewardHead) < 1 then
			player:addItem(10173, 1)
			player:say("You have found a golem head.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardHead, 1)
		else
			player:say("The box is empty.", TALKTYPE_MONSTER_SAY)			
		end
	end
	return true
end
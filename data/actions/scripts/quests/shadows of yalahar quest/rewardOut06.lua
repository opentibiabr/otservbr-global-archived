function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35596) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 17) and player:getStorageValue(Storage.ShadownofYalahar.rewardOut) < 1 then
			player:addItem(10165, 1)
			player:say("You have found a golem blueprint.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardOut, 1)
		else
			player:say("The box is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
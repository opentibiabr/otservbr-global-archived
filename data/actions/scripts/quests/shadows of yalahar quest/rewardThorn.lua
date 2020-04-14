function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35620) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 33) and player:getStorageValue(Storage.ShadownofYalahar.rewardThorn) < 1 then
			player:addItem(10159, 1)
			player:say("You have found a bloodkiss flower.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.rewardThorn, 1)
		else
			player:say("The flower is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
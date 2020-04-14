function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 35612) then
		if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 44) then
			player:addItem(18516, 1)
			player:say("You have found a golem wrench.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.ShadownofYalahar.Questline, 45)
		else
			player:say("The cheast is empty.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
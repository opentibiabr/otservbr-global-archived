function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.FerumbrasAscension.HabitatsAcess) >= 1 then
		return false
	end

	if item.itemid == 10044 then
			player:setStorageValue(Storage.FerumbrasAscension.HabitatsAcess, 1)
		item:transform(10045)
	elseif item.itemid == 10045 then
		item:transform(10044)
end
		return true
	end

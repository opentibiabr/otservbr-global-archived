function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid ~= 12579 then
		return false
	end

	if player:getStorageValue(Storage.secretService.CGBMission03) == 1 then
		player:setStorageValue(Storage.secretService.CGBMission03, 2)
		item:remove()
		Game.createItem(8016, 1, Position(32909, 32112, 7))
		player:say('The bugs are at work!', TALKTYPE_MONSTER_SAY)
	end
	return true
end

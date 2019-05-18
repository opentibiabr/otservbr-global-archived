function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.secretService.AVINMission03) == 1 then
		player:setStorageValue(Storage.secretService.AVINMission03, 2)
		Game.createMonster('amazon', Position(32326, 31803, 8))
		Game.createMonster('amazon', Position(32330, 31803, 8))
	end
	return true
end

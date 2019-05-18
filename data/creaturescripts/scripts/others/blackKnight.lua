function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'black knight' then
		return true
	end

	local player = creature:getPlayer()
	if player:getStorageValue(Storage.secretService.AVINMission04) == 1 then
		player:setStorageValue(Storage.secretService.AVINMission04, 2)
	end

	return true
end

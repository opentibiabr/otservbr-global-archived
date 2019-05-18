function onKill(creature, target)
	local targetMonster = target:getMonster()
	local player = Player(creature)
	if not targetMonster or targetMonster:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.FirstDragon.Start) < 1 then
		return true
	end
	if not targetMonster:getName():lower() == 'dragon' then
		return true
	end
	if player:getExhaustion(Storage.FirstDragon.TazhadurTimer) > 0 then
		return true
	end
	player:setStorageValue(Storage.FirstDragon.DragonCounter, player:getStorageValue(Storage.FirstDragon.DragonCounter) + 1)
	return true
end
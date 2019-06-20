function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if player:getStorageValue(Storage.FirstDragon.Start) < 1 then
		return true
	end
	if player:getStorageValue(Storage.FirstDragon.DragonCounter) < 200 then
		if target:getName():lower() == 'dragon' then
			player:setStorageValue(Storage.FirstDragon.DragonCounter, player:getStorageValue(Storage.FirstDragon.DragonCounter) + 1)
		end
	end
	if player:getExhaustion(Storage.FirstDragon.TazhadurTimer) > 0 then
		return true
	end
	return true
end

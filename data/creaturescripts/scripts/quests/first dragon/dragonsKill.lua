function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	if target:getName():lower() == 'dragon' then
		local storage = player:getStorageValue(Storage.FirstDragon.DragonCounter)
		if storage < 200 and storage >= 0 then
			player:setStorageValue(Storage.FirstDragon.DragonCounter, player:getStorageValue(Storage.FirstDragon.DragonCounter) + 1)
		end
	end
	return true
end

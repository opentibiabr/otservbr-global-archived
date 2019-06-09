function onKill(creature, target)
	if not creature or not creature:isPlayer() then
		return true
	end
	if not target or not target:isMonster() then
		return true
	end

	local fromPos = Position(33768, 32227, 14)
	local toPos = Position(33781, 32249, 14)
	local monsterName = target:getName():lower()

	local stgValue = creature:getStorageValue(Storage.DangerousDepths.Dwarves.LostExiles)
	local stgValue2 = creature:getStorageValue(Storage.DangerousDepths.Dwarves.Organisms)

	if (isInArray({'lost exile'}, monsterName)) then
		if creature:getStorageValue(Storage.DangerousDepths.Dwarves.Home) == 1 then
			if target:getPosition():isInRange(fromPos, toPos) then
				if stgValue < 20 then
					if stgValue < 0 then
						creature:setStorageValue(Storage.DangerousDepths.Dwarves.LostExiles, 1)
					end
					creature:setStorageValue(Storage.DangerousDepths.Dwarves.LostExiles, stgValue + 1)
				end
			end
		end
	elseif (isInArray({'deepworm', 'diremaw'}, monsterName)) then
		if creature:getStorageValue(Storage.DangerousDepths.Dwarves.Subterranean) == 1 then
			if stgValue2 < 50 then
				if stgValue2 < 0 then
					creature:setStorageValue(Storage.DangerousDepths.Dwarves.Organisms, 1)
				end
				creature:setStorageValue(Storage.DangerousDepths.Dwarves.Organisms, stgValue2 + 1)
			end
		end
	elseif (isInArray({'makeshift home'}, monsterName)) then
		local woodenTrash = Game.createItem(7701, 1, target:getPosition())
		woodenTrash:setActionId(57233)
	end

	return true
end

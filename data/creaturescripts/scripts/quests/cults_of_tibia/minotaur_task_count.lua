function onKill(creature, target)
	if not creature or not creature:isPlayer() then
		return true
	end

	if not target or not target:isMonster() then
		return true
	end

	local storage = creature:getStorageValue(Storage.CultsOfTibia.Minotaurs.jamesfrancisTask)
	if(isInArray({'minotaur cult follower', 'minotaur cult zealot', 'minotaur cult prophet'}, target:getName():lower()) and storage >= 0 and storage < 50)then
		creature:setStorageValue(Storage.CultsOfTibia.Minotaurs.jamesfrancisTask, storage + 1)
	end
	return true
end

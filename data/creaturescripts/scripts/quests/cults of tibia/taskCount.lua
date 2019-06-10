function onKill(creature, target)
	if not creature or not creature:isPlayer() then
		return true
	end
	if not target or not target:isMonster() then
		return true
	end
	local cName = target:getName():lower()
	local stgValue = creature:getStorageValue(Storage.CultsOfTibia.Minotaurs.jamesfrancisTask)
	if(isInArray({'minotaur cult follower', 'minotaur cult zealot', 'minotaur cult prophet'}, cName) and stgValue >= 0 and stgValue < 50)then
		creature:setStorageValue(Storage.CultsOfTibia.Minotaurs.jamesfrancisTask, stgValue + 1)
	end
	return true
end

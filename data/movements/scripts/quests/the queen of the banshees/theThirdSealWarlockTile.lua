function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.ThirdSealWarlocks) < 1 then
		player:setStorageValue(Storage.QueenOfBansheesQuest.ThirdSealWarlocks, 1)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
		Game.createMonster('Warlock', Position(32215, 31835, 15), false, true)
		Game.createMonster('Warlock', Position(32215, 31840, 15), false, true)
	end
	return true
end

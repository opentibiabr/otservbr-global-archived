function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.FifthSeal) < 1 then
		player:setStorageValue(Storage.QueenOfBansheesQuest.FifthSeal, 1)
		player:teleportTo(Position(32268, 31856, 15), false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(Position(32185, 31939, 14), false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

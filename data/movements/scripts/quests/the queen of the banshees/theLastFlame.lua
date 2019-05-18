function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:setStorageValue(Storage.QueenOfBansheesQuest.LastSeal, 1)
	player:teleportTo(Position(32269, 31853, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
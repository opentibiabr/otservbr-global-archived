function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	position:sendMagicEffect(CONST_ME_TELEPORT)

	local sacrificeItem, destination = Tile(Position(32816, 31601, 9)):getItemById(2319)
	if not sacrificeItem then
		destination = Position(32818, 31599, 9)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	sacrificeItem:remove()

	if player:getStorageValue(Storage.Dragonfetish) == 1 then
		player:setStorageValue(Storage.Dragonfetish, 0)
	end

	destination = Position(32701, 31639, 6)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

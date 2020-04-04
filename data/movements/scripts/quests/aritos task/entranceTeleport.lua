function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TibiaTales.AritosTask) >= 0 then
		local destinationz = Position(33205, 32530, 8)
		player:teleportTo(destinationz)
		return true
	end
	return true
end

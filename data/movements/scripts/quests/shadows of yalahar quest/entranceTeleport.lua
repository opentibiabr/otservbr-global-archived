function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.ShadownofYalahar.Questline) > 38 then
		local destinationz = Position(32550, 31270, 9)
		player:teleportTo(destinationz)
		return true
	end
	return true
end

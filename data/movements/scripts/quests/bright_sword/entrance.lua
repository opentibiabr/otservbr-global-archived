function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(Position(32619, 32249, 8))
	return true
end

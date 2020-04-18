local config = {
	[2292] = Position(32265, 31895, 12),
	[2293] = Position(32266, 31895, 12),
	[2294] = Position(32267, 31895, 12)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.uid]
	if not targetPosition then
		return true
	end

	player:teleportTo(Position(32266, 31869, 12))
	return true
end

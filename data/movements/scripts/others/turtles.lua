local config = {
	[3206] = Position(32359, 32901, 7),
	[3207] = Position(32340, 32538, 7),
	[3208] = Position(32472, 32869, 7),
	[3209] = Position(32415, 32916, 7),
	[3210] = Position(32490, 32979, 7),
	[3211] = Position(32440, 32971, 7),
	[3212] = Position(32527, 32951, 7),
	[3213] = Position(32523, 32923, 7)
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

	if item.uid == 3206 and player:getStorageValue(Storage.TheShatteredIsles.AccessToLagunaIsland) ~= 1 then
		player:teleportTo(Position(32340, 32540, 7))
		position:sendMagicEffect(CONST_ME_TELEPORT)
		Position(32340, 32540, 7):sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:teleportTo(targetPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

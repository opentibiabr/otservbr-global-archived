local config = {
	[50220] = Position(32943, 31553, 1),
	[50221] = Position(32938, 31573, 0),
	[50222] = Position(32950, 31575, 1),
	[50223] = Position(32961, 31559, 1),
	[50224] = Position(32959, 31540, 4),
	[50225] = Position(32961, 31552, 1),
	[50226] = Position(32951, 31568, 1),
	[50227] = Position(32940, 31577, 0),
	[50228] = Position(32940, 31558, 1),
	[50229] = Position(32951, 31552, 3)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end
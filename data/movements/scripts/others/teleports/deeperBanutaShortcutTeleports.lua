local config = {
	[50084] = Position(32857, 32667, 9),
	[50085] = Position(32892, 32632, 11),
	[50086] = Position(32886, 32632, 11)
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

	if player:getStorageValue(Storage.DeeperBanutaShortcut) < 100 then
		player:teleportTo(targetPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

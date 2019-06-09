function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(Storage.FerumbrasAscension.TheShatterer) >= 1 then
		player:teleportTo(Position(33436, 32443, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(Position(33397, 32460, 13))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendCancelMessage('You cannot use this teleport before kill the chained.')
	end
	return true
end

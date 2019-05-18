function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.TeleportAccess) >= 32 then
		player:teleportTo(Position(33027, 31084, 13))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

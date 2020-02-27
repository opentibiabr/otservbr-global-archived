function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	if player:getStorageValue(Storage.FirstDragon.FirstDragonTimer) < os.time() then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(33583, 30990, 14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait to challenge The First Dragon again!")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

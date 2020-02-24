function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	if player:getExhaustion(Storage.FirstDragon.FirstDragonTimer) <= 0 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(Position(33583, 30990, 14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(Position(33597,30994,14))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have to wait to challenge The First Dragon again!")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

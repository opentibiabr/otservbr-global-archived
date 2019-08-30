function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local town = Town(2)
	if not town then
		return true
	end

	local destination = town:getTemplePosition()
	player:teleportTo(destination)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flying carpet brought you back to Thais.')
	position:sendMagicEffect(CONST_ME_POFF)
	destination:sendMagicEffect(CONST_ME_POFF)
	return true
end

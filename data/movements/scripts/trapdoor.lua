local dawnportTrapdoor = Position(32075, 31900, 5)
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if position == dawnportTrapdoor then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<krrk> <krrrrrk> You move away hurriedly.')
			player:teleportTo(Position(32075, 31899, 5), true)
			return true
	end

	return true
end

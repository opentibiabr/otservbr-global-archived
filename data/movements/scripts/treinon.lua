function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Attack the Monk and you will win 1 of stamina every 2 minutes training here.')
		creature:stopLiveCast()
	end
	return true
end

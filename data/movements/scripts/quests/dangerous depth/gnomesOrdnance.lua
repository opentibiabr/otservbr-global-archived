function onStepIn(creature, position, fromPosition, toPosition)
	if not creature or not creature:isPlayer() then
		return true
	end

	local stg = creature:getStorageValue(Storage.DangerousDepths.Gnomes.Ordnance) -- Storage da missão

	if stg == 1 then
		creature:setStorageValue(Storage.DangerousDepths.Gnomes.Ordnance, 2)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You started an escort, get everyone to safety!")
	end

	return true
end


local drumeEntrance = MoveEvent()
function drumeEntrance.onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:getStorageValue(Storage.TheOrderOfTheLion.Drume.Timer) > os.time() then
		creature:teleportTo(fromPosition, true)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ya has participado en esta escaramuza en las ultimas 20 horas.")
	end
	return true
end
drumeEntrance:aid(59601)
drumeEntrance:register()

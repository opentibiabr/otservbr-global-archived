function onStepIn(creature, item, position, fromPosition, toPosition)
	if not creature or not creature:isPlayer() then
		return true
	end

	if item:getPosition() == Position(33831, 32138, 14) then -- Warzone norte(entrada)! Warzone VI
		if creature:getStorageValue(Storage.DangerousDepths.Scouts.Status) >= 10 then
			creature:teleportTo(Position(34023, 32037, 14))
		else
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not use this portal yet.")
			creature:teleportTo(Position(fromPosition.x, fromPosition.y + 1, fromPosition.z))
		end
	elseif item:getPosition() == Position(34021, 32037, 14) then -- Saída!
		creature:teleportTo(Position(33831, 32140, 14))
	end

	if item:getPosition() == Position(33784, 32205, 14) then -- Warzone Sul(entrada)! Warzone V
		if creature:getStorageValue(Storage.DangerousDepths.Dwarves.Status) >= 10 then
			creature:teleportTo(Position(33921, 32401, 14))
		else
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not use this portal yet.")
			creature:teleportTo(Position(fromPosition.x - 1, fromPosition.y, fromPosition.z))
		end
	elseif item:getPosition() == Position(33921, 32402, 14) then -- Saída!
		creature:teleportTo(Position(33782, 32205, 14))
	end

	if item:getPosition() == Position(33829, 32187, 14) then -- Warzone Leste(entrada)! Warzone IV
		if creature:getStorageValue(Storage.DangerousDepths.Gnomes.Status) >= 10 then
			creature:teleportTo(Position(33982, 32236, 14))
		else
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not use this portal yet.")
			creature:teleportTo(Position(fromPosition.x, fromPosition.y - 1, fromPosition.z))
		end
	elseif item:getPosition() == Position(33982, 32234, 14) then -- Saída!
		creature:teleportTo(Position(33829, 32186, 14))
	end

	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

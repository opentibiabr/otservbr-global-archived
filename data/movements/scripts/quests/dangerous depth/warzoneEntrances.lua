function onStepIn(creature, item, position, fromPosition, toPosition)
	if not creature or not creature:isPlayer() then
		return true
	end

	local warzoneVI = Position(33367, 32307, 15)
	local warzoneV = Position(33208, 32119, 15)
	local warzoneIV = Position(33534, 32184, 15)

	if item:getPosition() == Position(33829, 32128, 14) then -- Warzone norte(entrada)! Warzone VI
		if creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI) == 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) <= os.time() then
			creature:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI, 0)
			creature:setStorageValue(Storage.DangerousDepths.Scouts.Status, creature:getStorageValue(Storage.DangerousDepths.Scouts.Status) - 10)
			creature:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI, os.time() + 8*60*60)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			creature:teleportTo(warzoneVI)
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI) < 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) <= os.time() then
			creature:teleportTo(Position(fromPosition.x + 1, fromPosition.y, fromPosition.z))
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) > os.time() then
			creature:teleportTo(warzoneVI)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end

	if item:getPosition() == Position(33777, 32192, 14) then -- Warzone norte(entrada)! Warzone VI
		if creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV) == 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) <= os.time() then
			creature:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV, 0)
			creature:setStorageValue(Storage.DangerousDepths.Dwarves.Status, creature:getStorageValue(Storage.DangerousDepths.Dwarves.Status) - 10)
			creature:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV, os.time() + 8*60*60)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			creature:teleportTo(warzoneV)
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV) < 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) <= os.time() then
			creature:teleportTo(Position(fromPosition.x, fromPosition.y + 1, fromPosition.z))
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) > os.time() then
			creature:teleportTo(warzoneV)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end

	if item:getPosition() == Position(33827, 32172, 14) then -- Warzone norte(entrada)! Warzone VI
		if creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV) == 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) <= os.time() then
			creature:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV, 0)
			creature:setStorageValue(Storage.DangerousDepths.Gnomes.Status, creature:getStorageValue(Storage.DangerousDepths.Gnomes.Status) - 10)
			creature:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV, os.time() + 8*60*60)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			creature:teleportTo(warzoneIV)
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV) < 1 and creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) <= os.time() then
			creature:teleportTo(Position(fromPosition.x, fromPosition.y + 1, fromPosition.z))
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif creature:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) > os.time() then
			creature:teleportTo(warzoneIV)
			creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end



	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

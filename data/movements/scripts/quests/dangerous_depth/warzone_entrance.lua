function onStepIn(creature, item, position, fromPosition, toPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local warzoneVI = Position(33367, 32307, 15)
	if item:getPosition() == Position(33829, 32128, 14) then
		if player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI) == 1 and
		player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) <= os.time() then
			player:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI, 0)
			player:setStorageValue(Storage.DangerousDepths.Scouts.Status,
			player:getStorageValue(Storage.DangerousDepths.Scouts.Status) - 10)
			player:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI, os.time() + 8*60*60)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			player:teleportTo(warzoneVI)
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneVI) < 1 and
		player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) <= os.time() then
			player:teleportTo(Position(fromPosition.x + 1, fromPosition.y, fromPosition.z))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. \z
			The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneVI) > os.time() then
			player:teleportTo(warzoneVI)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end
	local warzoneV = Position(33208, 32119, 15)
	if item:getPosition() == Position(33777, 32192, 14) then
		if player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV) == 1 and
		player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) <= os.time() then
			player:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV, 0)
			player:setStorageValue(Storage.DangerousDepths.Dwarves.Status,
			player:getStorageValue(Storage.DangerousDepths.Dwarves.Status) - 10)
			player:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV, os.time() + 8*60*60)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			player:teleportTo(warzoneV)
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneV) < 1 and
		player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) <= os.time() then
			player:teleportTo(Position(fromPosition.x, fromPosition.y + 1, fromPosition.z))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. \z
			The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneV) > os.time() then
			player:teleportTo(warzoneV)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end
	local warzoneIV = Position(33534, 32184, 15)
	if item:getPosition() == Position(33827, 32172, 14) then
		if player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV) == 1 and
		player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) <= os.time() then
			player:setStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV, 0)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.Status,
			player:getStorageValue(Storage.DangerousDepths.Gnomes.Status) - 10)
			player:setStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV, os.time() + 8*60*60)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone (you can enter freely for 8 hours from now).")
			player:teleportTo(warzoneIV)
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.LavaPumpWarzoneIV) < 1 and player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) <= os.time() then
			player:teleportTo(Position(fromPosition.x, fromPosition.y + 1, fromPosition.z))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot enter this warzone. \z
			The enemy still pumps lava into this area. Find a way to stop the pumps!")
		elseif player:getStorageValue(Storage.DangerousDepths.Acessos.TimerWarzoneIV) > os.time() then
			player:teleportTo(warzoneIV)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Entering the warzone.")
		end
	end
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
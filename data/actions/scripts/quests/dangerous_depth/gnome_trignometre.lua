local config = {
	locationA = {fromPosition = Position(33921, 32141, 14), toPosition = Position(33926, 32146, 14)},
	locationB = {fromPosition = Position(33965, 32139, 14), toPosition = Position(33975, 32149, 14)},
	locationC = {fromPosition = Position(33911, 32176, 14), toPosition = Position(33914, 32180, 14)},
	locationD = {fromPosition = Position(33947, 32206, 14), toPosition = Position(33952, 32209, 14)},
	locationE = {fromPosition = Position(33877, 32173, 14), toPosition = Position(33881, 32179, 14)},
}


function onUse(player, item, isHotkey)
	if not player then
		return true
	end

if player:getStorageValue(Storage.DangerousDepths.Gnomes.Measurements) == 1 then
	if player:getPosition():isInRange(config.locationA.fromPosition, config.locationA.toPosition) then
		if player:getStorageValue(Storage.DangerousDepths.Gnomes.locationA) < 1 then
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationA, 1)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationCount, player:getStorageValue(Storage.DangerousDepths.Gnomes.locationCount) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You probed the location successfully.")
			player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		end
	end
	if player:getPosition():isInRange(config.locationB.fromPosition, config.locationB.toPosition) then
		if player:getStorageValue(Storage.DangerousDepths.Gnomes.locationB) < 1 then
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationB, 1)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationCount, player:getStorageValue(Storage.DangerousDepths.Gnomes.locationCount) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You probed the location successfully.")
			player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		end
	end
	if player:getPosition():isInRange(config.locationC.fromPosition, config.locationC.toPosition) then
		if player:getStorageValue(Storage.DangerousDepths.Gnomes.locationC) < 1 then
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationC, 1)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationCount, player:getStorageValue(Storage.DangerousDepths.Gnomes.locationCount) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You probed the location successfully.")
			player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		end
	end
	if player:getPosition():isInRange(config.locationD.fromPosition, config.locationD.toPosition) then
		if player:getStorageValue(Storage.DangerousDepths.Gnomes.locationD) < 1 then
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationD, 1)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationCount, player:getStorageValue(Storage.DangerousDepths.Gnomes.locationCount) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You probed the location successfully.")
			player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		end
	end
	if player:getPosition():isInRange(config.locationE.fromPosition, config.locationE.toPosition) then
		if player:getStorageValue(Storage.DangerousDepths.Gnomes.locationE) < 1 then
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationE, 1)
			player:setStorageValue(Storage.DangerousDepths.Gnomes.locationCount, player:getStorageValue(Storage.DangerousDepths.Gnomes.locationCount) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You probed the location successfully.")
			player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		end
	end
end




	return true
end

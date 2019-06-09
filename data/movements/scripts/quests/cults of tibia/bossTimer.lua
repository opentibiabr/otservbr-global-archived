function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()

	if not player then
		return true
	end

	local Minotaurs = player:getStorageValue(Storage.CultsOfTibia.Minotaurs.bossTimer) -- Padrão
	local Barkless = player:getStorageValue(Storage.CultsOfTibia.Barkless.bossTimer)
	local Orcs = player:getStorageValue(Storage.CultsOfTibia.Orcs.bossTimer)
	local Humans = player:getStorageValue(Storage.CultsOfTibia.Humans.bossTimer)
	local Misguided = player:getStorageValue(Storage.CultsOfTibia.Misguided.bossTimer)
	local finalBoss = player:getStorageValue(Storage.CultsOfTibia.finalBoss.bossTimer)


	if item.actionid == 5516 then
		if player:getStorageValue(Storage.CultsOfTibia.Orcs.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	if item.actionid == 5515 then
		if player:getStorageValue(Storage.CultsOfTibia.finalBoss.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	if item.actionid == 5514 then
		if player:getStorageValue(Storage.CultsOfTibia.Misguided.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	if item.actionid == 5513 then
		if player:getStorageValue(Storage.CultsOfTibia.Humans.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	if item.actionid == 5512 then
		if player:getStorageValue(Storage.CultsOfTibia.Barkless.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	if item.actionid == 5511 then
		if player:getStorageValue(Storage.CultsOfTibia.Minotaurs.bossTimer) > os.time() then
		player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
		player:teleportTo(fromPosition)
		return false
		end
	end
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

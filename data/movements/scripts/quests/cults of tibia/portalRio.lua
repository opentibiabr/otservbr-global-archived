function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()

	if not player then
		return true
	end

	local stgTime = player:getStorageValue(Storage.CultsOfTibia.Life.bossTimer)
	if(player:getStorageValue(stgTime) > os.time())then
	player:sendCancelMessage('You need to wait for 20 hours to face this boss again.')
	player:teleportTo(fromPosition)
	return false
	end
	if player:getStorageValue(Storage.CultsOfTibia.Life.Mission) < 7 then
		player:teleportTo(Position(33474, 32281, 10))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	if 	player:getStorageValue(Storage.CultsOfTibia.Life.Mission) >= 7 then
		player:teleportTo(Position(33479, 32235, 10))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end


	return true
end

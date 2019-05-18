function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		player:teleportTo(fromPosition)
		return true
	end

	--if player:getStorageValue(Storage.WrathoftheEmperor.Mission10) < 2 or not player:hasBlessing(1) then
		--player:teleportTo(fromPosition)
		--fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		--return true
	--end

	local realm = Position(33028, 31086, 13)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(realm)
	realm:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

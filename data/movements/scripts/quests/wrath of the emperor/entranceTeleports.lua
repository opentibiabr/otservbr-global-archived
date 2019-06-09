function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.Questline) < 30 then
	local destinationz = Position(33138, 31249, 6)
		player:teleportTo(destinationz)
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.BossStatus) < 5 then
	local destinationt = Position(33138, 31249, 6)
		player:teleportTo(destinationt)
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.Questline) > 31 then
		local destination = Position(33360, 31397, 9)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local destination = Position(33359, 31397, 9)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

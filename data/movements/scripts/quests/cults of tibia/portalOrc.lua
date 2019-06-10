function onStepIn(creature, item, position, fromPosition)


	local entrada = Position(33167, 31930, 12)
	local saida = Position(33183, 31837, 15)


	local player = creature:getPlayer()

	if not player then
		return true
	end

	if item:getPosition() == entrada then
		player:teleportTo(Position(33182, 31837, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	if item:getPosition() == saida then
		player:teleportTo(Position(33168, 31930, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end

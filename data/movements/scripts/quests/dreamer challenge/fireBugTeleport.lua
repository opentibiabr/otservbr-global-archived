function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.itemid == 1387 then
		player:teleportTo(Position(32857, 32234, 11))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		item:transform(2249)
	end
	return true
end

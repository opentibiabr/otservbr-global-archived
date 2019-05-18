local p = {x = 33419, y = 32589, z = 10} -- where to tp to 33672, 31884, 5

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo(p)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)


end

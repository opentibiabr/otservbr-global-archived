function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
	local storage666 = 666

	if player:getLevel() >= 999 then
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32883, y = 32527, z = 11})
    end
    return true
end

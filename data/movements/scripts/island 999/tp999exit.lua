function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if player:getLevel() >= 999 then
        local exitPosition = Position(32883, 32527, 11)
        player:teleportTo(exitPosition)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
    end

    return true
end
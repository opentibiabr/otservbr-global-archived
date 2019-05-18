function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
	local storage666 = 666

	if player:getLevel(cid) >= 999 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations!")
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32832, y = 32435, z = 7})
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need level 999 to enter here.")
			creature:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end
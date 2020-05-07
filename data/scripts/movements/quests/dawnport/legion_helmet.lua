local sacrificeTeleport = MoveEvent()

function sacrificeTeleport.onStepIn(creature, item, position, fromPosition)
	local player, setting = creature:getPlayer(), UniqueTable[item.uid]
	if not player or not setting then
		return true
	end

	if player:getStorageValue(setting.storage) == 1 then
		player:teleportTo(setting.destination)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Offer the lives of the yet unborn to the lizard god if you want to enter the sanctuary.")
	end
	return true
end

sacrificeTeleport:uid(25021)
sacrificeTeleport:register()

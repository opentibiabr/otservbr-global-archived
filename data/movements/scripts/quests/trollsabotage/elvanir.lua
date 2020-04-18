function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local headItem = player:getSlotItem(CONST_SLOT_HEAD)
	if headItem and isInArray({5461, 12541, 15408}, headItem.itemid) then
		player:teleportTo(Position(33248, 31771, 8))
		player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		return true
	end
	
	player:teleportTo(fromPosition)
	player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must wear an underwater exploration helmet.')

	return true
end

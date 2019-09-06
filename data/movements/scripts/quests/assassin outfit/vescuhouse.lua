function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()

	if not player then
		return true
	end

	if position.x == 32519 and position.y == 32911 and position.z == 7 then
		local invisible = player:getCondition(CONDITION_INVISIBLE)
		local slot = player:getSlotItem(CONST_SLOT_RING)
		if not invisible and (not slot or not slot.uid == 2202) then -- This is ugly. I believe we should not have to check for the ring but for some reason getCondition is returning nil. Ideas?
			player:teleportTo(Position(32519, 32912, 7))
		end
	end

	return true
end
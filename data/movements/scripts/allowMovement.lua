function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if not player:hasAllowMovement() then
		player:teleportTo(fromPosition, true)
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if not player:hasAllowMovement() then
		player:teleportTo(fromPosition, true)
	end
	return true
end
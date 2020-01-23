local failPosition = Position(32066, 32192, 7)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:isPremium() then
		return true
	end

	failPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	player:teleportTo(failPosition)
	return true
end

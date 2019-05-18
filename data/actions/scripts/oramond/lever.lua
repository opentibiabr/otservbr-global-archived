function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = player:getPosition()
	if not targetPosition then
		return true
	end
	
	toPosition.x = (item.actionid == 50000 or item.actionid == 50001) and toPosition.x - 1 or toPosition.x + 1
	local creature = Tile(toPosition):getTopCreature()
	if not creature or not creature:isPlayer() then
		return true
	end

	targetPosition.z = item.actionid == 50000 and targetPosition.z - 1 or targetPosition.z + 1

	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	creature:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local position = player:getPosition()

	if position.y == toPosition.y then
	
		return false
	end
 	--elseif (getPlayerStorageValue(cid, 871241) == 1) then
	toPosition.y = position.y > toPosition.y and toPosition.y - 1 or toPosition.y + 1
	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local destination = Position(33170, 31247, 11)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_POFF)
	player:setStorageValue(Storage.TheNewFrontier.Questline, 23)
	return true
end

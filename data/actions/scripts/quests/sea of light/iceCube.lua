function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.SeaOfLightQuest.Questline) < 8 then
		return false
	end

	local destination = Position(32017, 31730, 8)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

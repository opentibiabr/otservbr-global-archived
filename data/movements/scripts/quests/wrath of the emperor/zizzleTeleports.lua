local teleports = {
	[3186] = Position(33084, 31214, 8),
	[3187] = Position(33093, 31122, 12)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		creature:teleportTo(fromPosition)
		return true
	end

	if player:getStorageValue(Storage.WrathoftheEmperor.TeleportAccess) >= 29 then
		if player:removeItem(12629, 1) then
			player:teleportTo(teleports[item.uid])
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
		end
	end
	return true
end

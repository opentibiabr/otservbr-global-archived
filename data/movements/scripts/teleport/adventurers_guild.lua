function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = player:getStorageValue(Storage.AdventurersGuild.Stone)
	local destination = townId ~= -1 and Town(townId):getTemplePosition() or player:getTown():getTemplePosition()

	player:setStorageValue(Storage.AdventurersGuild.Stone, -1)
	player:teleportTo(destination)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

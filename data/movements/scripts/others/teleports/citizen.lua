local config = {
	[9056] = 4,
	[9057] = 2,
	[9058] = 1,
	[9059] = 5,
	[9060] = 3,
	[9061] = 10,
	[9062] = 9,
	[9063] = 11,
	[9064] = 7,
	[9065] = 8,
	[9066] = 12,
	[9067] = 13,
	[9068] = 14,
	[9240] = 28,
	[9500] = 29,
	[9510] = 33
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local townId = config[item.uid]
	if not townId then
		return true
	end

	local town = Town(townId)
	if not town then
		return true
	end

	if town:getId() == 12 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You first need to absolve the Barbarian Test Quest to become citizen!')
		player:teleportTo(town:getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:setTown(town)
	player:teleportTo(town:getTemplePosition())
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now a citizen of ' .. town:getName() .. '.')
	return true
end

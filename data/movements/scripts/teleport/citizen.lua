local config = {
	[9059] = 5,
	[9056] = 6,
	[9060] = 7,
	[9057] = 8,
	[9058] = 9,
	[9061] = 13,
	[9062] = 10,
	[9063] = 11,
	[9068] = 12,
	[9064] = 14,
	[9065] = 15,
	[9066] = 16,
	[9067] = 17,
	[9240] = 18,
	[9510] = 20,
	[9500] = 21,
	[9515] = 22,
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

	if town:getId() == 16 and player:getStorageValue(Storage.BarbarianTest.Questline) < 8 then
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

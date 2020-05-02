local config = {
	[9059] = AB_DENDRIEL,
	[9056] = CARLIN,
	[9060] = KAZORDOON,
	[9057] = THAIS,
	[9058] = VENORE,
	[9061] = DARASHIA,
	[9062] = ANKRAHMUN,
	[9063] = EDRON,
	[9068] = FARMINE,
	[9064] = DARASHIA,
	[9065] = PORT_HOPE,
	[9066] = SVARGROND,
	[9067] = YALAHAR,
	[9240] = GRAY_BEACH,
	[9510] = RATHLETON,
	[9500] = ROSHAMUUL,
	[9515] = ISSAVI,
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

local config = {
	{position = Position(32173, 31871, 15), pearlId = 2143},
	{position = Position(32180, 31871, 15), pearlId = 2144}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.SecondSeal) >= 1 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local pearlItems = {}
	for i = 1, #config do
		local pearlItem = Tile(config[i].position):getItemById(config[i].pearlId)
		if not pearlItem then
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		pearlItems[#pearlItems + 1] = pearlItem
	end

	for i = 1, #pearlItems do
		pearlItems[i]:remove(1)
	end

	player:teleportTo(Position(position.x, position.y - 6, position.z))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
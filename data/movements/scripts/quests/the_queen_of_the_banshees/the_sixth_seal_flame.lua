local config = {
	{position = Position(32309, 31975, 13), campfireId = 1421},
	{position = Position(32311, 31975, 13), campfireId = 1421},
	{position = Position(32313, 31975, 13), campfireId = 1423},
	{position = Position(32309, 31976, 13), campfireId = 1421},
	{position = Position(32311, 31976, 13), campfireId = 1421},
	{position = Position(32313, 31976, 13), campfireId = 1423}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.SixthSeal) >= 1 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	for i = 1, #config do
		local campfireItem = Tile(config[i].position):getItemById(config[i].campfireId)
		if not campfireItem then
			player:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end

	player:setStorageValue(Storage.QueenOfBansheesQuest.SixthSeal, 1)
	player:teleportTo(Position(32261, 31856, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

local config = {
	{position = {x = 32309, y = 31975, z = 13}, campfireId = 1421},
	{position = {x = 32311, y = 31975, z = 13}, campfireId = 1421},
	{position = {x = 32313, y = 31975, z = 13}, campfireId = 1423},
	{position = {x = 32309, y = 31976, z = 13}, campfireId = 1421},
	{position = {x = 32311, y = 31976, z = 13}, campfireId = 1421},
	{position = {x = 32313, y = 31976, z = 13}, campfireId = 1423}
}

local flameSixthSeal = MoveEvent()

function flameSixthSeal.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.Quest.TheQueenOfTheBanshees.SixthSeal) >= 1 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	for i = 1, #config do
		local tile = Tile(config[i].position)
		if tile then
			local campfireItem = tile:getItemById(config[i].campfireId)
			if not campfireItem then
				player:teleportTo(fromPosition)
				fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
		end
	end

	player:setStorageValue(Storage.Quest.TheQueenOfTheBanshees.SixthSeal, 1)
	player:teleportTo({x = 32261, y = 31856, z = 15})
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

flameSixthSeal:uid(35014)
flameSixthSeal:register()

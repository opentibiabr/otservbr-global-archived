local config = {
	{position = Position(32802, 31584, 1), itemId = 1945},
	{position = Position(32803, 31584, 1), itemId = 1946},
	{position = Position(32804, 31584, 1), itemId = 1945},
	{position = Position(32805, 31584, 1), itemId = 1946}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local correct, leverItem = true
	for i = 1, #config do
		leverItem = Tile(config[i].position):getItemById(config[i].itemId)
		if not leverItem then
			correct = false
			break
		end
	end

	position:sendMagicEffect(CONST_ME_TELEPORT)

	local destination
	if not correct then
		destination = Position(32803, 31587, 1)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	destination = Position(32701, 31639, 6)
	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

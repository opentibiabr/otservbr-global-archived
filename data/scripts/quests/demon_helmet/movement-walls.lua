local tilesPositions = {
	{x = 33190, y = 31629, z = 13},
	{x = 33191, y = 31629, z = 13}
}

local wallsPositions = {
	{x = 33210, y = 31630, z = 13},
	{x = 33211, y = 31630, z = 13},
	{x = 33212, y = 31630, z = 13}
}

local walls = MoveEvent()
walls:type("stepin")

function walls.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for i = 1, #tilesPositions do
		local creature = Tile(tilesPositions[i]):getTopCreature()
		if creature then
			for i = 1, #wallsPositions do
				Tile(wallsPositions[i]):getItemById(1050):remove()
			end
		end
	end
	return true
end

for index, value in pairs(tilesPositions) do
	walls:position(value)
end

walls:register()

walls = MoveEvent()
walls:type("stepout")

function walls.onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for i = 1, #wallsPositions do
		Position:hasCreature(wallsPositions[i], {x = 33211, y = 31631, z = 13})
		Game.createItem(1050, 1, wallsPositions[i])
	end
	return true
end

for index, value in pairs(tilesPositions) do
	walls:position(value)
end

walls:register()

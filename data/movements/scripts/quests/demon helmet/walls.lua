local positions = {
	Position(33190, 31629, 13),
	Position(33191, 31629, 13)
}

local wallPositions = {
	Position(33210, 31630, 13),
	Position(33211, 31630, 13),
	Position(33212, 31630, 13)
}

function onStepIn(creature, item, position, fromPosition)
	for i = 1, #positions do
		local creature = Tile(positions[i]):getTopCreature()
		if not creature or not creature:isPlayer() then
			return true
		end
	end

	for i = 1, #wallPositions do
		local wallItem = Tile(wallPositions[i]):getItemById(1050)
		if wallItem then
			wallItem:remove()
			addEvent(Game.createItem, 5 * 60 * 1000, 1050, 1, wallPositions[i])
		end
	end
	return true
end

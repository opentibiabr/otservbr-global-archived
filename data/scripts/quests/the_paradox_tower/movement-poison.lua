local positions = {
	{x = 32497, y = 31889, z = 7},
	{x = 32497, y = 31890, z = 7},
	{x = 32498, y = 31890, z = 7},
	{x = 32499, y = 31890, z = 7},
	{x = 32502, y = 31890, z = 7},
	{x = 32494, y = 31888, z = 7}
}

local poison = MoveEvent()

function poison.onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for i = 1, #positions do
		local tile = Tile(positions[i])
		if tile and tile:getPosition() and not tile:getItemById(1490) then
			Game.createItem(1490, 1, positions[i])
			player:addHealth(-200, COMBAT_POISONDAMAGE)
		end
	end
	return true
end

poison:uid(25011)
poison:register()

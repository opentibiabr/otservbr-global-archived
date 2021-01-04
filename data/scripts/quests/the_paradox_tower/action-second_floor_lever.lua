local positions = {
	{x = 32476, y = 31900, z = 6},
	{x = 32477, y = 31900, z = 6},
	{x = 32478, y = 31900, z = 6},
	{x = 32479, y = 31900, z = 6},
	{x = 32480, y = 31900, z = 6},
	{x = 32481, y = 31900, z = 6}
}

local secondFloorLever = Action()

function secondFloorLever.onUse(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local stairPosition = {x = 32476, y = 31904, z = 6}
	local stairId = 1386

	-- Create stair
	-- The stair is only created if all the jungles of the "position" variable (line 1) are growing again
	if item.itemid == 1945 then
		-- Checks if all levers glass are in the correct positions
		if Position.hasItem(positions, 1, 1946)
		and Position.hasItem(positions, 2, 1946)
		and Position.hasItem(positions, 3, 1945)
		and Position.hasItem(positions, 4, 1945)
		and Position.hasItem(positions, 5, 1946)
		and Position.hasItem(positions, 6, 1945) then
			-- If all the jungles are growing again, then he turns the stone on the stairs
			Position.createItem(stairPosition, stairId)
			item:transform(1946)
		else
			item:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	elseif item.itemid == 1946 then
		if position.hasItem({stairPosition}, 1 , stairId) then
			Position.removeItem(stairPosition, stairId)
		end
		item:transform(1945)
	end
	return true
end

secondFloorLever:uid(25016)
secondFloorLever:register()

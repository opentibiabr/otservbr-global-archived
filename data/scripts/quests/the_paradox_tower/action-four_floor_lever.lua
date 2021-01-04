local positions = {
	{x = 32476, y = 31900, z = 4},
	{x = 32477, y = 31900, z = 4},
	{x = 32478, y = 31900, z = 4},
	{x = 32479, y = 31900, z = 4},
	{x = 32480, y = 31900, z = 4},
	{x = 32481, y = 31900, z = 4}
}

local fourFloorLever = Action()

function fourFloorLever.onUse(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local stairPosition = {x = 32476, y = 31904, z = 4}
	local stairId = 1386

	if item.itemid == 1945 then
		-- Check if have all items
		if Position.hasItem(positions, 1, 2682)
		and Position.hasItem(positions, 2, 2676)
		and Position.hasItem(positions, 3, 2679)
		and Position.hasItem(positions, 4, 2674)
		and Position.hasItem(positions, 5, 2681)
		and Position.hasItem(positions, 6, 2678) then
			-- If have all items, then remove it
			Position.removeItem(positions[1], 2682)
			Position.removeItem(positions[2], 2676)
			Position.removeItem(positions[3], 2679)
			Position.removeItem(positions[4], 2674)
			Position.removeItem(positions[5], 2681)
			Position.removeItem(positions[6], 2678)
			-- Create ladder
			Position.createItem(stairPosition, stairId)
			item:transform(1946)
		-- If not have all items, then send poff effect
		else
			item:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	elseif item.itemid == 1946 then
		-- Remove ladder
		if position.hasItem({stairPosition}, 1 , stairId) then
			Position.removeItem(stairPosition, stairId)
		end
		item:transform(1945)
	end
	return true
end

fourFloorLever:uid(30027)
fourFloorLever:register()

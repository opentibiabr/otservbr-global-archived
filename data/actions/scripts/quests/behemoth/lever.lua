local wall = {
	Position(33295, 31677, 15),
	Position(33296, 31677, 15),
	Position(33297, 31677, 15),
	Position(33298, 31677, 15),
	Position(33299, 31677, 15)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stone
		
		for i = 1, #wall do
			stone = Tile(wall[i]):getItemById(1304)
			if stone then
				stone:remove()
			end
		end

		item:transform(1946)
	elseif item.itemid == 1946 then
		for i = 1, #wall do
			Game.createItem(1304, 1, wall[i])
		end

		item:transform(1945)
	end	
	
	return true
end

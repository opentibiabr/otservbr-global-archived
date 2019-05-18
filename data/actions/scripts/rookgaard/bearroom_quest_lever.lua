local stonePosition = Position(32145, 32101, 11)
local relocatePosition = Position(32145, 32102, 11)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stoneItem = Tile(stonePosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
			item:transform(1946)
		end
	else
		Tile(stonePosition):relocateTo(relocatePosition)
		Game.createItem(1304, 1, stonePosition)
		item:transform(1945)
	end
	return true
end

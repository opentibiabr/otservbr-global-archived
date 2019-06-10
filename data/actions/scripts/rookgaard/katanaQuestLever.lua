local doorPosition = Position(32177, 32148, 11)
local relocatePosition = Position(32178, 32148, 11)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1946 then
		local doorItem = Tile(doorPosition):getItemById(5108)
		if doorItem then
			doorItem:transform(5109)
			doorItem:setActionId(1002)
			item:transform(1945)
		end
	else
		local tile = Tile(doorPosition)
		local doorItem = tile:getItemById(5109)
		if doorItem then
			tile:relocateTo(relocatePosition, true)

			doorItem:transform(5108)
			doorItem:setActionId(1001)
			item:transform(1946)
		end
	end
	return true
end

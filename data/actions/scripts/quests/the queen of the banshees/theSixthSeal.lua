local config = {
	[50005] = Position(32309, 31975, 13),
	[50006] = Position(32309, 31976, 13),
	[50007] = Position(32311, 31975, 13),
	[50008] = Position(32311, 31976, 13),
	[50009] = Position(32313, 31975, 13),
	[50010] = Position(32313, 31976, 13)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local campfire = Tile(useItem):getItemById(item.itemid == 1945 and 1423 or 1421)
	if campfire then
		campfire:transform(item.itemid == 1945 and 1421 or 1423)
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
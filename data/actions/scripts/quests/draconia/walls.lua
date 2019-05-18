local config = {
	[4249] = {position = Position(32792, 31581, 7), itemId = 1037},
	[4250] = {position = Position(32790, 31594, 7), itemId = 1285}
}

function onUse(player, item, toPosition, target, fromPosition, isHotkey)
	local wall = config[item.actionid]
	if not wall then
		return true
	end

	local wallItem = Tile(wall.position):getItemById(wall.itemId)
	if wallItem then
		wallItem:remove()
	else
		Game.createItem(wall.itemId, 1, wall.position)
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end

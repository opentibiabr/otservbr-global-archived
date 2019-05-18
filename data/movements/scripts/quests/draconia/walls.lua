local config = {
	[4251] = {position = Position(32796, 31594, 5), itemId = 1025},
	[4252] = {position = Position(32796, 31576, 5), itemId = 1025}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local wall = config[item.actionid]
	if not wall then
		return true
	end

	local wallItem = Tile(wall.position):getItemById(wall.itemId)
	if wallItem then
		wallItem:remove()
	end

	item:transform(item.itemid - 1)
	return true
end

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local wall = config[item.actionid]
	if not wall then
		return true
	end

	if not Tile(wall.position):getItemById(wall.itemId) then
		Game.createItem(wall.itemId, 1, wall.position)
	end

	item:transform(item.itemid + 1)
	return true
end

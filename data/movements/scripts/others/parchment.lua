local demonPositions = {
	Position(33060, 31623, 15),
	Position(33066, 31623, 15),
	Position(33060, 31627, 15),
	Position(33066, 31627, 15)
}

local time = 2 -- hours to recreate the parchment.

local function recreateParchment(position)
	local item = Tile(position):getItemById(1953)
	if item then
		item:setActionId(60999)
	else
		local parchment = Game.createItem(1953, 1, position)
		if parchment then
			parchment:setText('Buried forever that he never shall return. Don\'t remove this seal or bad things may happen.')
			parchment:setActionId(60999)
		end
	end
end

function onRemoveItem(item, tile, position)
	item:removeAttribute(ITEM_ATTRIBUTE_ACTIONID)
	addEvent(recreateParchment, time * 60 * 60 * 1000, position)

	for i = 1, #demonPositions do
		Game.createMonster('Demon', demonPositions[i])
	end
	return true
end

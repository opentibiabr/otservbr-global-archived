-- level and quests closing door
local moveevent = MoveEvent()

function moveevent.onStepOut(creature, item, position, fromPosition)
	local tile = Tile(position)
	if tile:getCreatureCount() > 0 then
		return true
	end

	local newPosition = {x = position.x + 1, y = position.y, z = position.z}
	local query = Tile(newPosition):queryAdd(creature)
	if query ~= RETURNVALUE_NOERROR or query == RETURNVALUE_NOTENOUGHROOM then
		newPosition.x = newPosition.x - 1
		newPosition.y = newPosition.y + 1
		query = Tile(newPosition):queryAdd(creature)
	end

	if query == RETURNVALUE_NOERROR or query ~= RETURNVALUE_NOTENOUGHROOM then
		doRelocate(position, newPosition)
	end

	local i, tileItem, tileCount = 1, true, tile:getThingCount()
	while tileItem and i < tileCount do
		tileItem = tile:getThing(i)
		if tileItem and tileItem:getUniqueId() ~= item.uid and tileItem:getType():isMovable() then
			tileItem:remove()
		else
			i = i + 1
		end
	end

	item:transform(item.itemid - 1)
	return true
end

moveevent:id(1643,1645,1647,1649,1661,1663,1665,1667,1675,1677,1679,1681,1688,1690,1697,1699,5103,5105,5112,5114,5121,5123,5130,5132,5288,5290,5292,5294,5746,5748,6202,6204,6206,6208,6259,6261,6263,6265,6897,6899,6906,6908,7039,7041,7048,7050,7722,7724,7726,7728,8260,8262,8264,8266,8362,8364,8366,8368,9362,9364,9366,9368,9557,9559,9566,9568,9864,9866,9873,9875,11140,11142,11147,11149,11238,11240,11247,11249,17566,17568,17575,17577,17706,17708,17715,17717,17999,18001,18008,18010)
moveevent:register()
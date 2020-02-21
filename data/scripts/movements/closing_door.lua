-- level and quests closing door
local door = MoveEvent()

local doorIds = {}
for index, value in ipairs(questDoor) do
    if not table.contains(doorIds, value.openDoor) then
        table.insert(doorIds, value.openDoor)
    end
end
for index, value in ipairs(levelDoor) do
    if not table.contains(doorIds, value.openDoor) then
        table.insert(doorIds, value.openDoor)
    end
end

function door.onStepOut(creature, item, position, fromPosition)
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

	for index, value in ipairs(levelDoor) do
		if value.openDoor == item.itemid then
			item:transform(value.closedDoor)
		end
	end
	for index, value in ipairs(questDoor) do
		if value.openDoor == item.itemid then
			item:transform(value.closedDoor)
		end
	end
	return true
end

for index, value in ipairs(doorIds) do
    door:id(value)
end
door:register()

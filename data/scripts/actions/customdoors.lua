local customDoors = Action()
local doorIds = {}

for _, v in ipairs(customDoorsRange) do
    if not table.contains(doorIds, v.openDoor) then
        table.insert(doorIds, v.openDoor)
    end

    if not table.contains(doorIds, v.closedDoor) then
        table.insert(doorIds, v.closedDoor)
    end
end

function customDoors.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local doorCreature = Tile(toPosition):getTopCreature()
	if doorCreature then
		toPosition.x = toPosition.x + 1
		local query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		if query ~= RETURNVALUE_NOERROR then
			toPosition.x = toPosition.x - 1
			toPosition.y = toPosition.y + 1
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			toPosition.y = toPosition.y - 2
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			toPosition.x = toPosition.x - 1
			toPosition.y = toPosition.y + 1
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return true
		end
		doorCreature:teleportTo(toPosition, true)
	end
	
	local itemId = item:getId()
    for index, value in ipairs(customDoorsRange) do
		 if value.closedDoor == itemId then
			item:transform(value.openDoor)
		end
		if value.openDoor == itemId then
			item:transform(value.closedDoor)
		end
	end
	return true
end

for index, value in ipairs(doorIds) do
    customDoors:id(value)
end

customDoors:register()

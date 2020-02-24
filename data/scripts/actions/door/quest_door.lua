-- quest door
local door = Action()
local doorIds = {}

for index, value in ipairs(questDoor) do
    if not table.contains(doorIds, value.openDoor) then
        table.insert(doorIds, value.openDoor)
    end

    if not table.contains(doorIds, value.closedDoor) then
        table.insert(doorIds, value.closedDoor)
    end
end

function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getId()
    for index, value in ipairs(questDoor) do
		 if value.closedDoor == itemId then
			if player:getStorageValue(item.actionid) <= -1 then
				item:transform(value.openDoor)
				player:teleportTo(toPosition, true)
				return true
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
				return true
			end
		end
	end
	
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
	return true
end

for index, value in ipairs(doorIds) do
    door:id(value)
end

door:register()

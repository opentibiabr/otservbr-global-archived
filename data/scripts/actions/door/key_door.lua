-- unlocked key door
local door = Action()
local doorIds = {}

for index, value in ipairs(keyUnlockedDoor) do
    if not table.contains(doorIds, value.openDoor) then
        table.insert(doorIds, value.openDoor)
    end

    if not table.contains(doorIds, value.closedDoor) then
        table.insert(doorIds, value.closedDoor)
    end
end

function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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
    for index, value in ipairs(keyUnlockedDoor) do
		 if value.closedDoor == itemId then
				item:transform(value.openDoor)
				return true
		end
	end
	for index, value in ipairs(keyUnlockedDoor) do
		if value.openDoor == itemId then
			item:transform(value.closedDoor)
		end
	end
	return true
end

for index, value in ipairs(doorIds) do
    door:id(value)
end

door:register()

-- locked key door
local door = Action()

function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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
	if target.actionid > 0 then
		for index, value in ipairs(keyLockedDoor) do
			for index, x in ipairs(fromClosedToLockedDoor) do
				if item.actionid == target.actionid and value.closedDoor == target.itemid then
					target:transform(value.openDoor)
					return true
				elseif item.actionid == target.actionid and value.openDoor == target.itemid then
					target:transform(value.closedDoor)
					return true
				elseif item.actionid == target.actionid and x.keyDoorClosed == target.itemid then
					target:transform(x.keyDoorLocked)
					return true
				end
			end
		end
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "The key does not match.")
	end
	return true
end

for index, value in pairs(keysID) do
	door:id(value)
end

door:register()

-- it is locked message
local door = Action()
local doorIds = {}

for index, value in ipairs(keyLockedDoor) do
    if not table.contains(doorIds, value.closedDoor) then
        table.insert(doorIds, value.closedDoor)
    end
end

function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "It is locked.")
	return true
end

for index, value in ipairs(doorIds) do
    door:id(value)
end

door:register()
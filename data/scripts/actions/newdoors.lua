local newDoors = Action()
local doorIds = {}

for _, v in ipairs(customDoorsRange) do
    if not table.contains(doorIds, v.openDoor) then
        table.insert(doorIds, v.openDoor)
    end

    if not table.contains(doorIds, v.closedDoor) then
        table.insert(doorIds, v.closedDoor)
    end
end

function newDoors.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getId()
    for _, v in ipairs(customDoorsRange) do
        if v.closedDoor == itemId then
            item:transform(v.openDoor)
            return true
        end

        if v.openDoor == itemId then
            item:transform(v.closedDoor)
            return true
        end
    end

end

for _, door in ipairs(doorIds) do
    newDoors:id(door)
end

newDoors:register()

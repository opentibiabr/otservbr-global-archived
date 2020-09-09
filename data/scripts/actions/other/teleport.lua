local upFloorIds = {1386, 3678, 5543, 22845, 22846, 33397, 35005, 36097}

local teleport = Action()

function teleport.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray(upFloorIds, item.itemid) then
		fromPosition:moveUpstairs()
	else
		fromPosition.z = fromPosition.z + 1
	end
	player:teleportTo(fromPosition, false)
	return true
end

teleport:id(1386, 3678, 5543, 22845, 22846, 33397, 35005, 36097)
teleport:register()

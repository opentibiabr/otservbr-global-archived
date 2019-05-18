local upFloorIds = {23668}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if isInArray(upFloorIds, item.itemid) == true then
		fromPosition.x = fromPosition.x + 1
		fromPosition.z = fromPosition.z - 2
	end
	player:teleportTo(fromPosition, false)
	return true
end
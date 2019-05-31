function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if item:getId() == 22845 then
		fromPosition.y = fromPosition.y - 1
		fromPosition.z = fromPosition.z - 1
	
	elseif item:getId() == 22846 then
		fromPosition.x = fromPosition.x - 1
		fromPosition.z = fromPosition.z - 1
	
	else
		fromPosition.z = fromPosition.z + 1
	end
	
	player:teleportTo(fromPosition, false)
	
	return true
end
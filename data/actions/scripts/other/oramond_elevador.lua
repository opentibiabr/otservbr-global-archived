local action_id = {
	[22840] = {x = 33638, y = 31903, z = 5},
	[22841] = {x = 33638, y = 31903, z = 6},
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local action = action_id[item:getActionId()]
	
	if action then
		player:teleportTo(action, true)
	end

	return true
end
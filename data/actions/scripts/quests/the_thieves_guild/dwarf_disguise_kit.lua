local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(5 * 60 * 1000) -- should be 5 minutes
condition:setOutfit({lookType = 66}) -- dwarf geomancer looktype

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addCondition(condition)
	item:remove()
	return true
end

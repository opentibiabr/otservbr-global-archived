local scythe = Action()

function scythe.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if not isInArray({3453, 9596}, item.itemid) then
		return false
	end

	local targetId, targetActionId = target.itemid, target.actionid
	if targetId == 5465 then
		target:transform(5463)
		target:decay()
		Game.createItem(5466, 1, toPosition)
		return true
	end

	if targetId == 3653 then
		target:transform(3651)
		target:decay()
		Game.createItem(3605, 1, toPosition)
		return true
	end
	-- Secret Library
    if targetActionId == 64028 then
        player:teleportTo(Position(32515, 32535, 12))
		return true
	end
	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end

scythe:id(3453)
scythe:register()
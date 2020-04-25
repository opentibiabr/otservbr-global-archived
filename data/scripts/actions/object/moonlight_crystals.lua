local moonlightCrystals = Action()

function moonlightCrystals.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 24716 then
		target:transform(24717)
		item:remove()
		return true
	end
	return false
end

moonlightCrystals:id(24739)
moonlightCrystals:register()

local machete = Action()

function machete.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local config = {
	targetId = target.itemid,
	jungle_ids = {3696,3702,17153},
	wild_growth = { 1499, 11099, 2101, 1775, 1447, 1446},
}

	if isInArray(config.jungle_ids, config.targetId) then
		target:transform(config.targetId == 17153 and 17151 or config.targetId - 1)
		target:decay()
		return true
	end

	if isInArray(config.wild_growth, config.targetId) then
		toPosition:sendMagicEffect(CONST_ME_POFF)
		target:remove()
		return true
	end

	return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
end

machete:id(3308)
machete:register()

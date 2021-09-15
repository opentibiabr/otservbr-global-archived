local config = {
	[500] = Position(33022, 31536, 6),
	[501] = Position(33020, 31536, 4)
}

local theNewFrontierVine = Action()
function theNewFrontierVine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = config[item.uid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

theNewFrontierVine:uid(3153,501)
theNewFrontierVine:register()
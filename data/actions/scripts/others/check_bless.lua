dofile('data/modules/scripts/blessings/blessings.lua')

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return Blessings.checkBless(player)
end

dofile('data/modules/scripts/supplystash/supplystash.lua')
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return SupplyStash.sendOpenWindow(player)
end

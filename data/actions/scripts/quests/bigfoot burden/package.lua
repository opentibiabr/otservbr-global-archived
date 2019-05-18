function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item.itemid - 1)
	return true
end

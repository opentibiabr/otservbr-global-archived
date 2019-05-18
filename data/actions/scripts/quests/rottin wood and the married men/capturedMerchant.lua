function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addItem(ITEM_GOLD_COIN, 100)
	item:remove(1)
	return true
end

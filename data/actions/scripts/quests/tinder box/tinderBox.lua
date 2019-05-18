-- <action itemid="22728" script="tinderBox.lua" />

local config = {
	item = 22728,
	target = 22727,
	reward = 22726,
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.itemid == config.item and target.itemid == config.target then
		item:remove(1)
		target:remove(1)
		player:addItem(config.reward, 1)
	end
	
	return true
end
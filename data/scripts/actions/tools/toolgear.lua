local toolgear = Action()

function toolgear.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or shovel.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or pick.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or machete.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or crowbar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or spoon.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or scythe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		or kitchen_knife.onUse(player, item, fromPosition, target, toPosition, isHotkey)
end
		
toolgear:id(9594, 9596, 9598)
toolgear:register()

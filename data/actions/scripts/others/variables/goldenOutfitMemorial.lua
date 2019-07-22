local text = "The Golden Outfit has not been acquired by anyone yet."

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:showTextDialog(item.itemid, text)
	return true
end

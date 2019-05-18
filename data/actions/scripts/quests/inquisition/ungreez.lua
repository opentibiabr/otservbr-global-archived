function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 5114 then
		return true
	end

	if player:getStorageValue(Storage.TheInquisition.Questline) == 18 then
		player:teleportTo(toPosition, true)
		item:transform(5115)
	end
	return true
end
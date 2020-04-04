function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1225 then
		return true
	end

	if player:getStorageValue(Storage.OutfitQuest.firstOrientalAddon) == 1 then
		player:teleportTo(toPosition, true)
		item:transform(1226)
	end
	return true
end

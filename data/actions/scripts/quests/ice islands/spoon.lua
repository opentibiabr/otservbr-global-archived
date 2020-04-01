function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 388 then
		return false
	end

	if player:getStorageValue(Storage.TheIceIslands.Questline) ~= 20 then
		return false
	end

	player:addItem(8204, 1)
	toPosition:sendMagicEffect(CONST_ME_FIREAREA)
	return true
end

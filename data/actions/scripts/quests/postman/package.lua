function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 101 and target.itemid == 2334 then
		if player:getStorageValue(Storage.postman.Mission09) == 2 then
			player:setStorageValue(Storage.postman.Mission09, 3)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			item:transform(1993)
		end
	end
	return true
end

local config = {
	[ITEM_GOLD_COIN] = {changeTo = ITEM_PLATINUM_COIN},
	[ITEM_PLATINUM_COIN] = {changeBack = ITEM_GOLD_COIN, changeTo = ITEM_CRYSTAL_COIN},
	[ITEM_CRYSTAL_COIN] = {changeBack = ITEM_PLATINUM_COIN}
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local coin = config[item.itemid]
	if not coin then
		return false
	end

	if coin.changeTo and item.type == 100 then
		item:remove()
		player:addItem(coin.changeTo, 1, true)
	elseif coin.changeBack then
		item:transform(item.itemid, item.type - 1)
		player:addItem(coin.changeBack, 100, true)
	else
		return false
	end
	
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	
	return true
end

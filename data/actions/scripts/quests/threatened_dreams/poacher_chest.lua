local chests = {
	[34123] = {itemid = 28596, count = 1}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if chests[item.uid] then
		if player:getStorageValue(34123) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It\'s empty.')
			return true
		end

		local chest = chests[item.uid]
		local itemType = ItemType(chest.itemid)
		if itemType then
			local article = itemType:getArticle()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. (#article > 0 and article .. ' ' or '') .. itemType:getName() .. '.')
		end

		player:addItem(chest.itemid, chest.count)
		player:setStorageValue(34123, 1)
		player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 2)
	end

	return true
end

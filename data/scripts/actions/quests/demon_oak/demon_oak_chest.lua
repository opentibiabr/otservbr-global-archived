local chests = {
	[1247] = {itemid = 3389, count = 1},
	[1248] = {itemid = 8077, count = 1},
	[1249] = {itemid = 14768, count = 1},
	[1250] = {itemid = 14769, count = 1}
}

local demonOakChest = Action()
function demonOakChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if chests[item.uid] then
		if player:getStorageValue(Storage.DemonOak.Done) ~= 2 then
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
		player:setStorageValue(Storage.DemonOak.Done, 3)
	end
	return true
end

demonOakChest:uid(1002, 1248, 1249, 1250)
demonOakChest:register()

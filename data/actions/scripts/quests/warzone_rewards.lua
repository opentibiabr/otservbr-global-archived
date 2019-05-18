local config = {
	[9172] = {items = {{18402}, {18414, 12}, {18396}, {18500}, {2160, 5}, {18423, 2}}, storage = Storage.QuestChests.WarzoneReward1, containerId = 18394},
	[9173] = {items = {{18402}, {18415, 7}, {18396}, {18504}, {2160, 3}, {18423, 2}}, storage = Storage.QuestChests.WarzoneReward2, containerId = 18393},
	[9174] = {items = {{18402}, {18413, 10}, {18396}, {18508}, {2160, 4}, {18423, 2}}, storage = Storage.QuestChests.WarzoneReward3, containerId = 18394}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local player, cStorage = player, useItem.storage
	if player:getStorageValue(cStorage) > os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It is empty.')
		return true
	end

	local container = player:addItem(useItem.containerId)
	if not container then
		return true
	end

	for i = 1, #useItem.items do
		container:addItem(useItem.items[i][1], useItem.items[i][2] or 1)
	end

	player:setStorageValue(cStorage, os.time() + 20 * 60 * 60)
	local itemType = ItemType(container.itemid)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. itemType:getArticle() .. ' ' .. itemType:getName() .. '.')
	return true
end
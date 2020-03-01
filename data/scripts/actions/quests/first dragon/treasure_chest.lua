local treasureChest = Action()

function treasureChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end
	if player:getStorageValue(item.uid) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. getItemName(setting.itemId) .. ' is empty.')
		return true
	end
	if player:getStorageValue(Storage.FirstDragon.ChestCounter) >= 19 then
		player:addAchievement('Treasure Hunter')
		player:addItem(setting.name, setting.count, true)
		player:setStorageValue(item.uid, 1)
		player:setStorageValue(Storage.FirstDragon.ChestCounter, player:getStorageValue(Storage.FirstDragon.ChestCounter) + 1)
		return true
	end
	player:addItem(setting.name, setting.count, true)
	player:setStorageValue(item.uid, 1)
	player:setStorageValue(Storage.FirstDragon.ChestCounter, player:getStorageValue(Storage.FirstDragon.ChestCounter) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found ' ..setting.count.. ' ' ..setting.name..'.')
	return true
end

for value = 24851, 24870 do
	treasureChest:uid(value)
end

treasureChest:register()

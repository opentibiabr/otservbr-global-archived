local config = {
	[10201] = {name = 'Giant Shimmering Pearl', count = 1},
	[10202] = {name = 'Gold Nugget', count = 2},
	[10203] = {name = 'Blue Crystal Shard', count = 1},
	[10204] = {name = 'Violet Crystal Shard', count = 1},
	[10205] = {name = 'Green Crystal Splinter', count = 2},
	[10206] = {name = 'Red Gem', count = 1},
	[10207] = {name = 'Onyx Chip', count = 3},
	[10208] = {name = 'Platinum Coin', count = 3},
	[10209] = {name = 'Red Crystal Fragment', count = 2},
	[10210] = {name = 'Yellow Gem', count = 1},
	[10211] = {name = 'Talon', count = 3},
	[10212] = {name = 'White Pearl', count = 2},
	[10213] = {name = 'Gold Ingot', count = 1},
	[10214] = {name = 'Opal', count = 3},
	[10215] = {name = 'Small Diamond', count = 2},
	[10216] = {name = 'Green Crystal Shard', count = 1},
	[10217] = {name = 'Black Pearl', count = 3},
	[10218] = {name = 'Emerald Bangle', count = 1},
	[10219] = {name = 'Green Gem', count = 1},
	[10220] = {name = 'Giant Shimmering Pearl', count = 1}
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chest = config[item.uid]
	if not chest then
		return true
	end
	if player:getStorageValue(item.uid) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The chest is empty.')
		return true
	end
	player:addItem(chest.name, chest.count, true)
	player:setStorageValue(item.uid, 1)
	player:setStorageValue(Storage.FirstDragon.ChestCounter, player:getStorageValue(Storage.FirstDragon.ChestCounter) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found ' ..chest.count.. ' ' ..chest.name..'.')
	player:addAchievementProgress('Treasure Hunter', 20)
	return true
end

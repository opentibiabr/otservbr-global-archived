local config = {
	[10200] = {name = 'Giant Shimmering Pearl', count = 1},
	[10201] = {name = 'Gold Nugget', count = 2},
	[10202] = {name = 'Blue Crystal Shard', count = 1},
	[10203] = {name = 'Violet Crystal Shard', count = 1},
	[10204] = {name = 'Green Crystal Splinter', count = 2},
	[10205] = {name = 'Red Gem', count = 1},
	[10206] = {name = 'Onyx Chip', count = 3},
	[10207] = {name = 'Platinum Coin', count = 3},
	[10208] = {name = 'Red Crystal Fragment', count = 2},
	[10209] = {name = 'Yellow Gem', count = 1},
	[10210] = {name = 'Talon', count = 3},
	[10211] = {name = 'White Pearl', count = 2},
	[10212] = {name = 'Gold Ingot', count = 1},
	[10213] = {name = 'Opal', count = 3},
	[10214] = {name = 'Small Diamond', count = 2},
	[10215] = {name = 'Green Crystal Shard', count = 1},
	[10216] = {name = 'Black Pearl', count = 3},
	[10217] = {name = 'Emerald Bangle', count = 1},
	[10218] = {name = 'Green Gem', count = 1},
	[10219] = {name = 'Giant Shimmering Pearl', count = 1}
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
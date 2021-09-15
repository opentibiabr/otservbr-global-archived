local UniqueTable = {
	[473] = {
		name = "giant shimmering pearl",
		count = 1
	},
	[474] = {
		name = "gold nugget",
		count = 2
	},
	[617] = {
		name = "blue crystal shard",
		count = 1
	},
	[616] = {
		name = "violet crystal shard",
		count = 1
	},
	[617] = {
		name = "green crystal splinter",
		count = 2
	},
	[857] = {
		name = "red gem",
		count = 1
	},
	[858] = {
		name = "onyx chip",
		count = 3
	},
	[912] = {
		name = "platinum coin",
		count = 3
	},
	[913] = {
		name = "red crystal fragment",
		count = 2
	},
	[922] = {
		name = "yellow gem",
		count = 1
	},
	[1099] = {
		name = "talon",
		count = 3
	},
	[1990] = {
		name = "white pearl",
		count = 2
	},
	[1991] = {
		name = "gold ingot",
		count = 1
	},
	[2139] = {
		name = "opal",
		count = 3
	},
	[12878] = {
		name = "small diamond",
		count = 2
	},
	[12879] = {
		name = "green crystal shard",
		count = 1
	},
	[2141] = {
		name = "black pearl",
		count = 3
	},
	[2142] = {
		name = "emerald bangle",
		count = 1
	},
	[2143] = {
		name = "green gem",
		count = 1
	},
	[2149] = {
		name = "giant shimmering pearl",
		count = 1
	}
}

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

for index, value in pairs(UniqueTable) do
	treasureChest:uid(index)
end

treasureChest:register()

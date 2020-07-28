local UniqueTable = {
	-- Dawnport vocation rewards
	-- Sorcerer
	[14025] = {
		itemBag = 1988,
		itemReward = {{2643, 1}, {2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2649, 1}},
		itemRewardContainer = {{7620, 5}, {18559, 1}},
		storage = Storage.Quest.Dawnport.VocationReward,
		value = 1
	},
	-- Druid
	[14026] = {
		itemBag = 1988,
		itemReward = {{2643, 1}, {2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2649, 1}},
		itemRewardContainer = {{7620, 5}, {18559, 1}},
		storage = Storage.Quest.Dawnport.VocationReward,
		value = 2
	},
	-- Paladin
	[14027] = {
		itemBag = 1988,
		itemReward = {{2643, 1}, {2389, 1}, {2660, 1}, {8923, 1}, {2461, 1}},
		itemRewardContainer = {{2544, 100}, {18559, 1}},
		storage = Storage.Quest.Dawnport.VocationReward,
		value = 3
	},
	-- Knight
	[14028] = {
		itemBag = 1988,
		itemReward = {{2643, 1}, {2509, 1}, {8602, 1}, {2465, 1}, {2460, 1}, {2478, 1}},
		itemRewardContainer = {{7618, 5}, {18559, 1}},
		storage = Storage.Quest.Dawnport.VocationReward,
		value = 4
	}
}

local vocationReward = Action()

function vocationReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.storage) >= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(1740) .. " is empty.")
		return true
	end

	for i = 1, #setting.itemReward do
		local itemid = setting.itemReward[i][1]
		local count = setting.itemReward[i][2]
		for c = 1, count do
			player:addItem(itemid, 1)
		end
	end
	local container = player:addItem(setting.itemBag)
	for v = 1, #setting.itemRewardContainer do
		local itemid = setting.itemRewardContainer[v][1]
		local count = setting.itemRewardContainer[v][2]
		if ItemType(itemid):isStackable() or ItemType(itemid):getCharges() then
			container:addItem(itemid, count)
		else
			for c = 1, count do
				container:addItem(itemid, 1)
			end
		end
	end
	player:setStorageValue(setting.storage, setting.value)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.itemBag) .. ".")
	return true
end

for index, value in pairs(UniqueTable) do
	vocationReward:uid(index)
end

vocationReward:register()

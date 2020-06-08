local vocationReward = Action()

function vocationReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.storage) >= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(setting.itemId) .. " is empty.")
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

for key = 25022,25025 do
	vocationReward:uid(key)
end

vocationReward:register()

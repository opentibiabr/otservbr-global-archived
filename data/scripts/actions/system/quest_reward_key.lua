-- This script loads key into any item.
-- You just need to add a new table in the data/startup/tables/chest.lua file and this script will pull everything from there.
local keyReward = Action()
function keyReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = ChestUnique[item.uid]
	if setting then
		if player:getStorageValue(setting.storage) < 0 then
			player:setStorageValue(setting.storage, 1)
			local key = player:addItem(setting.itemReward, 1)
			if key then
				key:setActionId(setting.keyAction)
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.itemReward) .. ".")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(setting.itemId) .. " is empty.")
		end
	end
	return true
end

for uniqueRange = 5000, 6000 do
	keyReward:uid(uniqueRange)
end

keyReward:register()

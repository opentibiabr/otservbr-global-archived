-- Common chest reward.
-- You just need to add a new table in the actions_uniques file and this script will pull everything from there.
-- Remember to add the uniqueid at the end of the script.
local commonReward = Action()

function commonReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = UniqueTable[item.uid]
	if setting then
		if player:getStorageValue(setting.storage) < 0 then
			local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
			if backpack and backpack:getEmptySlots(true) >= 1 then
				if (player:getFreeCapacity() / 100) > getItemWeight(setting.itemReward) then
					for i = 1, #setting.itemReward do
						local itemid = setting.itemReward[i][1]
						local count = setting.itemReward[i][2]
						if ItemType(itemid):isStackable() or ItemType(itemid):getCharges() then
							player:addItem(itemid, count)
							player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(itemid) .. ".")
							player:setStorageValue(setting.storage, 1)
						else
							for c = 1, count do
								player:setStorageValue(setting.storage, 1)
								player:addItem(setting.itemReward, 1)
								player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.itemReward) .. ".")
							end
						end
					end
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.itemReward) .. ". Weighing " .. getItemWeight(setting.itemReward) .. " oz it is too heavy.")
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.itemReward) .. ", but you have no room to take it")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(setting.itemId) .. " is empty.")
		end
	end
	return true
end

for uniqueids = 14001,16000 do
	commonReward:uid(uniqueids)
end
commonReward:register()

-- Common chest reward.
-- You just need to add a new table in the actions_uniques file and this script will pull everything from there.
-- Remember to add the uniqueid at the end of the script.
local commonReward = Action()

local function checkWeightAndBackpackRoom(player, itemWeight, message)
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	if not backpack or backpack:getEmptySlots(true) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message .. ", but you have no room to take it.")
		return false
	elseif (player:getFreeCapacity() / 100) < (itemWeight) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message .. ". Weighing " .. itemWeight .. " oz, it is too heavy for you to carry.")
		return false
	end
	return true
end

function commonReward.onUse(player, item, fromPosition, itemEx, toPosition)
	local setting = UniqueTable[item.uid]
	if setting then
		if player:getStorageValue(setting.storage) < 0 then			
			for i = 1, #setting.itemReward do						
				local itemid = setting.itemReward[i][1]
				local count = setting.itemReward[i][2]
				local itemDescriptions = getItemDescriptions(itemid)
				local itemName = itemDescriptions.name

				if count > 1 and (ItemType(itemid):isStackable() or ItemType(itemid):getCharges() > 0) then
					if (itemDescriptions.plural) then
						itemName = itemDescriptions.plural
					end
					local message = "You have found " .. count .. " " .. itemName
					if not (checkWeightAndBackpackRoom(player, getItemWeight(itemid)*count, message)) then
						return true
					end
					player:addItem(itemid, count)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message .. ".")
					player:setStorageValue(setting.storage, 1)
				else
					local itemArticle = itemDescriptions.article
					local message = "You have found " .. itemArticle .. " " .. itemName
					if not (checkWeightAndBackpackRoom(player, getItemWeight(itemid), message)) then
						return true
					end					
					for c = 1, count do						
						player:setStorageValue(setting.storage, 1)
						player:addItem(itemid, 1)
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message .. ".")
					end
				end
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

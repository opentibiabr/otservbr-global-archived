local gooeyMass = Action()

function gooeyMass.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if setting then
		if player:getStorageValue(setting.storage) < os.time() then
			local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
			if backpack and backpack:getEmptySlots(true) >= 1 then
				if (player:getFreeCapacity() / 100) > getItemWeight(setting.reward) then
					player:addItem(setting.reward)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.reward) .. ".")
					player:setStorageValue(setting.storage, os.time() + 7 * 24 * 60 * 60) -- 7 days
					return true
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.reward) .. ". Weighing " .. getItemWeight(setting.reward) .. " oz it is too heavy.")
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a " .. getItemName(setting.reward) .. ", but you have no room to take it")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The ".. getItemName(setting.itemId) .. " is empty.")
		end
	end
	return true
end

for key = 25001, 25016 do
	gooeyMass:uid(key)
end

gooeyMass:register()

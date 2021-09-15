local config = {
	[1319] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 2, setValue = 3},
	[1320] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 3, setValue = 4},
	[1321] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 4, setValue = 5},
	[1322] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 5, setValue = 6},
	[1323] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 6, setValue = 7},
	[1324] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 7, setValue = 8},
	[1325] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 8, setValue = 9},
	[1326] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 9, setValue = 10},
	[1327] = {itemId = 15895, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 10, setValue = 11},
}

local statuedeeplings = Action()

function statuedeeplings.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local key = config[item.uid]
		if key then
			if player:getStorageValue(key.storage) == key.getValue then
				if table.contains({key.itemId}, item.itemid) then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, key.msg)
					player:setStorageValue(key.storage, key.setValue)
				end
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Empty.")
			end
		end
	return true
end

for index, value in pairs(config) do
	statuedeeplings:uid(index)
end

statuedeeplings:register()

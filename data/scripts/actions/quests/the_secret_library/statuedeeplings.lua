local config = {
	[26671] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 2, setValue = 3},
	[26672] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 3, setValue = 4},
	[26673] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 4, setValue = 5},
	[26674] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 5, setValue = 6},
	[26675] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 6, setValue = 7},
	[26676] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 7, setValue = 8},
	[26677] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 8, setValue = 9},
	[26678] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 9, setValue = 10},
	[26679] = {itemId = 17240, msg = "The Njey will appreciate your help.", storage = Storage.TheSecretLibrary.LiquidDeath, getValue = 10, setValue = 11},
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

statuedeeplings:uid(26671, 26672, 26673, 26674, 26675, 26676, 26677, 26678, 26679)
statuedeeplings:register()
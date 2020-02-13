local config = {
	[57512] = {itemId = 35996, msg = "You bless the statue.", storage = Storage.KilmareshQuest.Sixth.Favor, getValue = 5, setValue = 6},
	[57513] = {itemId = 35997, msg = "You bless the statue.", storage = Storage.KilmareshQuest.Sixth.Favor, getValue = 6, setValue = 7},
	[57514] = {itemId = 35996, msg = "You bless the statue.", storage = Storage.KilmareshQuest.Sixth.Favor, getValue = 7, setValue = 8},
	[57515] = {itemId = 35997, msg = "You bless the statue.", storage = Storage.KilmareshQuest.Sixth.Favor, getValue = 8, setValue = 9},
	[57516] = {itemId = 35997, msg = "You bless the statue.", storage = Storage.KilmareshQuest.Sixth.Favor, getValue = 9, setValue = 10},
}

local estatua = Action()

function estatua.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local key = config[target.uid]
		if key then
			if player:getStorageValue(key.storage) == key.getValue then
				if table.contains({key.itemId}, target.itemid) then
					player:sendTextMessage(MESSAGE_INFO_DESCR, key.msg)
					player:setStorageValue(key.storage, key.setValue)
				end
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR,"Empty.")
			end
		end
	return true
end

estatua:id(36249)
estatua:register()
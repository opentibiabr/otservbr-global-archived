local config = {
	[26683] = {itemId = 32642, msg = "Success", storage = Storage.TheSecretLibrary.Mota, PegValue = 4, setaValue = 5, basin = 2605}, -- yellow
	[26682] = {itemId = 32641, msg = "Success", storage = Storage.TheSecretLibrary.Mota, PegValue = 5, setaValue = 6, basin = 2605}, -- green
	[26684] = {itemId = 32643, msg = "Success", storage = Storage.TheSecretLibrary.Mota, PegValue = 6, setaValue = 7, basin = 2605}, -- red
}

local energybasin = Action()

function energybasin.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local key = config[item.uid]
		if key then
			if player:getStorageValue(key.storage) == key.PegValue then
					player:removeItem(key.itemId, 1)
					player:sendTextMessage(MESSAGE_INFO_DESCR, key.msg)
					player:setStorageValue(key.storage, key.setaValue)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR,"sorry")
			end
		end
	return true
end

energybasin:uid(26682, 26683, 26684)
energybasin:register()




local config = {
	[26687] = {itemId = 11832, msg = "Success", storage = Storage.TheSecretLibrary.Mota, getValue = 9, setValue = 10},
}

local basinfire = Action()

function basinfire.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local key = config[target.uid]
		if key then
			if player:getStorageValue(key.storage) == key.getValue then
				if table.contains({key.itemId}, target.itemid) then
					player:sendTextMessage(MESSAGE_INFO_DESCR, key.msg)
					player:setStorageValue(key.storage, key.setValue)
					player:removeItem(32648, 1)
					player:setStorageValue(Storage.TheSecretLibrary.SkullDoor, 1)
				end
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR,"sorry")
			end
		end
	return true
end

basinfire:id(32648)
basinfire:register()
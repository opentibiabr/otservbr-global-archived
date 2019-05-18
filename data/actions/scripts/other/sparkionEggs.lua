function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


	local config = {
		[26194] = {mountId = 94, message = "You receive the permission to ride a sparkion"},
		[26340] = {mountId = 98, message = "You receive the permission to ride a neon sparkid"},
		[26341] = {mountId = 99, message = "You receive the permission to ride a vortexion"},
	}
	
	local mount = config[item.itemid]
	
	if not mount then
		return true
	end
	
	if not player:hasMount(mount.mountId) then
		player:addMount(mount.mountId)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		player:sendTextMessage(19, "You already have this mount")
	end
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end

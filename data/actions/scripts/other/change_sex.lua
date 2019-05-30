function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if not player:isPzLocked() then
		player:setSex(player:getSex() == 1 and 0 or 1)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'You successfully changed sex!')
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		item:remove(1)
		player:save()
		player:remove()
	end

		player:setStorageValue(Storage.Exaust.Time, os.time())

	return true
end 
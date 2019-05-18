function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end
	
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	item:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
	item:transform(math.random(7588, 7589))
	return true
end

local MusicEffect = {
	
	[3957] = CONST_ME_SOUND_YELLOW, --Cornucopia
	
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end
	
	item:getPosition():sendMagicEffect(MusicEffect[item.itemid])
	player:setStorageValue(Storage.Exaust.Time, os.time())
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	if target.actionid ~= 62378 then
		return false
	end

	if player:getStorageValue(Storage.DeeperBanutaShortcut) ~= 1 then
		player:removeItem(10523, 1)
		player:setStorageValue(Storage.DeeperBanutaShortcut, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a secret tunnel.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already discovered this secret.")
	end
	
	player:setStorageValue(Storage.Exaust.Time, os.time())
	
	return true
end

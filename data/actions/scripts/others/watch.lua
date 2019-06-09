function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The time is " .. getTibianTime() .. ".")
	return true
end

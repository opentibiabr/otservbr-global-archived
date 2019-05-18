function onRecord(current, old)
	addEvent(Game.broadcastMessage, 150, 'New record: ' .. current .. ' players online.', MESSAGE_STATUS_DEFAULT)
	return true
end

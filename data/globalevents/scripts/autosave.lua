local cleanMapAtSave = true

local function serverSave(interval)
	if cleanMapAtSave then
		cleanMap()
	end

	saveServer()
	Game.broadcastMessage('Server save complete. Next save in ' .. math.floor(interval / 60000) .. ' minutes!', MESSAGE_STATUS_WARNING)
end

function onThink(interval)
	Game.broadcastMessage('The server will save all accounts within 60 seconds. You might lag or freeze for 5 seconds, please find a safe place.', MESSAGE_STATUS_WARNING)
	addEvent(serverSave, 60000, interval)
	return true
end
local function ServerSave()
	if configManager.getBoolean(configKeys.CLEAN_MAP_AT_SERVER_SAVE) then
		cleanMap()
	end
	if configManager.getBoolean(configKeys.CLOSE_AT_SERVER_SAVE) then
		Game.setGameState(GAME_STATE_CLOSED)
	end
	if configManager.getBoolean(configKeys.SHUTDOWN_AT_SERVER_SAVE) then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end

	-- Updating daily reward next server save.
	updateGlobalStorage(DailyReward.storages.lastServerSave, os.time())
	
end

local function ServerSaveWarning(remaningTime)
	remaningTime = remaningTime - 60000

	if configManager.getBoolean(configKeys.NOTIFY_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in " .. (remaningTime/60000) .."  minute(s). Please logout.", MESSAGE_STATUS_WARNING)
	end

	if remaningTime > 60000 then
		addEvent(ServerSaveWarning, 60000, remaningTime)
	else
		addEvent(ServerSave, 60000)
	end
end

function onTime(interval)
	if configManager.getBoolean(configKeys.NOTIFY_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in 5 minutes. Please logout.", MESSAGE_STATUS_WARNING)
	end
	addEvent(ServerSaveWarning, 60000)	-- Next event in 1 minute(60000)

	return not configManager.getBoolean(configKeys.SHUTDOWN_AT_SERVER_SAVE)
end

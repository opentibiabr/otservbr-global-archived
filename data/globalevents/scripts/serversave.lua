
local function serverSave()
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

local function secondServerSaveWarning()
	if configManager.getBoolean(configKeys.NOTIFY_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in one minute. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(serverSave, 60000)
end

local function firstServerSaveWarning()
	if configManager.getBoolean(configKeys.NOTIFY_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in 3 minutes. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(secondServerSaveWarning, 180000)
end

function onTime(interval)
	if configManager.getBoolean(configKeys.NOTIFY_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in 5 minutes. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(firstServerSaveWarning, 300000)
	return not shutdownAtServerSave
end

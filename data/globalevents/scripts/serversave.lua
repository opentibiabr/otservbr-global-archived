local shutdownAtServerSave = true
local cleanMapAtServerSave = false
local closeAtServerSave = false

local function serverSave()
	if shutdownAtServerSave then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end
	if closeAtServerSave then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end
	if cleanMapAtServerSave then
		cleanMap()
	end

	-- Updating daily reward next server save.
	updateGlobalStorage(DailyReward.storages.lastServerSave, os.time())
	
end

local function secondServerSaveWarning()
	if configManager.getNumber(configKeys.NOTIFY_SAVEVERSER) then
		Game.broadcastMessage("Server is saving game in one minute. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(serverSave, 60000)
end

local function firstServerSaveWarning()
	if configManager.getNumber(configKeys.NOTIFY_SAVEVERSER) then
		Game.broadcastMessage("Server is saving game in 3 minutes. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(secondServerSaveWarning, 120000)
end

function onTime(interval)
	if configManager.getNumber(configKeys.NOTIFY_SAVEVERSER) then
		Game.broadcastMessage("Server is saving game in 5 minutes. Please logout.", MESSAGE_EVENT_ADVANCE)
	end
	addEvent(firstServerSaveWarning, 120000)
	return not shutdownAtServerSave
end

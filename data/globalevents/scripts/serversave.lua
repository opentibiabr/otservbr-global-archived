local shutdownAtServerSave = true
local closeAtServerSave = false
local cleanMapAtServerSave = false

local function serverSave()
	if shutdownAtServerSave then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end
	if closeAtServerSave then
		Game.setGameState(GAME_STATE_CLOSED)
	end
	if cleanMapAtServerSave then
		cleanMap()
	end
	-- Updating daily reward next server save.
	updateGlobalStorage(DailyReward.storages.lastServerSave, os.time())
end

local function secondServerSaveWarning()
	Game.broadcastMessage("Server is saving game in one minute. Please logout.", MESSAGE_STATUS_WARNING)
	addEvent(serverSave, 60000)
end

local function firstServerSaveWarning()
	Game.broadcastMessage("Server is saving game in 3 minutes. Please logout.", MESSAGE_STATUS_WARNING)
	addEvent(secondServerSaveWarning, 120000)
end

function onTime(interval)
	Game.broadcastMessage("Server is saving game in 5 minutes. Please logout.", MESSAGE_STATUS_WARNING)
	addEvent(firstServerSaveWarning, 120000)
	return not shutdownAtServerSave
end

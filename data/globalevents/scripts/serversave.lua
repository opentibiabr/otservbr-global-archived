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

local function ServerSaveWarning(time)
	-- minus one minutes
	local remaningTime = tonumber(time) - 60000
	if configManager.getBoolean(configKeys.NOTIFY_AT_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in " .. (remaningTime/60000) .."  minute(s). Please logout.", MESSAGE_STATUS_WARNING)
	end
	-- if greater than one minute, schedule another warning
	-- else the next event will be the server save
	if remaningTime > 60000 then
		addEvent(ServerSaveWarning, 60000, remaningTime)
	else
		addEvent(ServerSave, 60000)
	end
end

-- Function that is called by the global events when it reaches the time configured
-- interval is the time between the event start and the the effective save, it will send an notify message every minute
function onTime(interval)
	local remaningTime = tonumber(configKeys.NOTIFY_SERVER_SAVE_TIME * 60000)
	if configManager.getBoolean(configKeys.NOTIFY_AT_SERVER_SAVE) then
		Game.broadcastMessage("Server is saving game in " .. (remaningTime/60000) .."  minute(s). Please logout.", MESSAGE_STATUS_WARNING)
	end
	addEvent(ServerSaveWarning, 60000, remaningTime)	-- Schedule next event in 1 minute(60000)
	return not configManager.getBoolean(configKeys.SHUTDOWN_AT_SERVER_SAVE)
end

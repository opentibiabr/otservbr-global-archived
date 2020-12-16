local config = { --Times are in seconds
    saveInterval = 1 * 60,
    minSaveInterval = 1 * 30,
    maxSaveInterval = 2 * 30,
    storage = Storage.SavePlayer,
    consoleLog = false -- set as true to display logs in console
}

local function doSavePlayerAndHouse(cid)
		Player(cid):save()
		doSaveHouse({getHouseByPlayerGUID(getPlayerGUID(cid))})
		if config.consoleLog then
			print("Player "..Player(cid):getName().." has been saved")
		end
    return true
end

function saveRepeat(cid)
		if isPlayer(cid) then
			setPlayerStorageValue(cid, config.storage, addEvent(saveRepeat, config.saveInterval*1000, cid))
			doSavePlayerAndHouse(cid)
		end
	return true
end

local savePlayers = CreatureEvent("savePlayers")

function savePlayers.onLogin(cid)
	setPlayerStorageValue(cid, config.storage, addEvent(saveRepeat,
								math.random(config.minSaveInterval, config.maxSaveInterval) * 1000, cid.uid))
    return true
end

savePlayers:register()

local endSavePlayers = CreatureEvent("endSavePlayers")

function endSavePlayers.onLogout(cid)
		doSaveHouse({getHouseByPlayerGUID(getPlayerGUID(cid))})
		stopEvent(getPlayerStorageValue(cid, config.storage))
    return true
end

endSavePlayers:register()

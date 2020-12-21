local config = {
	-- Ab'dendriel
	[1] = {
		city = "Ab'dendriel",
		mapName = "abdendriel",
		gate = {
			position = Position(32680, 31719, 7),
			itemId = 6116,
			actionId = 9711
		}
	}
}

local function setupGate(gate)	
	local item = Tile(gate.position):getItemById(gate.itemId)
	if item then
		item:setActionId(gate.actionId)
		print('>> Fury gate setuped on ' .. item:getName() .. ' id: ' .. gate.itemId .. ' aid: ' .. gate.actionId)
	else
		print('>> Unable to setupGate item')
	end
end

local furygates = GlobalEvent("furygates")

function furygates.onStartup(interval)
	--local gateId = math.random(1, 6)
	local gateId = 1
	
	Game.loadMap('data/world/furygates/' .. config[gateId].mapName .. '.otbm')
	
	-- Schedule gate setup to give time to be loaded
	-- Here isn't loaded yet, loads after serverstartup loadCustomMaps()
	addEvent(setupGate, 5000, config[gateId].gate)
	
	setGlobalStorageValue(GlobalStorage.FuryGates, gateId)
	
	print('>> Fury Gate will be active in ' .. config[gateId].city .. ' today')
	
	return true
end

furygates:register()

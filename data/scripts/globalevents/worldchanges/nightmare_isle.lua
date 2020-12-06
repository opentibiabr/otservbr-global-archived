local config = {
	-- ankrahmun - north
	[1] = {
		mapName = "ankrahmun-north",
		displayName = "north of Ankrahmun"
	},
	-- darashia - west
	[2] = {
		mapName = "darashia-west",
		displayName = "west of Darashia"
	},
	-- darashia - north
	[3] = {
		mapName = "darashia-north",
		displayName = "north of Darashia"
	}
}

local NightmareIsle = GlobalEvent("NightmareIsle")
function NightmareIsle.onStartup(interval)
	local select = config[math.random(#config)]
	Game.loadMap('data/world/nightmareisle/' .. select.mapName .. '.otbm')
	print('>> Nightmare Isle will be active '.. select.displayName ..' today')
	
	setGlobalStorageValue(GlobalStorage.NightmareIsle, 1)
		
	return true
end
NightmareIsle:register()

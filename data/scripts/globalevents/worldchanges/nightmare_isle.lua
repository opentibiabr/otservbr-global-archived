local config = {
	-- ankrahmun - north
	[1] = {
		mapName = "ankrahmun-north"
	},
	-- darashia - west
	[2] = {
		mapName = "darashia-west"
	},
	-- darashia - north
	[3] = {
		mapName = "darashia-north"
	}
}

local NightmareIsle = GlobalEvent("NightmareIsle")
function NightmareIsle.onStartup(interval)
	local chance = math.random(1, 3)
	local randTown = config[math.random(#config)]
	if (chance == 1) then -- ankrahmun - north
		Game.loadMap('data/world/nightmareisle/' .. randTown.mapName .. '.otbm')
		print('>> Nightmare Isle will be active north of Ankrahmun today')
	elseif (chance == 2) then -- darashia - west
		Game.loadMap('data/world/nightmareisle/' .. randTown.mapName .. '.otbm')
		print('>> Nightmare Isle will be active west of Darashia today')
	elseif (chance == 3) then -- darashia - north
		Game.loadMap('data/world/nightmareisle/' .. randTown.mapName .. '.otbm')
		print('>> Nightmare Isle will be active north of Darashia today')
	end
	setGlobalStorageValue(GlobalStorage.NightmareIsle, 1)
		
	return true
end
NightmareIsle:register()

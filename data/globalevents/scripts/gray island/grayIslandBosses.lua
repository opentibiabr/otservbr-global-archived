-- <globalevent type="startup" name="grayIslandBosses" script="spawn/grayIslandBosses.lua" />

local config = {
	teleportId = 1387,
	dias = {
		["Saturday"] = {Position(33649, 31261, 11), Position(33647, 31254, 11)}, -- tanjis
		
		["Friday"] = {Position(33558, 31282, 11), Position(33545, 31263, 11)}, -- jaul
		
		
		["Sunday"] = {Position(33438, 31248, 11), Position(33419, 31255, 11)}, -- obujos
	}
}

function onStartup()

	local dia = config.dias[os.date("%A")]

	if dia then
		local item = Game.createItem(config.teleportId, 1, dia[1])
		if not item:isTeleport() then
			item:remove()
			return false
		end
		item:setDestination(dia[2])
	end

	return true
end
local config2 = {
	teleportId2 = 5659,
	dias2 = {
		["Sunday"] = {Position(32024, 32830, 4)}, -- Domingo MINOS
		["Wednesday"] = {Position(33669, 31887, 5)}, -- Quarta-feira	 IRA DO MAL	
		["Friday"] = {Position(32024, 32830, 4)}, -- Sexta-feira   MINOS
	}
}

function onStartup()

	local dia = config2.dias2[os.date("%A")]

	if dia then
		Game.createItem(config2.teleportId2, 1, dia[1])
	end

	return true
end
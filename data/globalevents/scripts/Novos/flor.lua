local config = {
	teleportId = 5687,
	dias = {
		["Saturday"] = {Position(32024, 32830, 4)}, -- Sábado IRA DO MAL
		["Monday"] = {Position(32024, 32830, 4)}, -- Segunda-feira MINOS
		["Tuesday"] = {Position(32024, 32830, 4)}, -- Terça-feira GOLENS
		["Thursday"] = {Position(32024, 32830, 4)}, -- Quinta-feira		 MINOS
	}
}

function onStartup()

	local dia = config.dias[os.date("%A")]

	if dia then
		Game.createItem(config.teleportId, 1, dia[1])
	end

	return true
end
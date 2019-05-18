local config = {
	teleportId = 1285,
	dias = {
		["Saturday"] = {Position(33669, 31887, 5), Position(33647, 31254, 11)}, -- Sábado IRA DO MAL
		["Sunday"] = {Position(33667, 31887, 5), Position(33647, 31254, 11)}, -- Domingo MINOS
		["Monday"] = {Position(33667, 31887, 5), Position(33647, 31254, 11)}, -- Segunda-feira MINOS
		["Tuesday"] = {Position(33665, 31887, 5), Position(33647, 31254, 11)}, -- Terça-feira GOLENS
		["Wednesday"] = {Position(33669, 31887, 5), Position(33647, 31254, 11)}, -- Quarta-feira	 IRA DO MAL	
		["Thursday"] = {Position(33667, 31887, 5), Position(33545, 31263, 11)}, -- Quinta-feira		 MINOS
		["Friday"] = {Position(33667, 31887, 5), Position(33419, 31255, 11)}, -- Sexta-feira   MINOS
	}
}

function onStartup()

	local dia = config.dias[os.date("%A")]

	if dia then
		Game.createItem(config.teleportId, 1, dia[1])
	end

	return true
end
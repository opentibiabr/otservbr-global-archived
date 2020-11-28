local weatherstartup = GlobalEvent("WeatherStartup")
local weather = GlobalEvent("Weather")
local weatherrain = GlobalEvent("WeatherRain")

function weatherstartup.onStartup()
	local rain = math.random(100)
	if rain>95 then
		Game.setStorageValue('Weather',1)
	else
		Game.setStorageValue('Weather',0)
	end
	return true
end

function weather.onThink(interval, lastExecution)
	local rain = math.random(100)
	if rain>95 then
		Game.setStorageValue('Weather',1)
	else
		Game.setStorageValue('Weather',0)
	end
	return true
end

function weatherrain.onThink(interval, lastExecution)
	if Game.getStorageValue('Weather')==1 then
		local players = Game.getPlayers()
		if #players == 0 then
			return true
		end
		local player
		for i = 1, #players do
			player = players[i]
			player:sendWeatherEffect(weatherConfig.groundEffect, weatherConfig.fallEffect, weatherConfig.thunderEffect)
		end
	end
	return true
end

weatherstartup:register()
weather:interval(200000) -- how often to randomize rain / weather
weather:register()
weatherrain:interval(50) -- less rain = greater value
weatherrain:register()

-- Should Cillia spawn as in real tibia?
local spawnByDay = true
local spawnDay = 'Sunday'
local spawnPosition = Position(32392, 32197, 8)

function onStartup()
	if spawnByDay then
		if os.date('%A') == spawnDay then
			Game.createNpc('Cillia', spawnPosition, false, true)
		end
	else
		Game.createNpc('Cillia', spawnPosition, false, true)
	end

	return true
end

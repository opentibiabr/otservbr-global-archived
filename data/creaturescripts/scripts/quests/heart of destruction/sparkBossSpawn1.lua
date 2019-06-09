local function sparkSpawn(pos)
	if spawningSpark == true then
		Game.createMonster("Spark of Destruction1", pos, false, true)
		spawningSpark = false
	end
	return true
end

function onDeath(creature)
	local positions = {
		{x = 32244, y = 31367, z = 14},
		{x = 32239, y = 31371, z = 14},
		{x = 32245, y = 31374, z = 14},
		{x = 32249, y = 31371, z = 14},
	}

	local pos = positions[math.random(1, #positions)]

	addEvent(sparkSpawn, 7000, pos)
	spawningSpark = true
	return true
end

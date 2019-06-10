local function sparkSpawn(pos)
	if spawningSpark == true then
		Game.createMonster("Spark of Destruction3", pos, false, true)
		spawningSpark = false
	end
	return true
end

function onDeath(creature)
	local positions = {
		{x = 32299, y = 31368, z = 14},
		{x = 32294, y = 31370, z = 14},
		{x = 32299, y = 31373, z = 14},
		{x = 32303, y = 31370, z = 14},
	}

	local pos = positions[math.random(1, #positions)]

	addEvent(sparkSpawn, 7000, pos)
	spawningSpark = true
	return true
end

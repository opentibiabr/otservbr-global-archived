local function sparkSpawn(pos)
	if spawningSpark == true then
		Game.createMonster("Spark of Destruction2", pos, false, true)
		spawningSpark = false
	end
	return true
end

function onDeath(creature)
	local positions = {
		{x = 32271, y = 31312, z = 14},
		{x = 32267, y = 31315, z = 14},
		{x = 32271, y = 31318, z = 14},
		{x = 32275, y = 31315, z = 14},
	}

	local pos = positions[math.random(1, #positions)]

	addEvent(sparkSpawn, 7000, pos)
	spawningSpark = true
	return true
end

function onDeath(creature)

	if chargingOutKilled == false then
		local from = creature:getId()
		local monster = Game.createMonster("Outburst", {x = 32234, y = 31285, z = 14}, false, true)
		monster:addHealth(-monster:getHealth() + outburstHealth, false)
	end

	return true
end

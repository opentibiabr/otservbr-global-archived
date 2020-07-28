function onDeath(creature)
	if chargingOutKilled == false then
		local monster = Game.createMonster("outburst", {x = 32234, y = 31285, z = 14}, false, true)
		monster:addHealth(-monster:getHealth() + outburstHealth, false)
	end
	return true
end

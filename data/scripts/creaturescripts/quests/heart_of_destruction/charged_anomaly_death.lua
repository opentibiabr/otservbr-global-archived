local chargedAnomalyDeath = CreatureEvent("ChargedAnomalyDeath")
function chargedAnomalyDeath.onDeath(creature)
	if Game.getStorageValue(14322) == 1 then
		local monster = Game.createMonster("anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		monster:addHealth(-72500, false)
	elseif Game.getStorageValue(14322) == 2 then
		local monster = Game.createMonster("anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		monster:addHealth(-145000, false)
	elseif Game.getStorageValue(14322) == 3 then
		local monster = Game.createMonster("anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		monster:addHealth(-217500, false)
	elseif Game.getStorageValue(14322) == 4 then
		local monster = Game.createMonster("anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		monster:addHealth(-275500, false)
	end
	return true
end

chargedAnomalyDeath:register()

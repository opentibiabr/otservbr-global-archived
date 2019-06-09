function onThink(creature)

	if not creature:isCreature() then return false end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	local from = creature:getId()

	if hp <= 75 and Game.getStorageValue(14322) == 0 then
		creature:remove()
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31253, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31255, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31249, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31249, z = 14}, false, true)
		local monster = Game.createMonster("Charged Anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		Game.setStorageValue(14322, 1)
	elseif hp <= 50 and Game.getStorageValue(14322) == 1 then
		creature:remove()
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31253, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31255, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31249, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31249, z = 14}, false, true)
		local monster = Game.createMonster("Charged Anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		Game.setStorageValue(14322, 2)
	elseif hp <= 25 and Game.getStorageValue(14322) == 2 then
		creature:remove()
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31253, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31255, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31249, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31249, z = 14}, false, true)
		local monster = Game.createMonster("Charged Anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		Game.setStorageValue(14322, 3)
	elseif hp <= 5 and Game.getStorageValue(14322) == 3 then
		creature:remove()
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31253, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31255, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32274, y = 31249, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32267, y = 31249, z = 14}, false, true)
		local monster = Game.createMonster("Charged Anomaly", {x = 32271, y = 31249, z = 14}, false, true)
		Game.setStorageValue(14322, 4)
	end

    return true
end

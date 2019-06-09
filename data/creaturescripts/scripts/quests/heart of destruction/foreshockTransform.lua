function onThink(creature)

	if not creature:isCreature() then return false end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100

	if realityQuakeStage == 0 then
		if hp <= 80 and foreshockStage == 0 then
			foreshockHealth = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
				Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
			foreshockStage = 1
		elseif hp <= 60 and foreshockStage == 1 then
			foreshockHealth = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
				Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
			foreshockStage = 2
		elseif hp <= 40 and foreshockStage == 2 then
			foreshockHealth = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
				Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
			foreshockStage = 3
		elseif hp <= 25 and foreshockStage == 3 then
			foreshockHealth = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
				Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
			foreshockStage = 4
		elseif hp <= 10 and foreshockStage == 4 then
			foreshockHealth = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
				Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
			foreshockStage = -1
		end
	end

    return true
end

function onThink(creature)
	if not creature:isCreature() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if realityQuakeStage == 0 then
		if hp <= 80 and aftershockStage == 0 then
			aftershockHealth = creature:getHealth()
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("foreshock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + foreshockHealth, false)
			Game.createMonster("spark of destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32212, y = 31246, z = 14}, false, true)
			aftershockStage = 1
		elseif hp <= 60 and aftershockStage == 1 then
			aftershockHealth = creature:getHealth()
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("foreshock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + foreshockHealth, false)
			Game.createMonster("spark of destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32212, y = 31246, z = 14}, false, true)
			aftershockStage = 2
		elseif hp <= 40 and aftershockStage == 2 then
			aftershockHealth = creature:getHealth()
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("foreshock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + foreshockHealth, false)
			Game.createMonster("spark of destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32212, y = 31246, z = 14}, false, true)
			aftershockStage = 3
		elseif hp <= 25 and aftershockStage == 3 then
			aftershockHealth = creature:getHealth()
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("foreshock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + foreshockHealth, false)
			Game.createMonster("spark of destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32212, y = 31246, z = 14}, false, true)
			aftershockStage = 4
		elseif hp <= 10 and aftershockStage == 4 then
			aftershockHealth = creature:getHealth()
			local from = creature:getId()
			creature:remove()
			local monster = Game.createMonster("aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
			Game.createMonster("spark of destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("spark of destruction", {x = 32212, y = 31246, z = 14}, false, true)
			aftershockStage = -1
		end
	end
	return true
end

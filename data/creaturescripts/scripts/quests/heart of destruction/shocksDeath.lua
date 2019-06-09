function onDeath(creature)

	local name = creature:getName()

	if name == "Foreshock" and realityQuakeStage == 0 then
		if realityQuakeStage == 0 then
			local from = creature:getId()
			local monster = Game.createMonster("Aftershock", {x = 32208, y = 31248, z = 14}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, false)
			Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
		end
	elseif name == "Aftershock" and realityQuakeStage == 0 then
		local from = creature:getId()
		local monster = Game.createMonster("Foreshock", {x = 32208, y = 31248, z = 14}, false, true)
		monster:addHealth(-monster:getHealth() + aftershockHealth, false)
		Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
	end

	realityQuakeStage = realityQuakeStage + 1

	if realityQuakeStage == 2 then
		local from = creature:getId()
		local pos = creature:getPosition()
		local monster = Game.createMonster("Realityquake", pos, false, true)
		Game.createMonster("Spark of Destruction", {x = 32203, y = 31246, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32205, y = 31251, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32210, y = 31251, z = 14}, false, true)
		Game.createMonster("Spark of Destruction", {x = 32212, y = 31246, z = 14}, false, true)
	end

	return true
end

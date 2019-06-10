function onThink(creature)
	if not creature:isCreature() then return false end
	if eradicatorReleaseT == true then
		if eradicatorWeak == 0 then
			local pos = creature:getPosition()
			local health = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()

			creature:remove()

			local monster = Game.createMonster("Eradicator2", pos, false, true)
			monster:addHealth(-monster:getHealth() + health, false)
				Game.createMonster("Spark of Destruction", {x = 32304, y = 31282, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32305, y = 31287, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32312, y = 31287, z = 14}, false, true)
			Game.createMonster("Spark of Destruction", {x = 32314, y = 31282, z = 14}, false, true)
			eradicatorWeak = 1 -- Eradicator Form
			eradicatorReleaseT = false -- Liberar Spell
			areaEradicator2 = addEvent(function() eradicatorReleaseT = true end, 9000)
		elseif eradicatorWeak == 1 then
			local pos = creature:getPosition()
			local health = creature:getHealth()
			-- transferencia dos pontos
			local from = creature:getId()

			creature:remove()

			local monster = Game.createMonster("Eradicator", pos, false, true)
			monster:addHealth(-monster:getHealth() + health, false)
				eradicatorWeak = 0
			eradicatorReleaseT = false -- Liberar Spell
			areaEradicator2 = addEvent(function() eradicatorReleaseT = true end, 74000)
		end
	end
    return true
end

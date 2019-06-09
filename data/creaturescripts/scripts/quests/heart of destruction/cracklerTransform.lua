function onThink(creature)

	if not creature:isCreature() then return false end

	local pos = creature:getPosition()
	local health = creature:getHealth()

	if cracklerTransform == true then
		creature:remove()
		local monster = Game.createMonster("Depolarized Crackler", pos, false, true)
		monster:addHealth(-monster:getHealth() + health, false)
	end

    return true
end

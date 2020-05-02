function onThink(creature)
	if not creature:isCreature() then
		return false
	end

	if cracklerTransform == false then
		creature:remove()
		local monster = Game.createMonster("Crackler", creature:getPosition(), false, true)
		monster:addHealth(-monster:getHealth() + creature:getHealth(), false)
	end
	return true
end

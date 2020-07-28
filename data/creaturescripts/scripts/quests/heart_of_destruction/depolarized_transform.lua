function onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	if cracklerTransform == false then
		local monster = Game.createMonster("Crackler", creature:getPosition(), false, true)
		monster:addHealth(-monster:getHealth() + creature:getHealth(), false)
		creature:remove()
	end
	return true
end

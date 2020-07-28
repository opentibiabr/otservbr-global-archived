function onThink(creature)
	if not creature or not creature:isMonster() then
		return true
	end

	if cracklerTransform == true then
		local monster = Game.createMonster("depolarized crackler", creature:getPosition(), false, true)
		monster:addHealth(-monster:getHealth() + creature:getHealth(), false)
		creature:remove()
	end

	return true
end

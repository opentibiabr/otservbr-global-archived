function onThink(creature)
	if not creature:isMonster() then
		return true
	end

	if cracklerTransform == true then
		creature:remove()
		local monster = Game.createMonster("depolarized crackler", creature:getPosition(), false, true)
		monster:addHealth(-monster:getHealth() + creature:getHealth(), false)
	end

	return true
end

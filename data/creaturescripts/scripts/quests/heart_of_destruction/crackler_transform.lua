function onThink(creature)
	if not creature:isMonster() then
		return true
	end

	if cracklerTransform == true then
		local monster = Game.createMonster("depolarized crackler", creature:getPosition(), false, true)
		creature:remove()
		monster:addHealth(-monster:getHealth() + creature:getHealth(), false)
	end

	return true
end

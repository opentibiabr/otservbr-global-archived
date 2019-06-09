function onDeath(creature, target)
	if not creature or not creature:isMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local pos = creature:getPosition()
	if monsterName == "leiden" then
		local monster = Game.createMonster("Ravennous Hunger", pos)
	elseif monsterName == "the sinister hermit" then
		local monster = Game.createMonster("The Souldespoiler", pos)
	end

	return true
end

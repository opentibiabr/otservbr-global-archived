function onRaid()
	local monster = Game.createMonster("Ferumbras", Position(32124, 32687, 4))
	if monster then
		monster:setReward(true)
	end
end


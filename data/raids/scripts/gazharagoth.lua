function onRaid()
	local monster = Game.createMonster("Gaz'Haragoth", Position(33538, 32381, 12))
	if monster then
		monster:setReward(true)
	end
end

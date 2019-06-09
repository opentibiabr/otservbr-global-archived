function onRaid()
	local monster = Game.createMonster("Hirintror", Position(32101, 31167, 9))
	if monster then
		monster:setReward(true)
	end
end

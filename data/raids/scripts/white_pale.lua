function onRaid()
	local monster = Game.createMonster("White Pale", Position(33264, 31875, 11))
	if monster then
		monster:setReward(true)
	end
end

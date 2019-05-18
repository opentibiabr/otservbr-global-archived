function onRaid()
	local monster = Game.createMonster("Orshabaal", Position(33118, 31699, 7))
	if monster then
		monster:setReward(true)
	end
end

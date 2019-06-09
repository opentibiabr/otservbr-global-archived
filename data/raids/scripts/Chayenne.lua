function onRaid()
	local monster = Game.createMonster("Chayenne", Position(32799, 31604, 7))
	if monster then
		monster:setReward(true)
	end
end

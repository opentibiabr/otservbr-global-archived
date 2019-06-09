function onRaid()
	local monster = Game.createMonster("Zushuka", Position(31941, 31388, 9))
	if monster then
		monster:setReward(true)
	end
end

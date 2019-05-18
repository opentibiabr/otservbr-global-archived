function onRaid()
	local monster = Game.createMonster("Tyrn", Position(33094, 32404, 13))
	if monster then
		monster:setReward(true)
	end
end

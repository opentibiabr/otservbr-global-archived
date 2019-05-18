function onRaid()
	local monster = Game.createMonster("The Welter", Position(33026, 32660, 5))
	if monster then
		monster:setReward(true)
	end
end

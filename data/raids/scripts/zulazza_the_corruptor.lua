function onRaid()
	local monster = Game.createMonster("Zulazza the Corruptor", Position(33348, 31611, 1))
	local monster1 = Game.createMonster("Chizzoron the Distorter", Position(33343, 31608, 2))
	if monster then
		monster:setReward(true)
	end
	if monster1 then
		monster1:setReward(true)
	end
end

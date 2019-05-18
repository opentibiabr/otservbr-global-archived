function onRaid()
	local monster = Game.createMonster("Zulazza the Corruptor", Position(33343, 31608, 2))
	if monster then
		monster:setReward(true)
	end
end

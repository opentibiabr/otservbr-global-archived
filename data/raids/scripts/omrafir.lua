function onRaid()
	local monster = Game.createMonster("Omrafir", Position(33587, 32378, 12))
	if monster then
		monster:setReward(true)
	end
end

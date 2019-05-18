function onRaid()
	local monster = Game.createMonster("Ocyakao", Position(32353, 31052, 7))
	if monster then
		monster:setReward(true)
	end
end

function onRaid()
	local monster = Game.createMonster("Weakened Shlorg", Position(33164, 31716, 9))
	if monster then
		monster:setReward(true)
	end
end

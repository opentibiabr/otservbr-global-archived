function onRaid()
	local monster = Game.createMonster("The Pale Count", Position(32969, 32420, 15))
	if monster then
		monster:setReward(true)
	end
end

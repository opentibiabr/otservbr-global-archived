function onRaid()
	local monster = Game.createMonster("Furyosa", Position(33281, 31804, 15))
	if monster then
		monster:setReward(true)
	end
end

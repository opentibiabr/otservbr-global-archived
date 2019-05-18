function onRaid()
	local monster = Game.createMonster("Ghazbaran", Position(32228, 31163, 15))
	if monster then
		monster:setReward(true)
	end
end

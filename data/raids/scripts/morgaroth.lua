function onRaid()
	local monster = Game.createMonster("Morgaroth", Position(32063, 32612, 14))
	if monster then
		monster:setReward(true)
	end
end

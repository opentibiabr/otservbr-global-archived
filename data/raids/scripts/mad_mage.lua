function onRaid()
	local monster = Game.createMonster("Mad Mage", Position(33360, 31873, 9))
	if monster then
		monster:setReward(true)
	end
end

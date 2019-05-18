function onRaid()
	local monster = Game.createMonster("Mawhawk", Position(33704, 32461, 7)) -- 33704" y="32461" z="7"
	if monster then
		monster:setReward(true)
	end
end

function onCreatureAppear(self, creature)
	if self == creature then
		local spectators = Game.getSpectators(Position(33644, 32757, 11), false, false, 10, 10, 10, 10)
		for i = 1, #spectators do
			local master = spectators[i]
			if master:getMaxHealth() == 300000 and not master:getMaster() then
				creature:setMaster(master)
			end
		end
	end
end

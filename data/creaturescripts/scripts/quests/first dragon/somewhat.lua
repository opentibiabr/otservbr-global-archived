function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local spectators = Game.getSpectators(Position(33617, 31023, 14), false, false, 14, 14, 14, 14)
		for i = 1, #spectators do
			local spec = spectators[i]
			if spec:getName():lower() == 'unbeatable dragon' or spec:getName():lower() == 'somewhat beatable' then
				return true
			end
		end
		for b = 1, 10 do
			Game.createMonster('Dragon Essence', Position(math.random(33609, 33624), math.random(31017, 31028), 14), true, true)
		end
	return true
end

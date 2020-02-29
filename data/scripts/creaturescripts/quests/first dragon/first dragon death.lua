function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local spectators = Game.getSpectators(Position(33617, 31023, 14), false, false, 14, 14, 14, 14)
		for i = 1, #spectators do
			local spec = spectators[i]
			if spec:isPlayer() then
				spec:teleportTo(Position(math.random(33616, 33617), math.random(31027, 31029, 13)))
				spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				spec:setStorageValue(Storage.FirstDragon.Feathers, 1)
			end
		end
	return true
end

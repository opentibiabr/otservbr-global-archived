function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	local position = targetMonster:getPosition()
	if not targetMonster or targetMonster:getName():lower() ~= 'ferumbras soul splinter' then
		return true
	end
	local m = Game.createMonster('Ferumbras Essence', position, true, true)
	if not m then
		return true
	end
	return true
end

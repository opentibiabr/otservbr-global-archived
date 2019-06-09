function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	local name = targetMonster:getName()
	local position = targetMonster:getPosition()
	if not targetMonster or targetMonster:getName():lower() ~= 'zamulosh' and not targetMonster:getMaster() then
		return true
	end
	local m = Game.createMonster('Zamulosh3', position, true, true)
	if not m then
		return true
	end
	return true
end
function onThink(creature)
	local spectators = Game.getSpectators(Position(33644, 32757, 11), false, false, 10, 10, 10, 10)
	for i = 1, #spectators do
		local master = spectators[i]
		if master:getMaxHealth() == 300000 and not master:getMaster() then
			master:addSummon(creature)
		end
	end
end

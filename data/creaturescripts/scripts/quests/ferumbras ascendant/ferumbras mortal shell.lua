function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	local name = targetMonster:getName()
	if not targetMonster or targetMonster:getName():lower() ~= 'destabilized ferumbras' then
		return true
	end
	local m = Game.createMonster('Ferumbras Mortal Shell', Position(33392, 31473, 14), true, true)
	if not m then
		return true
	end
	m:say('AAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHH!', TALKTYPE_MONSTER_SAY)
	lasthitkiller:say('FINALY YOU FORCED FERUMBRAS BACK INTO A MORTAL FORM - HE IS NOT AMUSED!', TALKTYPE_MONSTER_SAY, nil, nil, Position(33392, 31475, 14))
	return true
end

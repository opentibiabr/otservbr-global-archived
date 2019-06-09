function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'death dragon' then
		return true
	end
	local position = creature:getPosition()
	local m = addEvent(Game.createMonster, 1 * 1000, 'death dragon', position, true, true)
	if not m then
		return true
	end
	local spectators = Game.getSpectators(targetMonster:getPosition(), false, false, 10, 10, 10, 10)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isMonster() and spectator:getName():lower() == 'ragiaz' then
			spectator:say('Ragiaz power revives his minion!', TALKTYPE_MONSTER_SAY)
			return true
		end
	end
	return true
end

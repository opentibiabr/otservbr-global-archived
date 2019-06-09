function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster then
		return true
	end
	if creature:getPosition() == Position(33608, 31023, 14) and Tile(Position(33608, 31023, 14)):getItemById(27645) then
		Game.createMonster('Angry Plant', creature:getPosition(), true, true)
	end
	creature:say('The fertile spirit brings a plant monster to life!', TALKTYPE_MONSTER_SAY)
	addEvent(Game.createMonster, 30 * 1000, 'Spirit of Fertility', Position(33626, 31023, 14), true, true)
	return true
end

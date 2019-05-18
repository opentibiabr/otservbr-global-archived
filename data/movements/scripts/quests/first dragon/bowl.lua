function onStepIn(creature, item, position, fromPosition)
	if creature:getName():lower() ~= 'unbeatable dragon' or creature:isPlayer() then
		return true
	end
	creature:say('An allergic reaction weakens the dragon!', TALKTYPE_MONSTER_SAY)
	creature:remove()
	Game.createMonster('Somewhat Beatable', position, true, true)
	item:remove()
	return true
end

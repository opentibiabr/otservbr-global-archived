local words = {
	'YOU ARE DREAMING !',
	'WAKE UP !',
	'TIC TAC',
	'TAC',
	'TIC'
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	position.x = position.x + math.random(-3, 3)
	position.y = position.y + math.random(-3, 3)
	player:say(words[math.random(#words)], TALKTYPE_MONSTER_SAY, false, 0, position)
	return true
end

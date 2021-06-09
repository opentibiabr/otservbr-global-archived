local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	creature:teleportTo(Position(math.random(33704, 33718), math.random(32040, 32053), 15))
	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return
end

spell:name("maxxenTeleport")
spell:words("###428")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	local vocation = creature:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.PALADIN then
		return creature:conjureItem(0, 23839, 3, CONST_ME_MAGIC_BLUE)
	else
		creature:sendCancelMessage(RETURNVALUE_YOURVOCATIONCANNOTUSETHISSPELL)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end

spell:name("Arrow Call")
spell:id(176)
spell:words("exevo infir con")
spell:level(1)
spell:mana(10)
spell:soul(1)
spell:group("support")
spell:isAggressive(false)
spell:cooldown(2 *1000)
spell:groupCooldown(2 *1000)
spell:needLearn(false)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()

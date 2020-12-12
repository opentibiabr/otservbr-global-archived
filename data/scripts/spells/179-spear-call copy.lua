local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	local vocation = creature:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.PALADIN then
		return creature:conjureItem(0, 2389, 1, CONST_ME_MAGIC_BLUE)
	else
		creature:sendCancelMessage(RETURNVALUE_YOURVOCATIONCANNOTUSETHISSPELL)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end

spell:name("Spear Call")
spell:id(179)
spell:words("adori spear")
spell:level(1)
spell:mana(20)
spell:soul(20)
spell:group("support")
spell:isAggressive(false)
spell:cooldown(5 *1000)
spell:groupCooldown(2 *1000)
spell:needLearn(false)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(2260, 2305, 2)
end

spell:name("Fire Bomb Rune")
spell:words("adevo mas flam")
spell:group("support")
spell:vocation("druid;true", "elder druid;true", "sorcerer;true", "master sorcerer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(27)
spell:mana(600)
spell:soul(4)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()

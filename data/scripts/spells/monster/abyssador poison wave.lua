	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)

	arr = {
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

	local area = createCombatArea(arr)
	combat:setArea(area)


	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 20000)
	condition:setFormula(-0.70, 0, -0.85, 0)
	combat:addCondition(condition)

	local spell = Spell("instant")

	function spell.onCastSpell(creature, var)
		return combat:execute(creature, var)
	end


spell:name("abyssador poison wave")
spell:words("###87")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needDirection(true)
spell:register()
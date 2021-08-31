	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 25000)
	condition:setFormula(-0.7, 0, -0.9, 0)
	combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("blightwalker paralyze")
spell:words("###209")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needTarget(true)
spell:needLearn(true)
spell:register()
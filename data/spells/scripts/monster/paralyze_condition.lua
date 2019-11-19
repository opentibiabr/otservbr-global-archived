local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-1, 45, -1, 45)
combat:addCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
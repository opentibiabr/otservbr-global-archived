local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 130)
combat:addCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ROOTS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_LEAFSTAR)

local condition = Condition(CONDITION_ROOTED)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
combat:addCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end

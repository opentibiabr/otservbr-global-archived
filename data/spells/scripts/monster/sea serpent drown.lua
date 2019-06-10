local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_WATERSPLASH)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)

local condition = Condition(CONDITION_DROWN)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(6, 5000, -20)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)
combat:addCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end

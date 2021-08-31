local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)

local condition = Condition(CONDITION_FREEZING)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(2, 8000, -8)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("chakoya freeze")
spell:words("###235")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
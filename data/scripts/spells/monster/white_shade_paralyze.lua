local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.3, 0, -0.45, 0)
combat:addCondition(condition)

	local area = createCombatArea(AREA_CIRCLE2X2)
	combat:setArea(area)
	combat:addCondition(condition)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("white shade paralyze")
spell:words("###266")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
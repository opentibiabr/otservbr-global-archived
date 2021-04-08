local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SNOWBALL)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.5, 0, -0.6, 0)
combat:addCondition(condition)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
return combat:execute(creature, var)
end


spell:name("Crystal Spider Paralyze")
spell:words("###51")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()

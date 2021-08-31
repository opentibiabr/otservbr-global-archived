local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)


local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.50, 0, -0.60, 0)
combat:addCondition(condition)

arr = {
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1 ,1},
{0, 1, 1, 1, 1, 1, 1, 1 ,0},
{0, 0, 1, 1, 1, 1, 1, 0 ,0},
{0, 0, 0, 1, 1, 1, 0, 0, 0}
}

local area = createCombatArea(arr)
	combat:setArea(area)
	combat:addCondition(condition)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("stone devourer paralyze")
spell:words("###72")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
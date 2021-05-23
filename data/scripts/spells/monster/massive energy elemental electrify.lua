local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	for _, target in ipairs(combat:getTargets(creature, var)) do
		creature:addDamageCondition(target, CONDITION_ENERGY, DAMAGELIST_VARYING_PERIOD, 25, {10, 12}, 10)
	end
	return true
end

spell:name("massive energy elemental electrify")
spell:words("###4")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)

local condition = Condition(CONDITION_ENERGY)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 10000, -25)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

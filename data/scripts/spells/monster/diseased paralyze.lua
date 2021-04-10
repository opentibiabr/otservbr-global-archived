	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 20000)
	condition:setFormula(-0.40, 0, -0.50, 0)
	combat:addCondition(condition)

	local spell = Spell("instant")

	function spell.onCastSpell(creature, var)
		return combat:execute(creature, var)
	end
	<instant name="" words="" aggressive="1" blockwalls="1" needtarget="1" needlearn="1" script="monster/diseased paralyze.lua"/>


spell:name("diseased paralyze")
spell:words("###107")
spell:needTarget(true)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()
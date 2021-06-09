local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAINDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SOUND_RED)

	arr = {
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

local area = createCombatArea(arr)
	combat:setArea(area)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("souleater wave")
spell:words("###306")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(true)
spell:register()
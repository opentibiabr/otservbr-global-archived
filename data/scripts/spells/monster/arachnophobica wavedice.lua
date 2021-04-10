local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, CONDITION_DROWN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CRAPS)

	arr = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

local area = createCombatArea(arr)
	setCombatArea(combat, area)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return doCombat(cid, combat, var)
end

spell:name("arachnophobicawavedice")
spell:words("###467")
spell:needDirection(true)
spell:selfTarget(true)
spell:exhaustion(2000)
spell:needLearn(true)
spell:register()
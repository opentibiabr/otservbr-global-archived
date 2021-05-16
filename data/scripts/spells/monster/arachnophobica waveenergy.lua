local combat = createCombatObject()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)

	arr = {
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

local area = createCombatArea(arr)
	setCombatArea(combat, area)

<instant name="" words="" direction="1" selftarget="1" exhaustion="2000" needlearn="1"  script="monster/arachnophobica waveenergy.lua" />

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return doCombat(cid, combat, var)
end

spell:name("arachnophobicawaveenergy")
spell:words("###468")
spell:needDirection(true)
spell:selfTarget(true)
spell:exhaustion(2000)
spell:needLearn(true)
spell:register()
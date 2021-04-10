local combat = {}

for i = 40, 50 do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)
	combat[i]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, 15000)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)

	local area = createCombatArea(AREA_CIRCLE2X2)
	combat[i]:setArea(area)
	combat[i]:addCondition(condition)
end

function onCastSpell(creature, var)
	return combat[math.random(40, 50)]:execute(creature, var)
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

function onTargetCreature(creature, target)
	local min = 50
	local max = 500

	local master = target:getMaster()
	if target:isPlayer() and not master
			or master and master:isPlayer() then
		return true
	end

	doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("glooth battery heal")
spell:words("###400")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
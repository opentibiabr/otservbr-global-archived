local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.3) + 6
	local max = (level / 5) + (maglevel * 3) + 12
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Bruise Bane")
spell:words("exura infir ico")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true")
spell:id(170)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(1)
spell:mana(10)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:isPremium(false)
spell:register()
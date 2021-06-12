local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 2.5) + (maglevel * 8) + 50
	local max = (level / 2.5) + (maglevel * 16.9) + 102 -- TODO: Formulas (TibiaWiki says x2 but need more acurracy)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("healing")
spell:id(239)
spell:name("Fair Wound Cleansing")
spell:words("exura med ico")
spell:level(300)
spell:mana(90)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:isAggressive(false)
spell:vocation("knight;true", "elite knight;true")
spell:needLearn(false)
spell:register()
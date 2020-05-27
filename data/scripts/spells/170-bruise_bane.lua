local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.3) + 6
	local max = (level / 5) + (maglevel * 3) + 12
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, var)
	local vocation = creature:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.KNIGHT then
		return combat:execute(creature, var)
	else
		creature:sendCancelMessage(RETURNVALUE_YOUNEEDTOLEARNTHISSPELL)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end

spell:name("Bruise Bane")
spell:id(170)
spell:words("exura infir ico")
spell:level(1)
spell:mana(10)
spell:group("healing")
spell:isAggressive(false)
spell:cooldown(1 *1000)
spell:groupCooldown(1 *1000)
spell:needLearn(false)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()

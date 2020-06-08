local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.6) + 4
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, var)
	local vocation = creature:getVocation()
	local paladin, druid, sorcerer = VOCATION.CLIENT_ID.PALADIN, VOCATION.CLIENT_ID.DRUID, VOCATION.CLIENT_ID.SORCERER
	if vocation and vocation:getClientId() == paladin
	or vocation:getClientId() == druid
	or vocation:getClientId() == sorcerer then
		return combat:execute(creature, var)
	else
		creature:sendCancelMessage(RETURNVALUE_YOUNEEDTOLEARNTHISSPELL)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end

spell:name("Magic Patch")
spell:id(172)
spell:words("exura infir")
spell:level(1)
spell:mana(6)
spell:group("healing")
spell:isAggressive(false)
spell:cooldown(1 *1000)
spell:groupCooldown(1 *1000)
spell:needLearn(false)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()
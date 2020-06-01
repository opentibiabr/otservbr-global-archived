local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
combat:setArea(area)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.3) + 2
	local max = (level / 5) + (maglevel * 0.6) + 4
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	if Tile(creature:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		creature:sendCancelMessage(RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local vocation = creature:getVocation()
	if vocation and vocation:getClientId() == VOCATION.CLIENT_ID.SORCERER then
		return combat:execute(creature, variant)
	else
		creature:sendCancelMessage(RETURNVALUE_YOUNEEDTOLEARNTHISSPELL)
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
end

spell:name("Scorch")
spell:id(178)
spell:words("exevo infir flam hur")
spell:level(1)
spell:mana(8)
spell:group("attack")
spell:isAggressive(false)
spell:cooldown(4 *1000)
spell:groupCooldown(2 *1000)
spell:needLearn(false)
spell:needDirection(true)
spell:isPremium(false)
spell:register()

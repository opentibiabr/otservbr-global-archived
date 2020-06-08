local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 5
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

spell:name("Buzz")
spell:id(177)
spell:words("exori infir vis")
spell:level(1)
spell:mana(6)
spell:range(3)
spell:group("attack")
spell:isAggressive(false)
spell:cooldown(2 *1000)
spell:groupCooldown(2 *1000)
spell:needLearn(false)
spell:needCasterTargetOrDirection(true)
spell:isBlockingWalls(true)
spell:isPremium(false)
spell:register()

dofile('data/lib/miscellaneous/warPrivate_lib.lua')
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CROSS5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 8) + 50
	local max = (level / 5) + (maglevel * 12) + 75
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	if creature:getStorageValue(warPrivate_UE) > 0 then
  		return false
 	else
  		return combat:execute(creature, var)
 	end
end

dofile('data/lib/miscellaneous/warPrivate_lib.lua')
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
combat:setArea(createCombatArea(AREA_CROSS6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3) + 32
	local max = (level / 5) + (maglevel * 9) + 40
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

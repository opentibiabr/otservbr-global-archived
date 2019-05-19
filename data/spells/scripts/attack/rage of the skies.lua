dofile('data/lib/miscellaneous/warPrivate_lib.lua')
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
combat:setArea(createCombatArea(AREA_CROSS6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4) + 75
	local max = (level / 5) + (maglevel * 10) + 150
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

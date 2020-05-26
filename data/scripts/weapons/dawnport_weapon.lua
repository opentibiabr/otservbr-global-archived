-- the chille
local dawnportWeapon = Weapon(WEAPON_WAND)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 7
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

dawnportWeapon.onUseWeapon = function(player, variant)
	return combat:execute(player, variant)
end

dawnportWeapon:id(23721)
dawnportWeapon:mana(1)
dawnportWeapon:range(3)
dawnportWeapon:register()

-- the scorcher
local dawnportWeapon = Weapon(WEAPON_WAND)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 7
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

dawnportWeapon.onUseWeapon = function(player, variant)
	return combat:execute(player, variant)
end

dawnportWeapon:id(23719)
dawnportWeapon:mana(1)
dawnportWeapon:range(3)
dawnportWeapon:register()

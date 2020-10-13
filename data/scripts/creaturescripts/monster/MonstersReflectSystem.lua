local ReflectSystem = CreatureEvent("ReflectSystem")
local reflect = {
--[monsterName] = {{dmgType}, %reflected, ConvertDmgToHeal?(false/true)}
["Burster Spectre"] = { {COMBAT_ICEDAMAGE}, 133, true},
["Gazer Spectre"] = { {COMBAT_FIREDAMAGE}, 133, true},
["Ripper Spectre"] = { {COMBAT_EARTHDAMAGE}, 133, true},
["Crazed Summer Rearguard"] = { {COMBAT_FIREDAMAGE}, 70, true},
["Crazed Summer Vanguard"] = { {COMBAT_FIREDAMAGE}, 70, true},
["Insane Siren"] = { {COMBAT_FIREDAMAGE}, 70, true},
["Crazed Winter Rearguard"] = { {COMBAT_ICEDAMAGE}, 70, true},
["Crazed Winter Vanguard"] = { {COMBAT_ICEDAMAGE}, 70, true},
["Soul-Broken Harbingerd"] = { {COMBAT_ICEDAMAGE}, 70, true},
["Spiky Carnivor"] = { {COMBAT_PHYSICALDAMAGE}, 50, true},
["Menacing Carnivor"] = { {COMBAT_PHYSICALDAMAGE}, 100, true},

-- BOSSES
["The Armored Voidborn"] = { "all", 100, true},
["The Source of Corruption"] = { "all", 15, true},
["Zarcorix of Yalahar"] = { "all", 300, true},
["Sand Vortex"] = { "all", 100, true},
["Force Field"] = { "all", 20, true},
["Faceless Bane"] = { {COMBAT_DEATHDAMAGE}, 90, true},
["The Scourge of Oblivion"] = { "all", 20, true},
["Bragrumol"] = { {COMBAT_DEATHDAMAGE}, 95, true},
["Xogixath"] = { {COMBAT_FIREDAMAGE}, 55, true},

--["Leiden"] = { "all", 55, true},  -> already have a system for him, need to check.
}
function ReflectSystem.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
local monster = reflect[creature:getName()]
if not monster or primaryType == COMBAT_HEALING then
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
if attacker then
	if monster[1] == "all" or isInArray(monster[1], primaryType) then
		local dmg = math.ceil(primaryDamage*(monster[2]/100))
		doTargetCombatHealth(creature, attacker, primaryType, -dmg, -dmg)
		if monster[3] then
			primaryType = COMBAT_HEALING
		end
	end
end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
ReflectSystem:register()
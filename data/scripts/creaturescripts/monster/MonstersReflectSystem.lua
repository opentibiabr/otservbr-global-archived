local ReflectSystem = CreatureEvent("monsters_reflect_system")
local monsterlist = {
--[monsterName] = {{dmgType}, %reflected, ConvertDmgToHeal?(false/true)}
["Burster Spectre"] = { {COMBAT_ICEDAMAGE}, 133, false},
["Gazer Spectre"] = { {COMBAT_FIREDAMAGE}, 133, false},
["Ripper Spectre"] = { {COMBAT_EARTHDAMAGE}, 133, false},
["Crazed Summer Rearguard"] = { {COMBAT_FIREDAMAGE}, 70, false},
["Crazed Summer Vanguard"] = { {COMBAT_FIREDAMAGE}, 70, false},
["Insane Siren"] = { {COMBAT_FIREDAMAGE}, 70, false},
["Crazed Winter Rearguard"] = { {COMBAT_ICEDAMAGE}, 70, false},
["Crazed Winter Vanguard"] = { {COMBAT_ICEDAMAGE}, 70, false},
["Soul-Broken Harbingerd"] = { {COMBAT_ICEDAMAGE}, 70, false},
["Spiky Carnivor"] = { {COMBAT_PHYSICALDAMAGE}, 50, false},
["Menacing Carnivor"] = { {COMBAT_PHYSICALDAMAGE}, 100, false},

-- BOSSES
["The Armored Voidborn"] = { "all", 100, false},
["The Source of Corruption"] = { "all", 15, false},
["Zarcorix of Yalahar"] = { "all", 300, false},
["Sand Vortex"] = { "all", 100, false},
["Force Field"] = { "all", 20, false},
["Faceless Bane"] = { {COMBAT_DEATHDAMAGE}, 90, true},
["The Scourge of Oblivion"] = { "all", 20, false},
["Bragrumol"] = { {COMBAT_DEATHDAMAGE}, 95, false},
["Xogixath"] = { {COMBAT_FIREDAMAGE}, 55, false},
--["Leiden"] = { "all", 55, true},  -> already have a system for him, need to check.
}
function ReflectSystem.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
local monster = monsterlist[creature:getName()]
if not monster then
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
if attacker then
	if primaryDamage < 0 then
		if monster[1] == "all" or isInArray(monster[1], primaryType) then
			local dmgP = math.ceil(primaryDamage*(monster[2]/100))
			doTargetCombatHealth(creature, attacker, primaryType, -dmgP, -dmgP)
			if monster[3] then
				primaryType = COMBAT_HEALING
			end
		end
	end
	if secondaryDamage < 0 then
		if monster[1] == "all" or isInArray(monster[1], secondaryType) then
			local dmgS = math.ceil(secondaryDamage*(monster[2]/100))
			doTargetCombatHealth(creature, attacker, secondaryType, -dmgS, -dmgS)
			if monster[3] then
				secondaryType = COMBAT_HEALING
			end
		end
	end
end
	return primaryDamage, primaryType, secondaryDamage, secondaryType
end
ReflectSystem:register()

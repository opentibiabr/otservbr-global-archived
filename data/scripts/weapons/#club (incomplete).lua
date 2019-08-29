--[[ 

This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in alphabetical order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
]]

- WEAPONS NO LVL START

-- ice rapier
local club example = Weapon(WEAPON_CLUB)
clubExample:id(itemid)
clubExample:attack(itemlvl)
clubExample:defense(itemdef)
clubExample:extraElement(attack, COMBAT_ICEDAMAGE)
clubExample:charges(1, true) -- showCharges = true
clubExample:action("removecharge")
clubExample:register()

- WEAPONS WITH LVL START

-- club example
local clubExample = Weapon(WEAPON_CLUB)
clubExample:id(itemid)
clubExample:level(itemlvl)
clubExample:attack(itemattack)
clubExample:defense(itemdefense)
clubExample:register()

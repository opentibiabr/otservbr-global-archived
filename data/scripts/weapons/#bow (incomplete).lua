--[[ 

This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in alphabetical order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
]]

- WEAPONS NO LVL START

-- bow example
local bow example = Weapon(WEAPON_DISTANCE)
bowExample:id(itemid)
bowExample:attack(itemlvl)
bowExample:defense(itemdef)
bowExample:extraElement(attack, COMBAT_ICEDAMAGE)
bowExample:charges(1, true) -- showCharges = true
bowExample:action("removecharge")
bowExample:register()

- WEAPONS WITH LVL START

-- bow example
local bowExample = Weapon(WEAPON_DISTANCE)
bowExample:id(itemid)
bowExample:level(itemlvl)
bowExample:attack(itemattack)
bowExample:defense(itemdefense)
bowExample:register()

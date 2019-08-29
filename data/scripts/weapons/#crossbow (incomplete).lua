--[[ 

This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in alphabetical order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
]]

- WEAPONS NO LVL START

-- crossbow example
local crossbow example = Weapon(WEAPON_DISTANCE)
crossbowExample:id(itemid)
crossbowExample:attack(itemlvl)
crossbowExample:defense(itemdef)
crossbowExample:extraElement(attack, COMBAT_ICEDAMAGE)
crossbowExample:charges(1, true) -- showCharges = true
crossbowExample:action("removecharge")
crossbowExample:register()

- WEAPONS WITH LVL START

-- crossbow example
local crossbowExample = Weapon(WEAPON_DISTANCE)
crossbowExample:id(itemid)
crossbowExample:level(itemlvl)
crossbowExample:attack(itemattack)
crossbowExample:defense(itemdefense)
crossbowExample:register()

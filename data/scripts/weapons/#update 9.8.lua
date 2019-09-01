--[[ 
This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in ID order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
This archive have the items: crossbows, bows, clubs, axes, swords and wands/rods from update 9.80
]]


--[[ weapons without level]]

-- mean knight sword
local meanKnightSword = Weapon(WEAPON_SWORD)
meanKnightSword:id(19389)
meanKnightSword:vocation("none", true, true)
meanKnightSword:vocation("none")
meanKnightSword:attack(14)
meanKnightSword:defense(7)
meanKnightSword:register()

--[[ weapons by level]]
-- sorc and druid staff
local sorcDruidStaff = Weapon(WEAPON_WAND)
sorcDruidStaff:id(19391)
sorcDruidStaff:mana(2)
sorcDruidStaff:damage(8, 18)
sorcDruidStaff:element("energy")
sorcDruidStaff:range(3)
sorcDruidStaff:vocation("none", true, true)
sorcDruidStaff:vocation("none")
sorcDruidStaff:register()
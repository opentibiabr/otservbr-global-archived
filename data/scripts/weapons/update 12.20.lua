--[[ 
This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in ID order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
This archive have the items: crossbows, bows, clubs, axes, swords and wands/rods from update 12.20
]]

-- cobra crossbow
local cobraCrossbow = Weapon(WEAPON_DISTANCE)
cobraCrossbow:id(35228)
cobraCrossbow:vocation("paladin", true, true)
cobraCrossbow:vocation("royal paladin")
cobraCrossbow:ammoType("bolt")
cobraCrossbow:range(6)
cobraCrossbow:attack(7)
cobraCrossbow:hitChance(6)
cobraCrossbow:level(220)
cobraCrossbow:register()

-- cobra club
local cobraClub = Weapon(WEAPON_CLUB)
cobraClub:id(35230)
cobraClub:vocation("knight", true, true)
cobraClub:vocation("elite knight")
cobraClub:attack(8)
cobraClub:defense(29,2)
cobraClub:extraElement(44, COMBAT_FIREDAMAGE)
cobraClub:level(220)
cobraClub:register()

-- cobra axe
local cobraAxe = Weapon(WEAPON_AXE)
cobraAxe:id(35231)
cobraAxe:vocation("knight", true, true)
cobraAxe:vocation("elite knight")
cobraAxe:attack(8)
cobraAxe:defense(29,2)
cobraAxe:extraElement(44, COMBAT_ICEDAMAGE)
cobraAxe:level(220)
cobraAxe:register()

-- cobra sword
local cobraSword = Weapon(WEAPON_SWORD)
cobraSword:id(35233)
cobraSword:vocation("knight", true, true)
cobraSword:vocation("elite knight")
cobraSword:attack(52)
cobraSword:defense(31,2)
cobraSword:level(220)
cobraSword:register()

-- cobra wand
local cobraWand = Weapon(WEAPON_WAND)
cobraWand:id(35234)
cobraWand:level(200)
cobraWand:mana(22)
cobraWand:damage(94, 100)
cobraWand:element("energy")
cobraWand:range(4)
cobraWand:hitChance(6)
cobraWand:vocation("sorcerer", true, true)
cobraWand:vocation("master sorcerer")
cobraWand:register()

-- cobra rod
local cobraRod = Weapon(WEAPON_WAND)
cobraRod:id(35235)
cobraRod:level(220)
cobraRod:mana(21)
cobraRod:damage(70, 110)
cobraRod:element("earth")
cobraRod:range(5)
cobraRod:vocation("druid", true, true)
cobraRod:vocation("elder druid")
cobraRod:register()
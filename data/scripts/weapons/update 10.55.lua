--[[ 
This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in ID order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
This archive have the items: crossbows, bows, clubs, axes, swords and wands/rods from update 10.55
]]

-- spellbook of the novice
local spellbookNovice = Weapon(WEAPON_SHIELD)
spellbookNovice:id(23771)
spellbookNovice:vocation("sorcerer", true, true)
spellbookNovice:vocation("master sorcerer")
spellbookNovice:vocation("druid", true, true)
spellbookNovice:vocation("elder druid")
spellbookNovice:defense(8)
spellbookNovice:register()

-- broken wooden shield
local brokenWoodenShield = Weapon(WEAPON_SHIELD)
brokenWoodenShield:id(23772)
brokenWoodenShield:defense(11)
brokenWoodenShield:register()
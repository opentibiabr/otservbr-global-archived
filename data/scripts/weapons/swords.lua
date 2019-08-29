--[[ 
The function imbuingSlots need enhancement of Imbuement at the source.
This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in ID order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
]]

- WEAPONS NO LVL START

-- sword
local sword = Weapon(WEAPON_SWORD)
sword:id(3264)
sword:attack(14)
sword:defense(12,1)
sword:imbuingSlots(2)
sword:register()

-- dagger
local dagger = Weapon(WEAPON_SWORD)
dagger:id(3267)
dagger:attack(8)
dagger:defense(6)
dagger:imbuingSlots(2)
dagger:register()

-- spike sword
local spikeSword = Weapon(WEAPON_SWORD)
spikeSword:id(3271)
spikeSword:attack(24)
spikeSword:defense(21,2)
spikeSword:imbuingSlots(2)
spikeSword:register()

-- rapier
local rapier = Weapon(WEAPON_SWORD)
rapier:id(3272)
rapier:attack(10)
rapier:defense(8,1)
rapier:register()

-- sabre
local sabre = Weapon(WEAPON_SWORD)
sabre:id(3273)
sabre:attack(12)
sabre:defense(10,1)
sabre:register()

-- carlin sword
local carlinSword = Weapon(WEAPON_SWORD)
carlinSword:id(3283)
carlinSword:attack(15)
carlinSword:defense(13,1)
carlinSword:register()

-- ice rapier
local iceRapier = Weapon(WEAPON_SWORD)
iceRapier:id(3284)
iceRapier:attack(42)
iceRapier:defense(1)
iceRapier:extraElement(18, COMBAT_ICEDAMAGE)
iceRapier:charges(1, true) -- showCharges = true
iceRapier:action("removecharge")
iceRapier:register()

-- carlin sword
local longsword = Weapon(WEAPON_SWORD)
longsword:id(3285)
longsword:attack(17)
longsword:defense(14)
longsword:register()

-- silver dagger
local silverDagger = Weapon(WEAPON_SWORD)
silverDagger:id(3290)
silverDagger:attack(9)
silverDagger:defense(7)
silverDagger:register()

-- knife
local knife = Weapon(WEAPON_SWORD)
knife:id(3291)
knife:attack(5)
knife:defense(5)
knife:register()

-- combat knife
local combatKnife = Weapon(WEAPON_SWORD)
combatKnife:id(3292)
combatKnife:attack(8)
combatKnife:defense(6)
combatKnife:register()

-- short sword
local shortSword = Weapon(WEAPON_SWORD)
shortSword:id(3294)
shortSword:attack(11)
shortSword:defense(11)
shortSword:register()

-- serpent sword
local serpentSword = Weapon(WEAPON_SWORD)
serpentSword:id(3297)
serpentSword:attack(18)
serpentSword:defense(15,1)
serpentSword:extraElement(8, COMBAT_EARTHDAMAGE)
serpentSword:register()

-- poison dagger
local poisonDagger = Weapon(WEAPON_SWORD)
poisonDagger:id(3299)
poisonDagger:attack(18)
poisonDagger:defense(8)
poisonDagger:extraElement(2, COMBAT_EARTHDAMAGE)
poisonDagger:register()

-- katana
local katana = Weapon(WEAPON_SWORD)
katana:id(3300)
katana:attack(16)
katana:defense(12,1)
katana:register()

-- scimitar
local scimitar = Weapon(WEAPON_SWORD)
scimitar:id(3307)
scimitar:attack(19)
scimitar:defense(13,1)
scimitar:register()

-- machete
local machete = Weapon(WEAPON_SWORD)
machete:id(3308)
machete:attack(12)
machete:defense(9)
machete:register()

-- heavy machete
local heavyMachete = Weapon(WEAPON_SWORD)
heavyMachete:id(3330)
heavyMachete:attack(16)
heavyMachete:defense(10)
heavyMachete:register()

-- bone sword
local boneSword = Weapon(WEAPON_SWORD)
boneSword:id(3338)
boneSword:attack(13)
boneSword:defense(10)
boneSword:register()

-- templar scytheblade
local templarCytheblade = Weapon(WEAPON_SWORD)
templarCytheblade:id(3345)
templarCytheblade:attack(23)
templarCytheblade:defense(15,1)
templarCytheblade:register()

-- Ron the Ripper's sabre
local ronRipperSabre = Weapon(WEAPON_SWORD)
ronRipperSabre:id(6101)
ronRipperSabre:attack(12)
ronRipperSabre:defense(10)
ronRipperSabre:register()

-- jagged sword
local jaggedSword = Weapon(WEAPON_SWORD)
jaggedSword:id(7774)
jaggedSword:attack(21)
jaggedSword:defense(14,1)
jaggedSword:register()

-- pointed rabbitslayer
local pointedRabbitslayer = Weapon(WEAPON_SWORD)
pointedRabbitslayer:id(9375)
pointedRabbitslayer:attack(16)
pointedRabbitslayer:defense(8)
pointedRabbitslayer:register()

-- farmer's avenger
local farmersAvenger = Weapon(WEAPON_SWORD)
farmersAvenger:id(9386)
farmersAvenger:attack(17)
farmersAvenger:defense(7)
farmersAvenger:slotType("two-handed")
farmersAvenger:register()

-- poet's fencing quill
local poetsFencingQuill = Weapon(WEAPON_SWORD)
poetsFencingQuill:id(9387)
poetsFencingQuill:attack(10)
poetsFencingQuill:defense(8)
poetsFencingQuill:register()

-- incredible mumpiz slayer
local incredibleMumpizSlayer = Weapon(WEAPON_SWORD)
incredibleMumpizSlayer:id(9396)
incredibleMumpizSlayer:attack(17)
incredibleMumpizSlayer:defense(14)
incredibleMumpizSlayer:register()

-- wooden sword
local woodenSword = Weapon(WEAPON_SWORD)
woodenSword:id(12673)
woodenSword:attack(7)
woodenSword:defense(7)
woodenSword:register()

- WEAPONS WITH LVL START

-- broadsword
local broadsword = Weapon(WEAPON_SWORD)
broadsword:id(3301)
broadsword:level(5)
broadsword:attack(26)
broadsword:defense(23)
broadsword:vocation("knight", true, true)
broadsword:vocation("knight")
broadsword:register()

-- ratana
local ratana = Weapon(WEAPON_SWORD)
ratana:id(17812)
broadsword:level(15)
ratana:attack(27)
ratana:defense(19,1)
ratana:register()

-- two handed sword
local twoHanded = Weapon(WEAPON_SWORD)
twoHanded:id(3265)
twoHanded:level(20)
twoHanded:attack(30)
twoHanded:defense(25)
twoHanded:vocation("knight", true, true)
twoHanded:vocation("knight")
twoHanded:register()

-- crimson sword
local crimsonSword = Weapon(WEAPON_SWORD)
crimsonSword:id(7385)
crimsonSword:level(20)
crimsonSword:attack(28)
crimsonSword:defense(20)
crimsonSword:imbuingSlots(2)
crimsonSword:register()

-- cowtana
local cowtana = Weapon(WEAPON_SWORD)
cowtana:id(21177)
cowtana:level(25)
cowtana:attack(34)
cowtana:defense(19,1)
cowtana:register()

-- heavy trident
local heavyTrident = Weapon(WEAPON_SWORD)
heavyTrident:id(12683)
heavyTrident:level(25)
heavyTrident:attack(35)
heavyTrident:defense(17)
heavyTrident:slotType("two-handed")
heavyTrident:register()

-- wyvern fang
local wyvernFang = Weapon(WEAPON_SWORD)
wyvernFang:id(7408)
wyvernFang:level(25)
wyvernFang:attack(32)
wyvernFang:defense(19)
wyvernFang:imbuingSlots(2)
wyvernFang:register()

-- crystal sword
local crystalSword = Weapon(WEAPON_SWORD)
crystalSword:id(7449)
crystalSword:level(25)
crystalSword:attack(35)
crystalSword:defense(26)
crystalSword:vocation("knight", true, true)
crystalSword:vocation("knight")
crystalSword:register()

-- fire sword
local fireSword = Weapon(WEAPON_SWORD)
fireSword:id(3280)
fireSword:level(30)
fireSword:attack(24)
fireSword:defense(20, 1)
fireSword:extraElement(11, COMBAT_FIREDAMAGE)
fireSword:register()

-- bright sword
local brightSword = Weapon(WEAPON_SWORD)
brightSword:id(3295)
brightSword:level(30)
brightSword:attack(36)
brightSword:defense(30, 1)
brightSword:extraElement(11, COMBAT_FIREDAMAGE)
brightSword:imbuingSlots(2)
brightSword:register()

-- epee
local epee = Weapon(WEAPON_SWORD)
epee:id(3326)
epee:level(30)
epee:attack(37)
epee:defense(23)
epee:imbuingSlots(2)
epee:register()

-- haunted blade
local hauntedBlade = Weapon(WEAPON_SWORD)
hauntedBlade:id(7407)
hauntedBlade:level(30)
hauntedBlade:attack(40)
hauntedBlade:defense(12)
hauntedBlade:slotType("two-handed")
hauntedBlade:imbuingSlots(3)
hauntedBlade:vocation("knight", true, true)
hauntedBlade:vocation("knight")
hauntedBlade:register()

-- blacksteel sword
local blacksteelSword = Weapon(WEAPON_SWORD)
blacksteelSword:id(7406)
blacksteelSword:level(35)
blacksteelSword:attack(42)
blacksteelSword:defense(22)
blacksteelSword:slotType("two-handed")
blacksteelSword:imbuingSlots(3)
blacksteelSword:register()

-- djin blade
local djinBlade = Weapon(WEAPON_SWORD)
djinBlade:id(3339)
djinBlade:level(35)
djinBlade:attack(38)
djinBlade:defense(22, 2)
djinBlade:imbuingSlots(2)
djinBlade:register()

-- assassin dagger
local assassinDagger = Weapon(WEAPON_SWORD)
assassinDagger:id(7404)
assassinDagger:level(40)
assassinDagger:attack(40)
assassinDagger:defense(12,-2)
assassinDagger:imbuingSlots(2)
assassinDagger:register()

-- mercenary sword
local mercenarySword = Weapon(WEAPON_SWORD)
mercenarySword:id(7386)
mercenarySword:level(40)
mercenarySword:attack(43)
mercenarySword:defense(27)
mercenarySword:vocation("knight", true, true)
mercenarySword:vocation("knight")
mercenarySword:register()

-- shimmer sword
local shimmerSword = Weapon(WEAPON_SWORD)
shimmerSword:id(12731)
shimmerSword:level(40)
shimmerSword:attack(42)
shimmerSword:duration(604800)
shimmerSword:decayTo(0)
shimmerSword:defense(20)
shimmerSword:vocation("knight", true, true)
shimmerSword:vocation("knight")
shimmerSword:register()

-- pharaoh sword
local pharaohSword = Weapon(WEAPON_SWORD)
pharaohSword:id(3334)
pharaohSword:level(45)
pharaohSword:attack(41)
pharaohSword:defense(23, 2)
pharaohSword:vocation("knight", true, true)
pharaohSword:vocation("knight")
pharaohSword:register()

-- dragon slayer
local dragonSlayer = Weapon(WEAPON_SWORD)
dragonSlayer:id(7402)
dragonSlayer:level(45)
dragonSlayer:attack(44)
dragonSlayer:defense(28)
dragonSlayer:slotType("two-handed")
dragonSlayer:imbuingSlots(3)
dragonSlayer:vocation("knight", true, true)
dragonSlayer:vocation("knight")
dragonSlayer:register()

-- relic sword
local relicSword = Weapon(WEAPON_SWORD)
relicSword:id(7383)
relicSword:level(50)
relicSword:attack(42)
relicSword:defense(24, 1)
relicSword:slotType("two-handed")
relicSword:imbuingSlots(2)
relicSword:register()

-- sai
local sai = Weapon(WEAPON_SWORD)
sai:id(10389)
sai:level(50)
sai:attack(45)
sai:defense(27)
sai:slotType("two-handed")
sai:vocation("knight", true, true)
sai:vocation("knight")
sai:register()

-- thaian sword
local thaianSword = Weapon(WEAPON_SWORD)
thaianSword:id(7391)
thaianSword:level(50)
thaianSword:attack(45)
thaianSword:defense(29)
thaianSword:slotType("two-handed")
thaianSword:imbuingSlots(3)
thaianSword:vocation("knight", true, true)
thaianSword:vocation("knight")
thaianSword:register()

-- bloody edge
local bloodyEdge = Weapon(WEAPON_SWORD)
bloodyEdge:id(7416)
bloodyEdge:level(55)
bloodyEdge:attack(43)
bloodyEdge:defense(21, -3)
bloodyEdge:slotType("two-handed")
bloodyEdge:imbuingSlots(2)
bloodyEdge:register()

-- giant sword
local giantSword = Weapon(WEAPON_SWORD)
giantSword:id(3281)
giantSword:level(55)
giantSword:attack(46)
giantSword:defense(22)
giantSword:slotType("two-handed")
giantSword:imbuingSlots(3)
giantSword:vocation("knight", true, true)
giantSword:vocation("knight")
giantSword:register()

-- zaoan sword
local zaoanSword = Weapon(WEAPON_SWORD)
zaoanSword:id(10390)
zaoanSword:level(55)
zaoanSword:attack(43)
zaoanSword:defense(18, 2)
zaoanSword:imbuingSlots(2)
zaoanSword:register()

-- twiceslicer
local twiceslicer = Weapon(WEAPON_SWORD)
twiceslicer:id(11657)
twiceslicer:level(58)
twiceslicer:attack(47)
twiceslicer:defense(30)
twiceslicer:slotType("two-handed")
twiceslicer:imbuingSlots(3)
twiceslicer:vocation("knight", true, true)
twiceslicer:vocation("knight")
twiceslicer:register()

-- mystic blade
local mysticBlade = Weapon(WEAPON_SWORD)
mysticBlade:id(7384)
mysticBlade:level(60)
mysticBlade:attack(44)
mysticBlade:defense(25, 2)
mysticBlade:imbuingSlots(2)
mysticBlade:register()

-- demonrage sword
local demonrageSword = Weapon(WEAPON_SWORD)
demonrageSword:id(7382)
demonrageSword:level(60)
demonrageSword:attack(47)
demonrageSword:defense(22)
demonrageSword:slotType("two-handed")
demonrageSword:imbuingSlots(3)
demonrageSword:vocation("knight", true, true)
demonrageSword:vocation("knight")
demonrageSword:register()

-- crystalline sword
local crystallineSword = Weapon(WEAPON_SWORD)
crystallineSword:id(16160)
crystallineSword:level(62)
crystallineSword:attack(47)
crystallineSword:defense(34, 1)
crystallineSword:register()

-- runed sword
local runedSword = Weapon(WEAPON_SWORD)
runedSword:id(7417)
runedSword:level(65)
runedSword:attack(45)
runedSword:defense(32, 2)
runedSword:imbuingSlots(2)
runedSword:register()

-- berserker
local berserker = Weapon(WEAPON_SWORD)
berserker:id(7403)
berserker:level(65)
berserker:attack(48)
berserker:defense(21)
berserker:slotType("two-handed")
berserker:imbuingSlots(3)
berserker:vocation("knight", true, true)
berserker:vocation("knight")
berserker:register()

-- nightmare blade
local nightmareBlade = Weapon(WEAPON_SWORD)
nightmareBlade:id(7418)
nightmareBlade:level(70)
nightmareBlade:attack(46)
nightmareBlade:defense(23, -3)
nightmareBlade:imbuingSlots(2)
nightmareBlade:vocation("knight", true, true)
nightmareBlade:vocation("knight")
nightmareBlade:register()

-- havoc blade
local havocBlade = Weapon(WEAPON_SWORD)
havocBlade:id(7405)
havocBlade:level(70)
havocBlade:attack(49)
havocBlade:defense(34)
havocBlade:slotType("two-handed")
havocBlade:imbuingSlots(3)
havocBlade:vocation("knight", true, true)
havocBlade:vocation("knight")
havocBlade:register()

-- the justice seeker
local justiceSeeker = Weapon(WEAPON_SWORD)
justiceSeeker:id(7390)
justiceSeeker:level(75)
justiceSeeker:attack(47)
justiceSeeker:defense(24, 3)
justiceSeeker:register()

-- the avenger
local theAvenger = Weapon(WEAPON_SWORD)
theAvenger:id(6527)
theAvenger:level(75)
theAvenger:attack(50)
theAvenger:defense(38)
theAvenger:slotType("two-handed")
theAvenger:imbuingSlots(2)
theAvenger:vocation("knight", true, true)
theAvenger:vocation("knight")
theAvenger:register()

-- glooth blade
local gloothBlade = Weapon(WEAPON_SWORD)
gloothBlade:id(21179)
gloothBlade:level(75)
gloothBlade:attack(39)
gloothBlade:defense(1)
iceRapier:extraElement(26, COMBAT_EARTHDAMAGE)
iceRapier:charges(2, true) -- showCharges = true
iceRapier:action("removecharge")
gloothBlade:slotType("two-handed")
gloothBlade:vocation("knight", true, true)
gloothBlade:vocation("knight")
gloothBlade:register()

-- crude umbral blade
local crudeUmbralBlade = Weapon(WEAPON_SWORD)
crudeUmbralBlade:id(20064)
crudeUmbralBlade:level(75)
crudeUmbralBlade:attack(48)
crudeUmbralBlade:defense(26,1)
crudeUmbralBlade:vocation("knight", true, true)
crudeUmbralBlade:vocation("knight")
crudeUmbralBlade:register()

-- crude umbral slayer
local crudeUmbralSlayer = Weapon(WEAPON_SWORD)
crudeUmbralSlayer:id(20064)
crudeUmbralSlayer:level(75)
crudeUmbralSlayer:attack(51)
crudeUmbralSlayer:defense(29)
crudeUmbralSlayer:slotType("two-handed")
crudeUmbralSlayer:vocation("knight", true, true)
crudeUmbralSlayer:vocation("knight")
crudeUmbralSlayer:register()

-- magic sword
local magicSword = Weapon(WEAPON_SWORD)
magicSword:id(3288)
magicSword:level(80)
magicSword:attack(48)
magicSword:defense(35, 3)
magicSword:imbuingSlots(2)
magicSword:register()

-- blade of corruption
local bladeCorruption = Weapon(WEAPON_SWORD)
bladeCorruption:id(11693)
bladeCorruption:level(82)
bladeCorruption:attack(48)
bladeCorruption:defense(29, 2)
bladeCorruption:imbuingSlots(2)
bladeCorruption:register()

-- emerald sword
local emeraldSword = Weapon(WEAPON_SWORD)
emeraldSword:id(8102)
emeraldSword:level(100)
emeraldSword:attack(49)
emeraldSword:defense(33, 3)
emeraldSword:imbuingSlots(2)
emeraldSword:register()

-- the calamity
local theCalamity = Weapon(WEAPON_SWORD)
theCalamity:id(8104)
theCalamity:level(100)
theCalamity:attack(51)
theCalamity:defense(35)
theCalamity:slotType("two-handed")
theCalamity:vocation("knight", true, true)
theCalamity:vocation("knight")
theCalamity:register()

-- shiny blade
local shinyBlade = Weapon(WEAPON_SWORD)
shinyBlade:id(16175)
shinyBlade:level(120)
shinyBlade:attack(50)
shinyBlade:defense(35,3)
shinyBlade:skillSword(1)
shinyBlade:imbuingSlots(1)
shinyBlade:register()

-- the epiphany
local theEpiphany = Weapon(WEAPON_SWORD)
theEpiphany:id(8103)
theEpiphany:level(120)
theEpiphany:attack(50)
theEpiphany:defense(35,3)
theEpiphany:imbuingSlots(1)
theEpiphany:register()

-- warlord sword
local warlordSword = Weapon(WEAPON_SWORD)
warlordSword:id(3296)
warlordSword:level(120)
warlordSword:attack(53)
warlordSword:defense(38)
warlordSword:slotType("two-handed")
warlordSword:vocation("knight", true, true)
warlordSword:vocation("knight")
warlordSword:register()

-- umbral blade
local umbralBlade = Weapon(WEAPON_SWORD)
umbralBlade:id(20065)
umbralBlade:level(120)
umbralBlade:attack(50)
umbralBlade:defense(29,2)
umbralBlade:imbuingSlots(1)
umbralBlade:vocation("knight", true, true)
umbralBlade:vocation("knight")
umbralBlade:register()

-- umbral slayer
local umbralSlayer = Weapon(WEAPON_SWORD)
umbralSlayer:id(20068)
umbralSlayer:level(120)
umbralSlayer:attack(52)
umbralSlayer:defense(31)
umbralSlayer:slotType("two-handed")
umbralSlayer:vocation("knight", true, true)
umbralSlayer:vocation("knight")
umbralSlayer:register()

-- magic longsword
local magicLongsword = Weapon(WEAPON_SWORD)
magicLongsword:id(3278)
magicLongsword:level(140)
magicLongsword:attack(55)
magicLongsword:defense(40)
magicLongsword:slotType("two-handed")
magicLongsword:vocation("knight", true, true)
magicLongsword:vocation("knight")
magicLongsword:register()

-- impaler of the igniter
local impalerIgniter = Weapon(WEAPON_SWORD)
impalerIgniter:id(22760)
impalerIgniter:level(150)
impalerIgniter:attack(26)
impalerIgniter:defense(31,3)
impalerIgniter:extraElement(26, COMBAT_FIREDAMAGE)
impalerIgniter:slotType("two-handed")
impalerIgniter:vocation("knight", true, true)
impalerIgniter:vocation("knight")
impalerIgniter:register()

-- summerblade
local summerblade = Weapon(WEAPON_SWORD)
summerblade:id(29421)
summerblade:level(180)
summerblade:attack(10)
summerblade:defense(20, 4)
summerblade:imbuingSlots(2)
summerblade:extraElement(42, COMBAT_FIREDAMAGE)
summerblade:vocation("knight", true, true)
summerblade:vocation("knight")
summerblade:register()

-- winterblade
local winterblade = Weapon(WEAPON_SWORD)
winterblade:id(29422)
winterblade:level(180)
winterblade:attack(10)
winterblade:defense(22, 4)
winterblade:imbuingSlots(2)
winterblade:extraElement(41, COMBAT_ICEDAMAGE)
winterblade:vocation("knight", true, true)
winterblade:vocation("knight")
winterblade:register()

-- blade of destruction
local bladeDestruction = Weapon(WEAPON_SWORD)
bladeDestruction:id(27449)
bladeDestruction:level(200)
bladeDestruction:attack(50)
bladeDestruction:defense(33)
bladeDestruction:imbuingSlots(3)
bladeDestruction:vocation("knight", true, true)
bladeDestruction:vocation("knight")
bladeDestruction:register()

-- slayer of destruction
local slayerDestruction = Weapon(WEAPON_SWORD)
slayerDestruction:id(27450)
slayerDestruction:level(200)
slayerDestruction:attack(52)
slayerDestruction:defense(32)
slayerDestruction:slotType("two-handed")
slayerDestruction:imbuingSlots(3)
slayerDestruction:vocation("knight", true, true)
slayerDestruction:vocation("knight")
slayerDestruction:register()

-- gnome sword
local gnomeSword = Weapon(WEAPON_SWORD)
gnomeSword:id(27651)
gnomeSword:level(200)
gnomeSword:attack(10)
gnomeSword:defense(35,3)
gnomeSword:skillSword(3)
gnomeSword:absorbPercentEnergy(6)
gnomeSword:extraElement(42, COMBAT_ENERGYDAMAGE)
gnomeSword:imbuingSlots(3)
gnomeSword:vocation("knight", true, true)
gnomeSword:vocation("knight")
gnomeSword:register()

-- umbral masterblade
local umbralMasterBlade = Weapon(WEAPON_SWORD)
umbralMasterBlade:id(20066)
umbralMasterBlade:level(250)
umbralMasterBlade:attack(52)
umbralMasterBlade:defense(31,3)
umbralMasterBlade:skillSword(1)
umbralMasterBlade:imbuingSlots(1)
umbralMasterBlade:vocation("knight", true, true)
umbralMasterBlade:vocation("knight")
umbralMasterBlade:register()

-- umbral masterslayer
local umbralMasterSlayer = Weapon(WEAPON_SWORD)
umbralMasterSlayer:id(20066)
umbralMasterSlayer:level(250)
umbralMasterSlayer:attack(54)
umbralMasterSlayer:defense(35)
umbralMasterSlayer:skillSword(3)
umbralSlayer:slotType("two-handed")
umbralMasterSlayer:imbuingSlots(2)
umbralMasterSlayer:vocation("knight", true, true)
umbralMasterSlayer:vocation("knight")
umbralMasterSlayer:register()

-- falcon longsword
local falconLongsword = Weapon(WEAPON_SWORD)
falconLongsword:id(28723)
falconLongsword:level(300)
falconLongsword:attack(54)
falconLongsword:defense(34)
falconLongsword:skillSword(4)
falconLongsword:absorbPercentEarth(10)
falconLongsword:slotType("two-handed")
falconLongsword:imbuingSlots(2)
falconLongsword:vocation("knight", true, true)
falconLongsword:vocation("knight")
falconLongsword:register()
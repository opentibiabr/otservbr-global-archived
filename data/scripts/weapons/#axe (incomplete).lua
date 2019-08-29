--[[ 
The function imbuingSlots need enhancement of Imbuement at the source.
This script is separated by: weapons by lvl and weapons without level.
Weapons without level will be arranged in ID order.
The weapons in which there is level to use will be organized according to the lvl from the smallest to the largest.
]]

- WEAPONS NO LVL START

-- battle axe
local battleAxe = Weapon(WEAPON_AXE)
battleAxe:id(3266)
battleAxe:attack(25)
battleAxe:defense(10)
battleAxe:slotType("two-handed")
battleAxe:vocation("knight", true, true)
battleAxe:vocation("knight")
battleAxe:register()

-- hand axe
local handAxe = Weapon(WEAPON_AXE)
handAxe:id(3268)
handAxe:attack(10)
handAxe:defense(5)
handAxe:vocation("knight", true, true)
handAxe:vocation("knight")
handAxe:register()

-- axe
local axe = Weapon(WEAPON_AXE)
axe:id(3274)
axe:attack(12)
axe:defense(6)
axe:register()

-- hatchet
local hatchet = Weapon(WEAPON_AXE)
hatchet:id(3276)
hatchet:attack(15)
hatchet:defense(8)
hatchet:register()

-- sickle
local sickle = Weapon(WEAPON_AXE)
sickle:id(3293)
sickle:attack(5)
sickle:defense(4)
sickle:register()

-- golden sickle
local goldenSickle = Weapon(WEAPON_AXE)
goldenSickle:id(3306)
goldenSickle:attack(13)
goldenSickle:defense(6)
goldenSickle:register()

-- orcish axe
local orcishAxe = Weapon(WEAPON_AXE)
orcishAxe:id(3316)
orcishAxe:attack(23)
orcishAxe:defense(12)
orcishAxe:register()

-- daramian axe
local daramianAaxe = Weapon(WEAPON_AXE)
daramianAaxe:id(3329)
daramianAaxe:attack(17)
daramianAaxe:defense(8)
daramianAaxe:register()

-- ripper lance
local ripperLance = Weapon(WEAPON_AXE)
ripperLance:id(3346)
ripperLance:attack(28)
ripperLance:defense(7)
ripperLance:register()

-- scythe
local scythe = Weapon(WEAPON_AXE)
scythe:id(3453)
scythe:attack(8)
scythe:defense(3)
scythe:register()

-- steel axe
local steelAxe = Weapon(WEAPON_AXE)
steelAxe:id(7773)
steelAxe:attack(21)
steelAxe:defense(10)
steelAxe:register()

- WEAPONS WITH LVL START

-- noble axe
local nobleAxe = Weapon(WEAPON_AXE)
nobleAxe:id(7456)
nobleAxe:level(35)
nobleAxe:attack(39)
nobleAxe:defense(22)
:imbuingSlots(2)
nobleAxe:register()

-- dwarven axe
local dwarvenAxe = Weapon(WEAPON_AXE)
dwarvenAxe:id(3323)
dwarvenAxe:level(18)
dwarvenAxe:attack(31)
dwarvenAxe:defense(19,2)
dwarvenAxe:imbuingSlots(2)
dwarvenAxe:register()

-- barbarian axe
local barbarianAxe = Weapon(WEAPON_AXE)
barbarianAxe:id(3317)
barbarianAxe:level(18)
barbarianAxe:attack(28)
barbarianAxe:defense(10,1)
barbarianAxe:imbuingSlots(2)
barbarianAxe:register()

-- obsidian lance
local obsidianLance = Weapon(WEAPON_AXE)
obsidianLance:id(3313)
obsidianLance:level(20)
obsidianLance:attack(34)
obsidianLance:defense(10)
obsidianLance:slotType("two-handed")
obsidianLance:register()

-- daramian waraxe
local daramianWaraxe = Weapon(WEAPON_AXE)
daramianWaraxe:id(3328)
daramianWaraxe:level(25)
daramianWaraxe:attack(39)
daramianWaraxe:defense(15)
daramianWaraxe:slotType("two-handed")
daramianWaraxe:vocation("knight", true, true)
daramianWaraxe:vocation("knight")
daramianWaraxe:register()

-- knight axe
local knightAxe = Weapon(WEAPON_AXE)
knightAxe:id(3318)
knightAxe:level(25)
knightAxe:attack(33)
knightAxe:defense(21,1)
knightAxe:imbuingSlots(2)
knightAxe:register()

-- naginata
local naginata = Weapon(WEAPON_AXE)
naginata:id(3314)
naginata:level(25)
naginata:attack(39)
naginata:defense(25)
naginata:slotType("two-handed")
naginata:register()

-- double axe
local doubleAxe = Weapon(WEAPON_AXE)
doubleAxe:id(3275)
doubleAxe:level(25)
doubleAxe:attack(12)
doubleAxe:defense(6)
doubleAxe:slotType("two-handed")
doubleAxe:vocation("knight", true, true)
doubleAxe:vocation("knight")
doubleAxe:register()

-- halberd
local halberd = Weapon(WEAPON_AXE)
halberd:id(3269)
halberd:level(25)
halberd:attack(35)
halberd:defense(14)
halberd:slotType("two-handed")
halberd:vocation("knight", true, true)
halberd:vocation("knight")
halberd:register()

-- beastslayer axe
local warAxe = Weapon(WEAPON_AXE)
warAxe:id(3344)
warAxe:level(30)
warAxe:attack(35)
warAxe:defense(12,1)
warAxe:imbuingSlots(2)
warAxe:slotType("two-handed")
warAxe:register()

-- glorious axe
local gloriousAxe = Weapon(WEAPON_AXE)
gloriousAxe:id(7454)
gloriousAxe:level(30)
gloriousAxe:attack(40)
gloriousAxe:defense(23)
gloriousAxe:slotType("two-handed")
gloriousAxe:vocation("knight", true, true)
gloriousAxe:vocation("knight")
gloriousAxe:register()

-- fire axe
local fireAxe = Weapon(WEAPON_AXE)
fireAxe:id(3320)
fireAxe:level(35)
fireAxe:attack(27)
fireAxe:defense(16,1)
fireSword:extraElement(11, COMBAT_FIREDAMAGE)
fireAxe:register()

-- mythril axe
local mythrilAxe = Weapon(WEAPON_AXE)
mythrilAxe:id(7455)
mythrilAxe:level(35)
mythrilAxe:attack(39)
mythrilAxe:defense(22)
mythrilAxe:imbuingSlots(2)
mythrilAxe:register()

-- noble axe
local nobleAxe = Weapon(WEAPON_AXE)
nobleAxe:id(7456)
nobleAxe:level(35)
nobleAxe:attack(39)
nobleAxe:defense(22)
nobleAxe:imbuingSlots(2)
nobleAxe:register()

-- headchopper
local headchopper = Weapon(WEAPON_AXE)
headchopper:id(7380)
headchopper:level(35)
headchopper:attack(42)
headchopper:defense(20)
headchopper:imbuingSlots(3)
headchopper:slotType("two-handed")
headchopper:vocation("knight", true, true)
headchopper:vocation("knight")
headchopper:register()

-- dreaded cleaver
local dreadedCleaver = Weapon(WEAPON_AXE)
dreadedCleaver:id(7419)
dreadedCleaver:level(40)
dreadedCleaver:attack(40)
dreadedCleaver:defense(19,-3)
dreadedCleaver:register()

-- titan axe
local titanAxe = Weapon(WEAPON_AXE)
titanAxe:id(7412)
titanAxe:level(40)
titanAxe:attack(43)
titanAxe:defense(30)
titanAxe:slotType("two-handed")
titanAxe:register()

-- angelic axe
local angelicAxe = Weapon(WEAPON_AXE)
angelicAxe:id(7436)
angelicAxe:level(45)
angelicAxe:attack(44)
angelicAxe:defense(24)
angelicAxe:slotType("two-handed")
angelicAxe:register()

-- butcher's axe
local ornamentedAxe = Weapon(WEAPON_AXE)
ornamentedAxe:id(7412)
ornamentedAxe:level(45)
ornamentedAxe:attack(41)
ornamentedAxe:defense(24,-2)
ornamentedAxe:register()

-- ornamented axe
local ornamentedAxe = Weapon(WEAPON_AXE)
ornamentedAxe:id(7411)
ornamentedAxe:level(50)
ornamentedAxe:attack(42)
ornamentedAxe:defense(22,2)
ornamentedAxe:register()

-- twin axe
local twinAxe = Weapon(WEAPON_AXE)
twinAxe:id(3335)
twinAxe:level(50)
twinAxe:attack(45)
twinAxe:defense(24)
twinAxe:imbuingSlots(3)
twinAxe:slotType("two-handed")
twinAxe:vocation("knight", true, true)
twinAxe:vocation("knight")
twinAxe:register()

-- guardian halberd
local guardianHalberd = Weapon(WEAPON_AXE)
guardianHalberd:id(3315)
guardianHalberd:level(55)
guardianHalberd:attack(46)
guardianHalberd:defense(15)
guardianHalberd:imbuingSlots(3)
guardianHalberd:slotType("two-handed")
guardianHalberd:register()

-- vile axe
local vileAxe = Weapon(WEAPON_AXE)
vileAxe:id(7388)
vileAxe:level(55)
vileAxe:attack(43)
vileAxe:defense(19,3)
vileAxe:register()

-- dragon lance
local dragonLance = Weapon(WEAPON_AXE)
dragonLance:id(3302)
dragonLance:level(60)
dragonLance:attack(47)
dragonLance:defense(16)
dragonLance:slotType("two-handed")
dragonLance:imbuingSlots(3)
dragonLance:register()

-- heroic axe
local heroicAxe = Weapon(WEAPON_AXE)
heroicAxe:id(7389)
heroicAxe:level(60)
heroicAxe:attack(44)
heroicAxe:defense(24,1)
heroicAxe:register()

-- ravenwing
local ravenwing = Weapon(WEAPON_AXE)
ravenwing:id(7433)
ravenwing:level(65)
ravenwing:attack(45)
ravenwing:defense(22,1)
ravenwing:register()

-- war axe
local warAxe = Weapon(WEAPON_AXE)
warAxe:id(3342)
warAxe:level(65)
warAxe:attack(48)
warAxe:defense(10)
warAxe:imbuingSlots(3)
warAxe:slotType("two-handed")
warAxe:vocation("knight", true, true)
warAxe:vocation("knight")
warAxe:register()

-- reaper's axe
local reapersAxe = Weapon(WEAPON_AXE)
reapersAxe:id(7420)
reapersAxe:level(70)
reapersAxe:attack(46)
reapersAxe:defense(25,2)
reapersAxe:register()

-- ravager's axe
local ravagersAxe = Weapon(WEAPON_AXE)
ravagersAxe:id(3331)
ravagersAxe:level(70)
ravagersAxe:attack(49)
ravagersAxe:defense(14)
ravagersAxe:imbuingSlots(3)
ravagersAxe:slotType("two-handed")
ravagersAxe:vocation("knight", true, true)
ravagersAxe:vocation("knight")
ravagersAxe:register()

-- royal axe
local royalAxe = Weapon(WEAPON_AXE)
royalAxe:id(7434)
royalAxe:level(75)
royalAxe:attack(47)
royalAxe:defense(25,3)
royalAxe:imbuingSlots(2)
royalAxe:register()

-- ruthless axe
local ruthlessAxe = Weapon(WEAPON_AXE)
ruthlessAxe:id(6553)
ruthlessAxe:level(75)
ruthlessAxe:attack(50)
ruthlessAxe:defense(15)
ruthlessAxe:imbuingSlots(2)
ruthlessAxe:slotType("two-handed")
ruthlessAxe:register()

-- mythril axe
local mythrilAxe = Weapon(WEAPON_AXE)
mythrilAxe:id(7455)
mythrilAxe:level(80)
mythrilAxe:attack(48)
mythrilAxe:defense(28,2)
mythrilAxe:imbuingSlots(2)
mythrilAxe:register()

-- executioner
local executioner = Weapon(WEAPON_AXE)
executioner:id(7453)
executioner:level(85)
executioner:attack(51)
executioner:defense(20)
executioner:imbuingSlots(2)
daramianWaraxe:slotType("two-handed")
daramianWaraxe:vocation("knight", true, true)
daramianWaraxe:vocation("knight")
executioner:register()

-- impaler
local impaler = Weapon(WEAPON_AXE)
impaler:id(7435)
impaler:level(85)
impaler:attack(49)
impaler:defense(25,-2)
impaler:imbuingSlots(2)
impaler:register()

-- stonecutter axe
local stonecutterAxe = Weapon(WEAPON_AXE)
stonecutterAxe:id(3319)
stonecutterAxe:level(90)
stonecutterAxe:attack(50)
stonecutterAxe:defense(30,3)
stonecutterAxe:imbuingSlots(1)
stonecutterAxe:register()

-- great axe
local greatAxe = Weapon(WEAPON_AXE)
greatAxe:id(3303)
greatAxe:level(95)
greatAxe:attack(52)
greatAxe:defense(22)
greatAxe:slotType("two-handed")
greatAxe:imbuingSlots(2)
greatAxe:vocation("knight", true, true)
greatAxe:vocation("knight")
greatAxe:register()

-- axe of destruction
local axeDestruction = Weapon(WEAPON_AXE)
axeDestruction:id(27451)
axeDestruction:level(200)
axeDestruction:attack(51)
axeDestruction:defense(31)
axeDestruction:imbuingSlots(3)
axeDestruction:vocation("knight", true, true)
axeDestruction:vocation("knight")
axeDestruction:register()
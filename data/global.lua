math.randomseed(os.time())
dofile('data/lib/lib.lua')

GAMESTORE_MOUNT_DISCOUNT = 200
GAMESTORE_OUTFIT_DISCOUNT = 200

MONSTER_RUN_HEALTH_RATE = 1.5
MONSTER_SUMMON_MULT = 500

-- AutoLoot config
AUTO_LOOT_MAX_ITEMS = 10

-- Reserved storage
AUTOLOOT_STORAGE_START = 48484848
AUTOLOOT_STORAGE_END = AUTOLOOT_STORAGE_START + AUTO_LOOT_MAX_ITEMS
-- AutoLoot config end

-- CoinsHour
GET_DAY_STORAGE_HOURCOIN = 48485000
MAX_STORAGE_HOURCOIN = 48485001
MAX_COUNT_HOURCOIN = 5

-- AccessStorage
ACCESS_AREAS_QUEST_BLOQUEADO = 48485002
ACCESS_AREAS_QUEST = 48485003

-- TibiaCoinsLevelUp
TIBIA_COIN_LVL_20 = 48485004
TIBIA_COIN_LVL_30 = 48485005
TIBIA_COIN_LVL_40 = 48485006
TIBIA_COIN_LVL_50 = 48485007
TIBIA_COIN_LVL_60 = 48485008
TIBIA_COIN_LVL_70 = 48485009
TIBIA_COIN_LVL_80 = 48485010
TIBIA_COIN_LVL_90 = 48485011
TIBIA_COIN_LVL_100 = 48485012
TIBIA_COIN_LVL_150 = 48485013
TIBIA_COIN_LVL_200 = 48485014
TIBIA_COIN_LVL_250 = 48485015
TIBIA_COIN_LVL_300 = 48485016
TIBIA_COIN_LVL_reservado1 = 48485017
TIBIA_COIN_LVL_r2 = 48485018
TIBIA_COIN_LVL_reo3 = 48485019
TIBIA_COIN_LVL_rdo4 = 48485020

SANTA_CLAUS_PRESENT = 48485021

NOT_MOVEABLE_ACTION = 100
PARTY_PROTECTION = 1 -- Set to 0 to disable.
ADVANCED_SECURE_MODE = 1 -- Set to 0 to disable.

STORAGEVALUE_PROMOTION = 30018

SERVER_NAME = configManager.getString(configKeys.SERVER_NAME)

-- Event Schedule
SCHEDULE_LOOT_RATE = 100
SCHEDULE_EXP_RATE = 100
SCHEDULE_SKILL_RATE = 100

-- MARRY
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
PROPACCEPT_STATUS = 3
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502

-- Scarlett Etzel
SCARLETT_MAY_TRANSFORM = 0
SCARLETT_MAY_DIE = 0

ropeSpots = {384, 418, 8278, 8592, 13189, 14436, 15635, 19518, 26019, 24621, 24622, 24623, 24624}
specialRopeSpots = { 14435 }

-- Impact Analyser
-- Every 2 seconds
updateInterval = 2
-- Healing
-- Global table to insert data
healingImpact = {}
-- Damage
-- Global table to insert data
damageImpact = {}

-- New prey => preyTimeLeft
nextPreyTime = {}

startupGlobalStorages = {
	GlobalStorage.TheAncientTombs.AshmunrahSwitchesGlobalStorage,
	GlobalStorage.TheAncientTombs.DiprathSwitchesGlobalStorage,
	GlobalStorage.TheAncientTombs.ThalasSwitchesGlobalStorage,
	GlobalStorage.HeroRathleton.FirstMachines,
	GlobalStorage.HeroRathleton.SecondMachines,
	GlobalStorage.HeroRathleton.ThirdMachines,
	GlobalStorage.HeroRathleton.DeepRunning,
	GlobalStorage.HeroRathleton.HorrorRunning,
	GlobalStorage.HeroRathleton.LavaRunning,
	GlobalStorage.HeroRathleton.MaxxenRunning,
	GlobalStorage.HeroRathleton.LavaCounter,
	GlobalStorage.HeroRathleton.FourthMachines,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal1,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal2,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal3,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal4,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal5,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal6,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal7,
	GlobalStorage.FerumbrasAscendant.Crystals.Crystal8,
	GlobalStorage.FerumbrasAscendant.Crystals.AllCrystals,
	GlobalStorage.FerumbrasAscendant.FerumbrasEssence,
	GlobalStorage.Feroxa.Active,
	GlobalStorage.FerumbrasAscendant.Habitats.AllHabitats,
	GlobalStorage.FerumbrasAscendant.Elements.Active,
	GlobalStorage.FerumbrasAscendant.Elements.First,
	GlobalStorage.FerumbrasAscendant.Elements.Second,
	GlobalStorage.FerumbrasAscendant.Elements.Third,
	GlobalStorage.FerumbrasAscendant.Elements.Done
}

do -- Event Schedule rates
	local lootRate = Game.getEventSLoot()
	if lootRate ~= 100 then
		SCHEDULE_LOOT_RATE = lootRate
	end

	local expRate = Game.getEventSExp()
	if expRate ~= 100 then
		SCHEDULE_EXP_RATE = expRate
	end

	local skillRate = Game.getEventSSkill()
	if skillRate ~= 100 then
		SCHEDULE_SKILL_RATE = skillRate
	end
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.splitTrimmed = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v:trim()
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

-- Stamina
if nextUseStaminaTime == nil then
	nextUseStaminaTime = {}
end

if nextUseStaminaPrey == nil then
	nextUseStaminaPrey = {}
end

if nextUseXpStamina == nil then
	nextUseXpStamina = {}
end

if lastItemImbuing == nil then
	lastItemImbuing = {}
end

if nextDelayPreyReroll == nil then
	nextDelayPreyReroll = {}
end

-- Delay potion
if not playerDelayPotion then
	playerDelayPotion = {}
end

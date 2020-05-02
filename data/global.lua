-- WARNING: function preyTimeLeft: Using the "/reload global" command will cause a problem in timing of the prey

math.randomseed(os.time())
dofile('data/lib/lib.lua')

NOT_MOVEABLE_ACTION = 100
PARTY_PROTECTION = 1 -- Set to 0 to disable.
ADVANCED_SECURE_MODE = 1 -- Set to 0 to disable.

STORAGEVALUE_PROMOTION = 30018

TOWNS_LIST = {
	ROOKGAARD = 1,
	ROOKGAARD_TUTORIAL_ISLAND = 2,
	ISLAND_OF_DESTINY = 3,
	DAWNPORT = 4,
	AB_DENDRIEL = 5,
	CARLIN = 6,
	KAZORDOON = 7,
	THAIS = 8,
	VENORE = 9,
	ANKRAHMUN = 10,
	EDRON = 11,
	FARMINE = 12,
	DARASHIA = 13,
	LIBERTY_BAY = 14,
	PORT_HOPE = 15,
	SVARGROND = 16,
	YALAHAR = 17,
	GRAY_BEACH = 18,
	KRAILOS = 19,
	RATHLETON = 20,
	ROSHAMUUL = 21,
	ISSAVI = 22
}

ropeSpots = {384, 418, 8278, 8592, 13189, 14435, 14436, 15635, 19518, 26019, 24621, 24622, 24623, 24624}

--[ Impact Analyser ]--
updateInterval = 2 --every 2 seconds
-- Healing
healingImpact = {} -- global table to insert data
-- Damage
damageImpact = {} -- global table to insert data

-- New prey => preyTimeLeft
nextPreyTime = {}

-- From here down are the functions of TFS
function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getLootRandom()
	return math.random(0, MAX_LOOTCHANCE) / configManager.getNumber(configKeys.RATE_LOOT)
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

-- From here down are the custom functions

local start = os.time()
local linecount = 0
debug.sethook(function(event, line)
	linecount = linecount + 1
	if os.mtime() - start >= 1 then
		if linecount >= 30000 then
			print(string.format("possible infinite loop in file %s near line %s", debug.getinfo(2).source, line))
			debug.sethook()
		end
		linecount = 0
		start = os.time()
	end
end, "l")

function doCreatureSayWithRadius(cid, text, type, radiusx, radiusy, position)
	if not position then
		position = Creature(cid):getPosition()
	end

	local spectators, spectator = Game.getSpectators(position, false, true, radiusx, radiusx, radiusy, radiusy)
	for i = 1, #spectators do
		spectator = spectators[i]
		spectator:say(text, type, false, spectator, position)
	end
end

function getRateFromTable(t, level, default)
	for _, rate in ipairs(t) do
		if level >= rate.minlevel and (not rate.maxlevel or level <= rate.maxlevel) then
			return rate.multiplier
		end
	end

	return default
end

function isInRange(pos, fromPos, toPos)
	return pos.x >= fromPos.x and pos.y >= fromPos.y and pos.z >= fromPos.z and pos.x <= toPos.x and pos.y <= toPos.y and pos.z <= toPos.z
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function Creature.getMonster(self)
	return self:isMonster() and self or nil
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

--Boss entry
if not bosssPlayers then
	bosssPlayers = {
		addPlayers = function (self, cid)
			local player = Player(cid)
			if not player then return false end
			if not self.players then
				self.players = {}
			end
			self.players[player:getId()] = 1
		end,
		removePlayer = function (self, cid)
			local player = Player(cid)
			if not player then return false end
			if not self.players then return false end
			self.players[player:getId()] = nil
		end,
		getPlayersCount = function (self)
			if not self.players then return 0 end
			local c = 0
			for _ in pairs(self.players) do c = c + 1 end
			return c
		end
	}
end

-- function for the reload talkaction
local logFormat = "[%s] %s %s"

function logCommand(player, words, param)
	local file = io.open("data/logs/" .. player:getName() .. " commands.log", "a")
	if not file then
		return
	end

	io.output(file)
	io.write(logFormat:format(os.date("%d/%m/%Y %H:%M"), words, param):trim() .. "\n")
	io.close(file)
end

-- MARRY
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
PROPACCEPT_STATUS = 3
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502

function getPlayerSpouse(id)
	local resultQuery = db.storeQuery("SELECT `marriage_spouse` FROM `players` WHERE `id` = " .. db.escapeString(id))
	if resultQuery ~= false then
		local ret = result.getDataInt(resultQuery, "marriage_spouse")
		result.free(resultQuery)
		return ret
	end
	return -1
end

function setPlayerSpouse(id, val)
	db.query("UPDATE `players` SET `marriage_spouse` = " .. val .. " WHERE `id` = " .. id)
end

function getPlayerMarriageStatus(id)
	local resultQuery = db.storeQuery("SELECT `marriage_status` FROM `players` WHERE `id` = " .. db.escapeString(id))
	if resultQuery ~= false then
		local ret = result.getDataInt(resultQuery, "marriage_status")
		result.free(resultQuery)
		return ret
	end
	return -1
end

function setPlayerMarriageStatus(id, val)
	db.query("UPDATE `players` SET `marriage_status` = " .. val .. " WHERE `id` = " .. id)
end

function Player:getMarriageDescription(thing)
	local descr = ""
	if getPlayerMarriageStatus(thing:getGuid()) == MARRIED_STATUS then
		playerSpouse = getPlayerSpouse(thing:getGuid())
		if self == thing then
			descr = descr .. " You are "
		elseif thing:getSex() == PLAYERSEX_FEMALE then
			descr = descr .. " She is "
		else
			descr = descr .. " He is "
		end
		descr = descr .. "married to " .. getPlayerNameById(playerSpouse) .. '.'
	end
	return descr
end

-- Marry
function getPlayerNameById(id)
	local resultName = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. db.escapeString(id))
	local name = result.getDataString(resultName, "name")
	if resultName ~= false then
		result.free(resultName)
		return name
	end
	return false
end

-- Prey slots consumption
-- WARNING: function preyTimeLeft: Using the "/reload global" command will cause a problem in timing of the prey
function preyTimeLeft(player, slot)
	local timeLeft = player:getPreyTimeLeft(slot) / 60
	local monster = player:getPreyCurrentMonster(slot)
	if (timeLeft > 0) then
		local playerId = player:getId()
		local currentTime = os.time()
		local timePassed = currentTime - nextPreyTime[playerId][slot]
		if timePassed >= 59 then
			timeLeft = timeLeft - 1
			nextPreyTime[playerId][slot] = currentTime + 60
		else
			timeLeft = timeLeft - 0
		end
		if (timeLeft < 1) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your %s's prey has expired.", monster:lower()))
			player:setPreyCurrentMonster(slot, "")
		end
		-- Setting new timeLeft
		player:setPreyTimeLeft(slot, timeLeft * 60)
	else
		-- Expiring prey as there's no timeLeft
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your %s's prey has expired.", monster:lower()))
		player:setPreyCurrentMonster(slot, "")
	end
	return player:sendPreyData(slot)
end

-- The following 2 functions can be used for delayed shouted text
function say(param)
	selfSay(text)
	doCreatureSay(param.cid, param.text, 1)
end

function delayedSay(text, delay)
	local delaySay = delay or 0
	local cid = getNpcCid()
	addEvent(say, delaySay, {cid = cid, text = text})
end

function functionRevert()
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Corrupted, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Desert, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Dimension, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Grass, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Ice, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Mushroom, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Roshamuul, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.Venom, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Habitats.AllHabitats, 0)
	for a = 1, #basins do
		local item = Tile(basins[a].pos):getItemById(24852)
		item:transform(12070)
	end
	local specs, spec = Game.getSpectators(Position(33629, 32693, 12), false, false, 25, 25, 85, 85)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			spec:teleportTo(Position(33630, 32648, 12))
			spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spec:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You were teleported because the habitats are returning to their original form.')
		elseif spec:isMonster() then
			spec:remove()
		end
	end
	for x = 33611, 33625 do
		for y = 32658, 32727 do
			local position = Position(x, y, 12)
			local tile = Tile(position)
			if not tile then
				return
			end
			local ground = tile:getGround()
			if not ground then
				return
			end
			ground:remove()
			local items = tile:getItems()
			if items then
				for i = 1, #items do
					local item = items[i]
					item:remove()
				end
			end
		end
	end

	for x = 33634, 33648 do
		for y = 32658, 32727 do
			local position = Position(x, y, 12)
			local tile = Tile(position)
			if not tile then
				return
			end
			local ground = tile:getGround()
			if not ground then
				return
			end
			ground:remove()
			local items = tile:getItems()
			if items then
				for i = 1, #items do
					local item = items[i]
					item:remove()
				end
			end
		end
	end

	Game.loadMap('data/world/worldchanges/habitats.otbm')
	return true
end

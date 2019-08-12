dofile('data/lib/libs.lua')

NOT_MOVEABLE_ACTION = 8000
PARTY_PROTECTION = 1 -- Set to 0 to disable.
ADVANCED_SECURE_MODE = 1 -- Set to 0 to disable.

STORAGEVALUE_PROMOTION = 30018
STORAGEVALUE_ASSISTS = 30000
STORAGEVALUE_DEATHS = 30001
STORAGEVALUE_KILLS = 30002

customDoorsRange = {
	{ openDoor = 26545, closedDoor = 26541 },
	{ openDoor = 26545, closedDoor = 26542 },
	{ openDoor = 26546, closedDoor = 26543 },
	{ openDoor = 26546, closedDoor = 26544 },
	{ openDoor = 33121, closedDoor = 33117 },
	{ openDoor = 33121, closedDoor = 33118 },
	{ openDoor = 33122, closedDoor = 33119 },
	{ openDoor = 33122, closedDoor = 33120 },
	{ openDoor = 34673, closedDoor = 34671 },
	{ openDoor = 34674, closedDoor = 34672 },
	{ openDoor = 34677, closedDoor = 34675 },
	{ openDoor = 34678, closedDoor = 34676 },
}

ropeSpots = {384, 418, 8278, 8592, 13189, 14435, 14436, 15635, 19518, 26019, 24621, 24622, 24623, 24624}

doors = {
	[1209] = 1211, [1210] = 1211, [1212] = 1214, [1213] = 1214, [1219] = 1220, [1221] = 1222, [1231] = 1233, [1232] = 1233, [1234] = 1236,
	[1235] = 1236, [1237] = 1238, [1239] = 1240, [1249] = 1251, [1250] = 1251, [1252] = 1254, [1253] = 1254, [1539] = 1540, [1541] = 1542,
	[3535] = 3537, [3536] = 3537, [3538] = 3539, [3544] = 3546, [3545] = 3546, [3547] = 3548, [4913] = 4915, [4914] = 4915, [4916] = 4918,
	[4917] = 4918, [5082] = 5083, [5084] = 5085, [5098] = 5100, [5099] = 5100, [5101] = 5102, [5107] = 5109, [5108] = 5109, [5110] = 5111,
	[5116] = 5118, [5117] = 5118, [5119] = 5120, [5125] = 5127, [5126] = 5127, [5128] = 5129, [5134] = 5136, [5135] = 5136, [5137] = 5139,
	[5138] = 5139, [5140] = 5142, [5141] = 5142, [5143] = 5145, [5144] = 5145, [5278] = 5280, [5279] = 5280, [5281] = 5283, [5282] = 5283,
	[5284] = 5285, [5286] = 5287, [5515] = 5516, [5517] = 5518, [5732] = 5734, [5733] = 5734, [5735] = 5737, [5736] = 5737, [6192] = 6194,
	[6193] = 6194, [6195] = 6197, [6196] = 6197, [6198] = 6199, [6200] = 6201, [6249] = 6251, [6250] = 6251, [6252] = 6254, [6253] = 6254,
	[6255] = 6256, [6257] = 6258, [6795] = 6796, [6797] = 6798, [6799] = 6800, [6801] = 6802, [6891] = 6893, [6892] = 6893, [6894] = 6895,
	[6900] = 6902, [6901] = 6902, [6903] = 6904, [7033] = 7035, [7034] = 7035, [7036] = 7037, [7042] = 7044, [7043] = 7044, [7045] = 7046,
	[7054] = 7055, [7056] = 7057, [8541] = 8543, [8542] = 8543, [8544] = 8546, [8545] = 8546, [8547] = 8548, [8549] = 8550, [9165] = 9167,
	[9166] = 9167, [9168] = 9170, [9169] = 9170, [9171] = 9172, [9173] = 9174, [9267] = 9269, [9268] = 9269, [9270] = 9272, [9271] = 9272,
	[9273] = 9274, [9275] = 9276, [10276] = 10277, [10274] = 10275, [10268] = 10270, [10269] = 10270, [10271] = 10273, [10272] = 10273, [10471] = 10472,
	[10480] = 10481, [10477] = 10479, [10478] = 10479, [10468] = 10470, [10469] = 10470, [10775] = 10777, [10776] = 10777, [12092] = 12094, [12093] = 12094,
	[12188] = 12190, [12189] = 12190, [19840] = 19842, [19841] = 19842, [19843] = 19844, [19980] = 19982, [19981] = 19982, [19983] = 19984, [20273] = 20275,
	[20274] = 20275, [20276] = 20277, [17235] = 17236, [18208] = 18209, [13022] = 13023, [10784] = 10786, [10785] = 10786, [12099] = 12101, [12100] = 12101,
	[12197] = 12199, [12198] = 12199, [19849] = 19851, [19850] = 19851, [19852] = 19853, [19989] = 19991, [19990] = 19991, [19992] = 19993, [20282] = 20284,
	[20283] = 20284, [20285] = 20286, [17237] = 17238, [13020] = 13021, [10780] = 10781, [12095] = 12096, [12195] = 12196, [19845] = 19846, [19985] = 19986,
	[20278] = 20279, [10789] = 10790, [12102] = 12103, [12204] = 12205, [19854] = 19855, [19994] = 19995, [20287] = 20288, [10782] = 10783, [12097] = 12098,
	[12193] = 12194, [19847] = 19848, [19987] = 19988, [20280] = 20281, [10791] = 10792, [12104] = 12105, [12202] = 12203, [19856] = 19857, [19996] = 19997,
	[20289] = 20290, [22814] = 22815, [22815] = 22816, [22817] = 22818, [22819] = 22820, [22823] = 22825, [22824] = 22825, [22826] = 22827, [22828] = 22829,
	[25158] = 25159, [25160] = 25161, [25162] = 25163, [25164] = 25165, [27209] = 27210, [27211] = 27212, [33295] = 33296, [34679] = 34680, [34681] = 34682,
	[34683] = 34684, [34685] = 34686

}

verticalOpenDoors = {
	1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1251, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131,
	5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044,
	7046, 7048, 7050, 7055, 8543, 8548, 8552, 8556, 9167, 9172, 9269, 9274, 9274, 9269, 9278, 9282, 10270, 10275, 10279, 10283, 10479, 10481, 10485, 10483,
	10786, 12101, 12199, 19851, 19853, 19991, 19993, 20284, 20286, 17238, 13021, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997,
	20290, 22825, 22827, 22829, 22831, 25159, 25163, 26546
}

horizontalOpenDoors = {
	1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1254, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118,
	5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893,
	6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057, 8546, 8550, 8554, 8558, 9170, 9174, 9272, 9276, 9280, 9284, 10273, 10277, 10281, 10285,
	10470, 10472, 10476, 10474, 10777, 12094, 12190, 19842, 19844, 19982, 19984, 20275, 20277, 17236, 18209, 13023, 10781, 12096, 12196,
	19846, 19986, 20279, 10783, 12098, 12194, 19848, 19988, 20281, 22816, 22818, 22820, 22822, 25161, 25165, 26545
}

openSpecialDoors = {
	1224, 1226, 1228, 1230, 1242, 1244, 1246, 1248, 1256, 1258, 1260, 1262, 3541, 3543, 3550, 3552, 5104, 5106, 5113, 5115, 5122, 5124, 5131, 5133,
	5289, 5291, 5293, 5295, 6203, 6205, 6207, 6209, 6260, 6262, 6264, 6266, 6897, 6899, 6906, 6908, 7039, 7041, 7048, 7050, 8552, 8554, 8556, 8558,
	9176, 9178, 9180, 9182, 9278, 9280, 9282, 9284, 10279, 10281, 10283, 10285, 10474, 10476, 10483, 10485, 10781, 12096, 12196, 19846, 19986, 20279,
	10783, 12098, 12194, 19848, 19988, 20281, 10790, 12103, 12205, 19855, 19995, 20288, 10792, 12105, 12203, 19857, 19997, 20290
}

questDoors = {
	1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049,
	8551, 8553, 9175,9177, 9277, 9279, 10278, 10280, 10475, 10484, 10782, 12097, 19847, 19987, 20280, 10791, 12104, 12204, 12195, 19856, 19996, 20289,
	22821, 22830, 25162, 25164
}

levelDoors = {
	1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047, 8555, 8557,9179, 9181,
	9281, 9283, 10282, 10284, 10473, 10482, 10780, 10789, 10780, 12095, 12195, 19845, 19985, 20278, 10789, 12102, 12193, 12202, 19854, 19994, 20287
}

keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092, 10032}

--[ Impact Analyser ]--
updateInterval = 2 --every 2 seconds
-- Healing
healingImpact = {} -- global table to insert data
-- Damage
damageImpact = {} -- global table to insert data

-- New prey => preyTimeLeft
nextPreyTime = {}


  --
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
 --

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

function getBlessingsCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 120 then
		return 20000
	else
		return (level - 20) * 200
	end
end

function getPvpBlessingCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 270 then
		return 50000
	else
		return (level - 20) * 200
	end
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

function getTibianTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
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
			if not player then  return false end
			if not self.players then return false end
			self.players[player:getId()] = nil
		end,
		getPlayersCount = function (self)
			if not self.players then return 0 end
			local c = 0
			for _ in pairs(self.players) do  c = c + 1 end
			return c
		end
	}
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

-- The following 2 functions can be used for delayed shouted text
function say(param)
selfSay(text)
doCreatureSay(param.cid, param.text, 1)
end

function delayedSay(text, delay)
local delay = delay or 0
local cid = getNpcCid()
addEvent(say, delay, {cid = cid, text = text})
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

function getLootRandom()
	math.randomseed(os.mtime())
	return math.random(0, MAX_LOOTCHANCE) / configManager.getNumber(configKeys.RATE_LOOT)
end

table.append = table.insert
table.empty = function (t)
    return next(t) == nil
end

table.find = function (table, value)
    for i, v in pairs(table) do
        if(v == value) then
            return i
        end
    end

    return nil
end

table.count = function (table, item)
    local count = 0
    for i, n in pairs(table) do
        if(item == n) then
            count = count + 1
        end
    end

    return count
end
table.countElements = table.count

table.getCombinations = function (table, num)
    local a, number, select, newlist = {}, #table, num, {}
    for i = 1, select do
        a[#a + 1] = i
    end

    local newthing = {}
    while(true) do
        local newrow = {}
        for i = 1, select do
            newrow[#newrow + 1] = table[a[i]]
        end

        newlist[#newlist + 1] = newrow
        i = select
        while(a[i] == (number - select + i)) do
            i = i - 1
        end

        if(i < 1) then
            break
        end

        a[i] = a[i] + 1
        for j = i, select do
            a[j] = a[i] + j - i
        end
    end

    return newlist
end

function table.serialize(x, recur)
    local t = type(x)
    recur = recur or {}

    if(t == nil) then
        return "nil"
    elseif(t == "string") then
        return string.format("%q", x)
    elseif(t == "number") then
        return tostring(x)
    elseif(t == "boolean") then
        return t and "true" or "false"
    elseif(getmetatable(x)) then
        error("Can not serialize a table that has a metatable associated with it.")
    elseif(t == "table") then
        if(table.find(recur, x)) then
            error("Can not serialize recursive tables.")
        end
        table.append(recur, x)

        local s = "{"
        for k, v in pairs(x) do
            s = s .. "[" .. table.serialize(k, recur) .. "]"
            s = s .. " = " .. table.serialize(v, recur) .. ","
        end
        s = s .. "}"
        return s
    else
        error("Can not serialize value of type '" .. t .. "'.")
    end
end

function table.unserialize(str)
    return loadstring("return " .. str)()
end


function doCreatureSetNoMove(cid,allow)
if allow then
local speed = Player(cid):getSpeed()
Player(cid):changeSpeed(-speed)
      else
    doChangeSpeed(cid, getSpeed(cid, getPlayerLevel(cid)) - getCreatureSpeed(cid))
end
end
 
function getSpeed(cid,level)
  value = (220 +(2 *(level -1)))
  return value
end
 
 function timeString(timeDiff, roundVal, roundUpVal)
  if roundVal and roundVal <= timeDiff then
    timeDiff = timeDiff - (roundUpVal or 0)
    timeDiff = timeDiff - timeDiff % -roundVal
  end
 
  if timeDiff <= 0 then
    return "none"
  end
 
  local dateValues = {
      {"week", timeDiff / 60 / 60 / 7},
      {"day", timeDiff / 60 / 60 / 24},
      {"hour", timeDiff / 60 / 60 % 24},
      {"minute", timeDiff / 60 % 60},
      {"second", timeDiff % 60}
  }
 
  local result = {}
  for _, dateValue in ipairs(dateValues) do
    local value = math.floor(dateValue[2])
    if value > 0 then
      table.insert(result, ("%d %s%s"):format(value, dateValue[1], value ~= 1 and "s" or ""))
    end
  end
 
  local ret = table.concat(result, ", ", 1, math.max(1, #result - 1))
  if #result > 1 then
    ret = ("%s and %s"):format(ret, result[#result])
  end
  return ret
end
 
function mtimeString(timeDiff, ...)
  return timeString(timeDiff / 1000, ...)
end


function showTimeLeft(number, usewords)
   local number = tonumber(number)
   if not number then
     return "error"
   end
 
   if number < 0 then
     return "expired"
   end
 
   local clocknum = os.date("!%X",number):split(":") -- h:m:s
   local day = math.modf(number / 86400)
   local hour = clocknum[1]
   local minute = clocknum[2]
   local second = clocknum[3]
 
   if not usewords then
     return table.concat({day, hour, minute, second}, ":")
   end
 
   local text = {}
   if day > 0 then
     table.insert(text, tonumber(day) .. " day" .. (day > 1 and "s" or ""))
   end
 
   if hour ~= "00" then
     table.insert(text, tonumber(hour) .. " hour" .. (tonumber(hour) > 1 and "s" or ""))
   end
 
   if minute ~= "00" then
     table.insert(text, tonumber(minute) .. " minute" .. (tonumber(minute) > 1 and "s" or ""))
   end
 
   if second ~= "00" then
     table.insert(text, tonumber(second) .. " second" .. (tonumber(second) > 1 and "s" or ""))
   end
 
   countdown_text = ""
   if #text > 0 then
     countdown_text = text[1]
     for i = 2, #text - 1 do
       countdown_text = countdown_text .. ", " .. text[i]
     end
     if #text > 1 then
       countdown_text = countdown_text .. " and " .. text[#text]
     end
     countdown_text = countdown_text .. " left."
   else
     countdown_text = "expired"
   end
return countdown_text
end

function saveServer()
  if connectedOnSaveServer then
    for _,information in ipairs (connectedOnSaveServer) do
      local params = {}
      if not information.executeFunction(params) then return false end
    end
  end

 -- doServerSave()
end

function Player.getDepotItems(self, depotId)
  return self:getDepotChest(depotId, true):getItemHoldingCount()
end

function Creature.getPlayer(self)
  return self:isPlayer() and self or nil
end

function Player.getClosestFreePosition(self, position, extended)
  if self:getAccountType() >= ACCOUNT_TYPE_GOD then
    return position
  end
  return Creature.getClosestFreePosition(self, position, extended)
end

function Creature.getClosestFreePosition(self, position, extended)
  local usePosition = Position(position)
  local tiles = { usePosition:getTile() }
  local length = extended and 2 or 1
  
  local tile
  for y = -length, length do
    for x = -length, length do
      if x ~= 0 or y ~= 0 then
        usePosition.x = position.x + x
        usePosition.y = position.y + y
        
        tile = usePosition:getTile()
        if tile then
          tiles[#tiles + 1] = tile
        end
      end
    end
  end
  
  for i = 1, #tiles do
    tile = tiles[i]
    if tile:getCreatureCount() == 0 and not tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) then
      return tile:getPosition()
    end
  end
  return Position()
end

function Position.getNextPosition(self, direction, steps)
  steps = steps or 1
  if direction == WEST then
    self.x = self.x - steps
  elseif direction == EAST then
    self.x = self.x + steps
  elseif direction == NORTH then
    self.y = self.y - steps
  elseif direction == SOUTH then
    self.y = self.y + steps
  elseif direction == NORTHWEST then
    self.x = self.x - steps
    self.y = self.y - steps
  elseif direction == NORTHEAST then
    self.x = self.x + steps
    self.y = self.y - steps
  elseif direction == SOUTHWEST then
    self.x = self.x - steps
    self.y = self.y + steps
  elseif direction == SOUTHEAST then
    self.x = self.x + steps
    self.y = self.y + steps
  end
end

function Game.getReverseDirection(direction)
  if direction == WEST then
    return EAST
  elseif direction == EAST then
    return WEST
  elseif direction == NORTH then
    return SOUTH
  elseif direction == SOUTH then
    return NORTH
  elseif direction == NORTHWEST then
    return SOUTHEAST
  elseif direction == NORTHEAST then
    return SOUTHWEST
  elseif direction == SOUTHWEST then
    return NORTHEAST
  elseif direction == SOUTHEAST then
    return NORTHWEST
  end
  return NORTH
end


function Game.convertIpToString(ip)
  local band = bit.band
  local rshift = bit.rshift
  return string.format("%d.%d.%d.%d",
    band(ip, 0xFF),
    band(rshift(ip, 8), 0xFF),
    band(rshift(ip, 16), 0xFF),
    rshift(ip, 24)
  )
end


function createClass(parent)
  local newClass = {}
  function newClass:new(instance)
    local instance = instance or {}
    setmetatable(instance, {__index = newClass})
    return instance
  end

  if(parent ~= nil) then
    setmetatable(newClass, {__index = parent})
  end

  function newClass:getSelf()
    return newClass
  end

  function newClass:getParent()
    return baseClass
  end

  function newClass:isa(class)
    local tmp = newClass
    while(tmp ~= nil) do
      if(tmp == class) then
        return true
      end

      tmp = tmp:getParent()
    end

    return false
  end
  
  function newClass:setAttributes(attributes)
    for k, v in pairs(attributes) do
      newClass[k] = v
    end
  end

  return newClass
end


if(result == nil) then
  print("> WARNING: Couldn't load database lib.")
  return
end

Result = createClass(nil)
Result:setAttributes({
  id = -1,
  query = ""
})

function Result:getID()
  return self.id
end

function Result:setID(_id)
  self.id = _id
end

function Result:getQuery()
  return self.query
end

function Result:setQuery(_query)
  self.query = _query
end

function Result:create(_query)
  self:setQuery(_query)
  local _id = db.storeQuery(self:getQuery())
  if(_id) then
    self:setID(_id)
  end

  return self:getID()
end

function Result:getRows(free)
  local free = free or false
  if(self:getID() == -1) then
--    error("[Result:getRows] Result not set!")
    return 0
  end

  local c = 0
  repeat
    c = c + 1
  until not self:next()

  local _query = self:getQuery()
  self:free()
  if(not free) then
    self:create(_query)
  end

  return c
end

function Result:getDataInt(s)
  if(self:getID() == -1) then
    error("[Result:getDataInt] Result not set!")
  end

  return result.getDataInt(self:getID(), s)
end

function Result:getDataLong(s)
  if(self:getID() == -1) then
    error("[Result:getDataLong] Result not set!")
  end

  return result.getDataLong(self:getID(), s)
end

function Result:getDataString(s)
  if(self:getID() == -1) then
    error("[Result:getDataString] Result not set!")
  end

  return result.getDataString(self:getID(), s)
end

function Result:getDataStream(s)
  if(self:getID() == -1) then
    error("[Result:getDataStream] Result not set!")
  end

  return result.getDataStream(self:getID(), s)
end

function Result:next()
  if(self:getID() == -1) then
    error("[Result:next] Result not set!")
  end

  return result.next(self:getID())
end

function Result:free()
  if(self:getID() == -1) then
    error("[Result:free] Result not set!")
  end

  self:setQuery("")
  local ret = result.free(self:getID())
  self:setID(-1)
  return ret
end

Result.numRows = Result.getRows
function db.getResult(query)
  if(type(query) ~= 'string') then
    return nil
  end

  local ret = Result:new()
  ret:create(query)
  return ret
end

print("> Addons ==> Database - loaded successfully!")

g_logger = {}

function g_logger.createUniqueLog(name, information)
  if g_config.doLogGeneralStuff then
    local result = db.getResult("SELECT * FROM `general_log` WHERE `name` = '".. name .."';")

    if (result:getID() ~= -1) then
      db.query("DELETE FROM `general_log` WHERE `name` = '" .. name .. "';")
    end

    db.query("INSERT INTO `general_log` (`name`, `information`, `date`) VALUES ('" .. name .. "', '" .. information .. "', " .. os.time() .. ");")
  end
end

function g_logger.getLogInfo(name)
  local result = db.getResult("SELECT * FROM `general_log` WHERE `name` = '".. name .."';")

  if (result:getID() ~= -1) then
    return result:getDataString("information"), os.date(result:getDataInt("date"))
  end

  return false
end

module("matrix", package.seeall)

_G.DEGREES_0 = 0
_G.DEGREES_90 = 90
_G.DEGREES_180 = 180
_G.DEGREES_270 = 270

_G.DIRECTION_VERTICAL = 0
_G.DIRECTION_HORIZONTAL = 1

local function rotate_90(matrix)
        local ret = {}

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[w-x+1] then
                                ret[w-x+1] = {}
                        end

                        ret[w-x+1][y] = v
                end
        end

        return ret
end

local function rotate_180(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[h-y+1] then
                                ret[h-y+1] = {}
                        end

                        ret[h-y+1][w-x+1] = v
                end
        end

        return ret
end

local function rotate_270(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                for x, v in ipairs(matrix[y]) do
                        if not ret[x] then
                                ret[x] = {}
                        end

                        ret[x][h-y+1] = v
                end
        end

        return ret
end

local function mirror_v(matrix)
        local ret = {}
        local h = #matrix

        for y in ipairs(matrix) do
                for x, v in ipairs(matrix[y]) do
                        if not ret[h-y+1] then
                                ret[h-y+1] = {}
                        end

                        ret[h-y+1][x] = v
                end
        end

        return ret
end

local function mirror_h(matrix)
        local ret = {}

        for y in ipairs(matrix) do
                local w = #matrix[y]

                for x, v in ipairs(matrix[y]) do
                        if not ret[y] then
                                ret[y] = {}
                        end

                        ret[y][w-x+1] = v
                end
        end

        return ret
end

function rotate(matrix, degrees)
        degrees = degrees % 360

        if degrees == DEGREES_0 then
                return matrix
        elseif degrees == DEGREES_90 then
                return rotate_90(matrix)
        elseif degrees == DEGREES_180 then
                return rotate_180(matrix)
        elseif degrees == DEGREES_270 then
                return rotate_270(matrix)
        end

        error("Invalid degree value to function 'rotate'.", 2)
        return false
end

function mirror(matrix, direction)
        if direction == DIRECTION_VERTICAL then
                return mirror_v(matrix)
        elseif direction == DIRECTION_HORIZONTAL then
                return mirror_h(matrix)
        end

        error("Invalid direction to function 'mirror'.", 2)
        return false
end

print("> Addons ==> Matrix - loaded successfully!")


-- Advanced Storage System

function getStorage(self, key)
  if not isPlayer(self) then
    return false
  end

  if not key or not type(key) == "string" then
    return false
  end

  local result = db.getResult("SELECT * FROM `advanced_storage` WHERE `guid` = '".. self:getGuid() .."' AND `key` = '".. key .."';")

  if result:getID() == -1 then
    return false
  end

  local value = result:getDataString("value")

  if not value then
    return false
  end

  return value
end

function registerStorage(self, key, value)
  if not isPlayer(self) then
    return false
  end

  if value and self:getStorage(key) then
    db.query("UPDATE `advanced_storage` SET `value` = '" .. value .. "' WHERE `guid` = '" .. self:getGuid() .. "' AND `key` = '" .. key .. "';")
  elseif not value and self:getStorage(key) then
    db.query("DELETE FROM `advanced_storage` WHERE `guid` = '" .. self:getGuid() .. "' AND `key` = '" .. key .. "';")
  elseif value and not self:getStorage(key) then
    db.query("INSERT INTO `advanced_storage` (`guid`, `key`, `value`) VALUES (" .. self:getGuid() .. ", '" .. key .. "',  '" .. value .. "');")
  elseif not value and not self:getStorage(key) then
    return false
  end

  return true
end

Player.registerStorage = registerStorage
Player.getStorage = getStorage


Table = {}

function Table.val_to_str(v)
  if "string" == type(v) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and Table.tostring( v ) or
      tostring( v )
  end
end

function Table.key_to_str(k)
  if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
    return k
  else
    return "[" .. Table.val_to_str( k ) .. "]"
  end
end

function Table.tostring(tbl)
  if not tbl then
    return false
  end

  if type(tbl) ~= "table" then
    return false
  end

  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, Table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        Table.key_to_str( k ) .. "=" .. Table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function Table.dump(tbl)
  if not tbl then
    return false
  end

  if type(tbl) ~= "table" then
    return false
  end

  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, Table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        "\n"..Table.key_to_str( k ) .. "=" .. Table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function Table.getTableFromString(string)
  if not string then
    return false
  end

  if not type(string) == "string" then
    return false
  end

  local table = loadstring("return "..string)()

  if not type(table) == "table" then
    return false
  end

  return table
end

function Table.copy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

function table.getn(t)
  if type(t.n) == "number" then return t.n end
  local max = 0
  for i, _ in t do
    if type(i) == "number" and i>max then max=i end
  end
  return max
end

function table.shuffle(t)
    local rand = math.random 
    assert( t, "shuffleTable() expected a table, got nil" )
    local iterations = #t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

print("> Addons ==> Table aditional functions - loaded successfully!")
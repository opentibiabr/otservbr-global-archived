function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getNumber(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

function clearBossRoom(playerId, bossId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		if spectator:isMonster() then
			spectator:remove()
		end
	end
end

function clearRoom(centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:remove()
		end
	end
end

function roomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end

function clearForgotten(fromPosition, toPosition, exitPosition, storage)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			for z = fromPosition.z, toPosition.z do
				if Tile(Position(x, y, z)) then
					local creature = Tile(Position(x, y, z)):getTopCreature()
					if creature then
						if creature:isPlayer() then
							creature:teleportTo(exitPosition)
							exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
							creature:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
						elseif creature:isMonster() then
							creature:remove()
						end
					end
				end
			end
		end
	end
	Game.setStorageValue(storage, 0)
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

--function getBankMoney(cid, amount)
 --local player = Player(cid)
 --if player:getBankBalance() >= amount then
 -- player:setBankBalance(player:getBankBalance() - amount)
 -- player:sendTextMessage(MESSAGE_INFO_DESCR, "Paid " .. amount .. " gold from bank account. Your account balance is now " .. player:getBankBalance() .. " gold.")
 -- return true
-- end
 --return false
--end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
end

function getRealDate()
	local month = tonumber(os.date("%m", os.time()))
	local day = tonumber(os.date("%d", os.time()))

	if month < 10 then
		month = '0' .. month
	end
	if day < 10 then
		day = '0' .. day
	end
	return day .. '/' .. month
end

function getRealTime()
	local hours = tonumber(os.date("%H", os.time()))
	local minutes = tonumber(os.date("%M", os.time()))

	if hours < 10 then
		hours = '0' .. hours
	end
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function isValidMoney(money)
	return isNumber(money) and money > 0 and money < 4294967296
end

function iterateArea(func, from, to)
	for z = from.z, to.z do
		for y = from.y, to.y do
			for x = from.x, to.x do
				func(Position(x, y, z))
			end
		end
	end
end

function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
	return false
end

function checkWallArito(item, toPosition)
	if (not item:isItem()) then
		return false
	end
	local wallTile = Tile(Position(33206, 32536, 6))
	if not wallTile or wallTile:getItemCountById(8202) > 0 then
		return false
	end
	local checkEqual = {
		[2016] = {Position(33207, 32537, 6), {5858, -1}, Position(33205, 32537, 6)},
		[2419] = {Position(33205, 32537, 6), {2016, 1}, Position(33207, 32537, 6),5858}
	}
	local it = checkEqual[item:getId()]
	if(it and it[1] == toPosition and Tile(it[3]):getItemCountById(it[2][1], it[2][2]) > 0)then
		wallTile:getItemById(877):transform(8202)

		if(it[4])then
			item:transform(it[4])
		end

		addEvent(
			function()
				if(Tile(Position(33206, 32536, 6)):getItemCountById(8202) > 0) then
					Tile(Position(33206, 32536, 6)):getItemById(8202):transform(877)
				end
				if(Tile(Position(33205, 32537, 6)):getItemCountById(5858) > 0) then
					Tile(Position(33205, 32537, 6)):getItemById(5858):remove()
				end
			end, 1*60*1000
		)
	else
		if(it and it[4] and it[1] == toPosition)then
			item:transform(it[4])
		end
	end
end

function placeSpawnRandom(fromPositon, toPosition, monsterName, ammount, hasCall, storage, value, removestorage, sharedHP, event, message)
	for _x = fromPositon.x, toPosition.x do
		for _y = fromPositon.y, toPosition.y do
			for _z = fromPositon.z, toPosition.z do
				local tile = Tile(Position(_x,_y,_z))
				if not removestorage then
					if tile and tile:getTopCreature() and tile:getTopCreature():isMonster() and tile:getTopCreature():getName() == monsterName then
						tile:getTopCreature():remove()
					end
				else
					if tile and tile:getTopCreature() and tile:getTopCreature():isMonster() and tile:getTopCreature():getStorageValue(storage) == value then
						tile:getTopCreature():remove()
					end
				end
			end
		end
	end
		if ammount and ammount > 0 then
			local summoned = 0
			local tm = os.time()
			repeat
				local tile = false
				-- repeat
					local position = {x = math.random(fromPositon.x, toPosition.x), y = math.random(fromPositon.y, toPosition.y), z = math.random(fromPositon.z, toPosition.z)}
					-- tile = Tile(position)
					-- passando = tile and #tile:getItems() <= 0
				-- until (passando == true)
				local monster = Game.createMonster(monsterName, position)
				if monster then
					summoned = summoned + 1
					-- setando o primeiro spawn
					monster:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					if(hasCall) then
						monster:setStorage(storage, value)
						if sharedHP then
							monster:beginSharedLife(tm)
							monster:registerEvent("sharedLife")
						end
						if event then
							monster:registerEvent(event)
						end
						local function SendMessage(mit, message)
							if not Monster(mit) then
								return false
							end
							Monster(mit):say(message, TALKTYPE_MONSTER_SAY)
						end
						if message then
							addEvent(SendMessage, 200,monster:getId(), message)
						end
					end
				end
			until (summoned == ammount)
		end
end

function getMonstersInArea(fromPos, toPos, monsterName, ignoreMonsterId)
	local monsters = {}
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				local tile = Tile(Position(_x,_y,_z))
				if tile and tile:getTopCreature() then
					for _, pid in pairs(tile:getCreatures()) do
						local mt = Monster(pid)
						if not ignoreMonsterId then
							if(mt and mt:isMonster() and mt:getName():lower() == monsterName:lower() and not mt:getMaster() )then
								monsters[#monsters + 1] = mt
							end
						else
							if(mt and mt:isMonster() and mt:getName():lower() == monsterName:lower() and not mt:getMaster() and ignoreMonsterId ~= mt:getId())then
								monsters[#monsters + 1] = mt
							end
						end
					end
				end
			end
		end
	end
	return monsters
end

function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end

function cleanAreaQuest(frompos, topos, itemtable, blockmonsters)
	if not itemtable then
		itemtable = {}
	end
	if not blockmonsters then
		blockmonsters = {}
	end
	for _x = frompos.x, topos.x do
		for _y = frompos.y, topos.y do
			for _z = frompos.z, topos.z do
				local tile = Tile(Position(_x, _y, _z))
				if tile then
					local itc = tile:getItems()
					if itc and tile:getItemCount() > 0 then
						for _, pid in pairs(itc) do
							local itp = ItemType(pid:getId())
							if itp and itp:isCorpse() then
								pid:remove()
							end
						end
					end
					for _, pid in pairs(itemtable) do
						local _until = tile:getItemCountById(pid)
						if _until > 0 then
							for i = 1, _until do
								local it = tile:getItemById(pid)
								if it then
									it:remove()
								end
							end
						end
					end
					local mtempc = tile:getCreatures()
					if mtempc and tile:getCreatureCount() > 0 then
						for _, pid in pairs(mtempc) do
							if pid:isMonster() and not isInArray(blockmonsters, pid:getName():lower()) then
								-- broadcastMessage(pid:getName())
								pid:remove()
							end
						end
					end
				end
			end
		end
	end
	return true
end

function kickerPlayerRoomAfferMin(playername, fromPosition, toPosition, teleportPos, message, monsterName, minutes, firstCall, itemtable, blockmonsters)
	local players = false
	if type(playername) == table then
		players = true
	end
	local player = false
	if not players then
		player = Player(playername)
	end
	local monster = {}
	if monsterName ~= '' then
		monster = getMonstersInArea(fromPosition, toPosition, monsterName)
	end
	if player == false and players == false then
		return false
	end
	if not players and player then
		if player:getPosition():isInRange(fromPosition, toPosition) and minutes == 0 then
			if monsterName ~= '' then
				for _, pid in pairs(monster) do
					if pid:isMonster() then
						if pid:getStorageValue("playername") == playername then
							pid:remove()
						end
					end
				end
			else
				if not itemtable then
					itemtable = {}
				end
				if not blockmonsters then
					blockmonsters = {}
				end
				cleanAreaQuest( fromPosition, toPosition, itemtable, blockmonsters)
			end
			player:teleportTo(teleportPos, true)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
			return true
		end
	else
		if  minutes == 0 then
			if monsterName ~= '' then
				for _, pid in pairs(monster) do
					if pid:isMonster() then
						if pid:getStorageValue("playername") == playername then
							pid:remove()
						end
					end
				end
			else
				if not itemtable then
					itemtable = {}
				end
				if not blockmonsters then
					blockmonsters = {}
				end
				cleanAreaQuest( fromPosition, toPosition, itemtable, blockmonsters)
			end
			for _, pid in pairs(playername) do
				local player = Player(pid)
				if player and player:getPosition():isInRange(fromPosition, toPosition)then
					player:teleportTo(teleportPos, true)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
				end
			end
			return true
		end
	end
	local min = 60 -- use o 60 para 1 minuto
	if(firstCall)then
		addEvent(kickerPlayerRoomAfferMin, 1000,playername, fromPosition, toPosition, teleportPos, message, monsterName, minutes, false, itemtable, blockmonsters)
		-- broadcastMessage("Comecou contar em ".. minutes .." minutoss")
	else
		local subt = minutes-1
		if(monsterName ~= '')then
			if minutes > 3 and table.maxn(monster) == 0 then
				subt = 2
			end
		end
		addEvent(kickerPlayerRoomAfferMin, min*1000,playername, fromPosition, toPosition, teleportPos, message, monsterName, subt, false, itemtable, blockmonsters)
	end
end

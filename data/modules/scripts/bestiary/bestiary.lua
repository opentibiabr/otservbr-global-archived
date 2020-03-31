Bestiary = {}

Bestiary.Credits = {
    Developer = "gpedro, DudZ, ticardo, lBaah",
	Version = "1.0",
	lastUpdate = "31/03/2020 - 12:00"
}

Bestiary.Config = {
	PremiumRunesAmount = 6,
	FreeRunesAmount = 3,
	ResetMonsterPriceModifierXLevel = 100,
	EnabledRunes = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
	Multiplicator = 0.05, --TODO implement this variable
	Probability = 0.05 -- TODO implement this variable
}

dofile('data/modules/scripts/bestiary/assets.lua')

Bestiary.S_Packets = {
    SendBestiaryData = 0xd5,
    SendBestiaryOverview = 0xd6,
    SendBestiaryMonsterData = 0xd7,
	SendBestiaryCharmsData = 0xd8
}

Bestiary.C_Packets = {
    RequestBestiaryData = 0xe1,
    RequestBestiaryOverview = 0xe2,
    RequestBestiaryMonsterData = 0xe3,
	RequestBestiaryCharmUnlock = 0xe4
}

Bestiary.findRaceByName = function(race)
    local races = Bestiary.Races
    for i = 1, #races do
        if (races[i].name == race) then
            return races[i]
        end
    end
    return false
end


Bestiary.getRaceByMonsterId = function(monsterId)
    local races = Bestiary.Races
    for i = 1, #races do
        if table.contains(races[i].monsters, monsterId) then
            return races[i].name
        end
    end
    return false
end

Bestiary.sendCreatures = function(player, msg)
    local playerLocal = Player(player:getId())
    if not playerLocal then
        return true
    end

    local unknown = msg:getByte()
    local raceName = msg:getString()

    local race = Bestiary.findRaceByName(raceName)
    if not race then
        print("> [Bestiary]: race was not found: "..raceName)
        return true
    end

    local msg = NetworkMessage()
    msg:addByte(Bestiary.S_Packets.SendBestiaryOverview)
    msg:addString(race.name) -- race name
    msg:addU16(#race.monsters) -- monster count
	creaturesKilled = player:getBestiaryCountByRace(race)
    for i = 1, #race.monsters do
        msg:addU16(race.monsters[i]) -- monster name
		if creaturesKilled[race.monsters[i]] ~= nil then
			msg:addU16(Bestiary.GetKillStatus(Bestiary.Monsters[race.monsters[i]], creaturesKilled[race.monsters[i]])) -- monster kill count (starts by 1)
		else
			msg:addByte(0) --Blacks out unknown monsters
		end
    end

    msg:sendToPlayer(player)
end

Bestiary.sendRaces = function(player, msg)
    local playerLocal = Player(player:getId())
    if not playerLocal then
        return true
    end
    local msg = NetworkMessage()
    msg:addByte(Bestiary.S_Packets.SendBestiaryData)
    msg:addU16(#Bestiary.Races)
    for k, race in ipairs(Bestiary.Races) do
        msg:addString(race.name)
        msg:addU16(#race.monsters)
        msg:addU16(player:getBestiaryRaceUnlocked(race))
    end
    msg:sendToPlayer(player)
end


Bestiary.sendCharms = function(player, msg)
    local playerLocal = Player(player:getId())
    if not playerLocal then
        return true
    end

	local removeRuneCost = Bestiary.getRemoveRuneCost(player)

    local msg = NetworkMessage()
    msg:addByte(Bestiary.S_Packets.SendBestiaryCharmsData)
	msg:addU32(player:getCharmPoints())

	local playerCurBit = player:getCharmUnlockedRunesBit()

    msg:addByte(#Bestiary.Config.EnabledRunes)
    for i = 1, #Bestiary.Config.EnabledRunes do
		local k = Bestiary.Config.EnabledRunes[i]
		local charm = Bestiary.Charms[k]
		msg:addByte(k) -- id
        msg:addString(charm.name) --name
        msg:addString(charm.description) --description
        msg:addByte(0) --TODO unknown (unlocked?) 0 ok | 1-2 não faz nada | 3+ n�o testado
		msg:addU16(charm.points) --charm points needed charm.points

		--if player:hasCharmRune(charm) then
		if player:hasCharmUnlockedRuneBit(charm, playerCurBit) then
			msg:addByte(1) -- Charm liberado = 1 | bloqueado = 0
			local charmCreature = player:getCharmRuneCreature(charm)
			if charmCreature > 0 then
				msg:addByte(1) -- Tem criatura selecionada
				msg:addU16(charmCreature)
				msg:addU32(removeRuneCost)
			else
				msg:addByte(0)  -- Não Tem criatura selecionada
			end
		else
			msg:addByte(0) -- charm bloqueado
			msg:addByte(0) -- nenhum monstro selecionado
		end
    end
	msg:addByte(4) -- 0x4?? 0x10??

	--Send unlocked and unused monsters 

	local finishedMonsters = player:getBestiaryFinished()
	local usedRunes = player:getCharmUsedRuneBitAll()

	for i = 1, #usedRunes do
		local thisCharm = Bestiary.Charms[usedRunes[i]]
		local thisCharmCreature  = player:getCharmRuneCreature(thisCharm)
		table.remove(finishedMonsters, table.find(finishedMonsters, thisCharmCreature))
	end
	
	msg:addU16(#finishedMonsters)
	for i = 1, #finishedMonsters do
		msg:addU16(finishedMonsters[i]) -- monster id que já foram terminados, pra poder selecionar no charm (menos monstros que ja tem charm aplicado)
	end

    msg:sendToPlayer(player)
end

Bestiary.sendBuyCharmRune = function(player, msg)
    local playerLocal = Player(player:getId())
    if not playerLocal then
        return true
    end

	local playerCharmAmount = player:getCharmPoints()

    local runeID = msg:getByte()
	local action = msg:getByte()
	local monsterID = msg:getU16()
    local thisCharm = Bestiary.Charms[runeID]
	if action == 0 then -- buy charm
		if playerCharmAmount < thisCharm.points then
			player:popupFYI("You don't have enough charm points to unlock this rune.")
			return
		end
		player:popupFYI("You sucessfully unlocked \"".. thisCharm.name .."\" for ".. thisCharm.points .." charm points.")
		player:setCharmPoints(player:getCharmPoints() - thisCharm.points)

		local curBit = player:getCharmUnlockedRunesBit()
		player:setCharmUnlockedRuneBit(Bestiary.bitToggle(curBit, thisCharm.id, true))
		curBit = player:getCharmUnlockedRunesBit()

	elseif action == 1 then -- set creature
		local usedRunes = player:getCharmUsedRuneBitAll()
		local hasExpansion = player:getCharmRuneSlotExpansion()
		local isPremium = player:isPremium()
		local limitRunes = 0
		local message = "Creature has been set!"
		if isPremium then
			if hasExpansion then
				limitRunes = 100
			else
				limitRunes = Bestiary.Config.PremiumRunesAmount
				message = "Creature has been set!\n\nYou are Premium player, so you benefit from up to ".. limitRunes .." runes!\nCharm Expansion allow you to set creatures to all runes at once!"
			end
		else
			limitRunes = Bestiary.Config.FreeRunesAmount
			message = "Creature has been set!\n\nYou are not a Premium player, so you can only benefit from up to ".. limitRunes .." runes!\nPremium players can hold up to ".. Bestiary.Config.PremiumRunesAmount .." creatures at once.\nCharm Expansion allow you to set creatures to all runes at once!"
		end
		if limitRunes <= #usedRunes then
			player:popupFYI("You don't have any charm slots available.")
			return
		end
		--player:setCharmRuneUsedAmount(usedRunes + 1)  REPLACED BY BIT
		player:setCharmRuneCreature(thisCharm, monsterID)
		player:popupFYI(message)
		
	elseif action == 2 then -- reset creature
		if not player:removeMoneyNpc(Bestiary.getRemoveRuneCost(player)) then
			player:popupFYI("You don't have enough gold.")
			return
		end
		player:resetCharmRuneCreature(thisCharm)
		player:popupFYI("You sucessfully removed the creature.")
	end
	
    print("> [Bestiary]: Trying to buy rune: "..runeID)
    return true
end

Bestiary.GetKillStatus = function(bestiaryMonster, killAmount)
    if killAmount < bestiaryMonster.FirstUnlock then
        return Bestiary.KillStatus.FIRST_LEVEL
    elseif killAmount < bestiaryMonster.SecondUnlock then
        return Bestiary.KillStatus.SECOND_LEVEL
    elseif killAmount < bestiaryMonster.toKill then
        return Bestiary.KillStatus.THIRD_LEVEL
    end
	return Bestiary.KillStatus.FINISHED
end

Bestiary.getRemoveRuneCost = function(player)
	return player:getLevel()*Bestiary.Config.ResetMonsterPriceModifierXLevel
end

Bestiary.sendMonsterData = function(player, msg)
    local playerLocal = Player(player:getId())
    if not playerLocal then
        return true
    end

    local monsterId = msg:getU16()
    local race = Bestiary.getRaceByMonsterId(monsterId)
    if not race then
        print("> [Bestiary]: race was not found")
        return true
    end
    local bestiaryMonster = Bestiary.Monsters[monsterId]
    if not bestiaryMonster then
        print("> [Bestiary]: monster was not found")
        return true
    end

    local monster = MonsterType(bestiaryMonster.name)
    if not monster then
        print("> [Bestiary]: monstertype was not found")
        return true
    end
    local killCounter = player:getBestiaryCountByMonster(Bestiary.MonstersName[bestiaryMonster.name])

	local currentLevel = Bestiary.GetKillStatus(bestiaryMonster, killCounter)

    local msg = NetworkMessage()
    msg:addByte(Bestiary.S_Packets.SendBestiaryMonsterData)
    msg:addU16(monsterId)
    msg:addString(race)

    msg:addByte(currentLevel) -- Progess
    
    msg:addU32(killCounter) -- kill count
    msg:addU16(bestiaryMonster.FirstUnlock) -- max kill first phase
    msg:addU16(bestiaryMonster.SecondUnlock)  -- max kill second phase
    msg:addU16(bestiaryMonster.toKill)  -- max kill third phase

    msg:addByte(bestiaryMonster.Stars)  -- Difficult
    msg:addByte(Bestiary.getMonsterOccurrencyByName(bestiaryMonster.name)) -- Occurence
	local monsterLoot = monster:getLoot()
    msg:addByte(#monsterLoot)

    if #monsterLoot > 0 then
        for i = 1, #monsterLoot do
            local loot = monsterLoot[i]
            local item = ItemType(loot.itemId)
            if item then 
                local type = 0 -- TODO 0 = normal loot   /  1 = special event loot
                local difficult = Bestiary.calculateDifficult(loot.chance)
				msg:addItemId(killCounter > 0 and loot.itemId or 0)
                msg:addByte(difficult)
                msg:addByte(type)
				if killCounter > 0 then
					msg:addString(item:getName())
					msg:addByte(item:isStackable() and 0x1 or 0x0)
				end
            end
        end
    end

    if currentLevel > 1 then
        msg:addU16(bestiaryMonster.CharmsPoints)
        local attackMode = 0
        if monster:isPassive() then
            attackMode = 2
        elseif monster:targetDistance() then
            attackMode = 1
        end

        msg:addByte(attackMode) -- 0 = meele / 1 = distance / 2 = doenst attack
        msg:addByte(0x2) -- flag for cast spells
        msg:addU32(monster:maxHealth())
        msg:addU32(monster:experience())
        msg:addU16(monster:baseSpeed())
        msg:addU16(monster:armor())
    end

    if currentLevel > 2 then
        local monsterElements = Bestiary.getMonsterElements(monster)

        -- elements size
        msg:addByte(#monsterElements)
        local i = 0
        for _, value in pairs(monsterElements) do
            -- elements id
            msg:addByte(i)

            -- element percent
            msg:addU16(value)

            i = i + 1
        end
		local bestiaryCreatureFinishingKeys = ""
		for b = 1, #Bestiary.CreatureEncryptionOrder do
			for i = #Bestiary.CreatureEncryptionKeys[Bestiary.CreatureEncryptionOrder[b]], 1, -1 do
				bestiaryCreatureFinishingKeys = bestiaryCreatureFinishingKeys .. Bestiary.CreatureEncryptionKeys[Bestiary.CreatureEncryptionOrder[b]]:sub(i,i)
			end
		end
        msg:addU16(1) --TODO DESCRIPTION
        msg:addString(bestiaryCreatureFinishingKeys)
    end

    if currentLevel > 3 then
        -- charm things
        msg:addByte(0)
        msg:addByte(0)
    end

    msg:sendToPlayer(player)
end

Bestiary.getMonsterElements = function (monster) 
    local elements = monster:getElementList()
    local monsterElements = Bestiary.getDefaultElements()

    for element, value in pairs(elements) do
        if monsterElements[element] then
            local percent = 100 + tonumber(value)
            monsterElements[element] = percent
        end
    end

    return monsterElements
end

Bestiary.calculateDifficult = function (chance)
    chance = chance / 1000

    if chance < 0.2 then
       return 4
    end 
    if chance < 1 then
       return 3
    end 
    if chance < 5 then
       return 2
    end 
    if chance < 25 then
        return 1
    end
    return 0
end

Bestiary.getMonsterOccurrencyByName = function(monsterName)
	for i, b in pairs(Bestiary.MonstersOccurrency) do
		if table.contains(b.monsters, monsterName) then
			return i
		end
	end
	return Bestiary.Occurencies.HARMLESS_ORDINARY

end

function onRecvbyte(player, msg, byte)
	Bestiary.setupDatabase()
    if (byte == Bestiary.C_Packets.RequestBestiaryData) then
        Bestiary.sendRaces(player)
        Bestiary.sendCharms(player)
    elseif (byte == Bestiary.C_Packets.RequestBestiaryOverview) then
        Bestiary.sendCreatures(player, msg)
    elseif (byte == Bestiary.C_Packets.RequestBestiaryMonsterData) then
        Bestiary.sendMonsterData(player, msg)
    elseif (byte == Bestiary.C_Packets.RequestBestiaryCharmUnlock) then
        Bestiary.sendBuyCharmRune(player, msg)
        Bestiary.sendCharms(player)
		--TestarBytes(player,msg)
    end
end

Bestiary.setupDatabase = function()
	db.query([[CREATE TABLE IF NOT EXISTS `bestiary_killcount` (
		`player_id` INT NULL,
		`monster_id` INT UNSIGNED NULL,
		`count` INT UNSIGNED NULL,
		`finished` BOOLEAN DEFAULT '0',

		CONSTRAINT `bestiary_killcount_players_fk` FOREIGN KEY (`player_id`) REFERENCES `trindera_global`.`players` (`id`)
	)]])
end

function Player.getBestiaryRaceUnlocked(self, raceObject) --Returns int with the unlocked amount
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT COUNT(monster_id) as c FROM `bestiary_killcount` WHERE player_id = " .. playerId .. " AND `monster_id` IN (" .. table.concat(raceObject.monsters, ",") .. ")")
	local count = result.getNumber(query, "c")
	result.free(query)
	return count
end

function Player.getBestiaryCountByRace(self, raceObject) --Returns table indexed by monsterID and by kill count
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT `monster_id`, `count` FROM `bestiary_killcount` WHERE player_id = " .. playerId .. " AND `monster_id` IN (" .. table.concat(raceObject.monsters, ",") .. ")")
	local raceMonsters = {}
	
	if query then
		repeat
			local monsterID = result.getNumber(query, "monster_id")
			local count = result.getNumber(query, "count")

			raceMonsters[monsterID] = count
		until not result.next(query)

		result.free(query)
	end

	return raceMonsters
end

function Player.getBestiaryCountByMonster(self, monsterID) --Returns int with the kill count
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT `count` FROM `bestiary_killcount` WHERE `player_id` = " .. playerId.. " AND `monster_id` = "..monsterID)
	local count = 0
	if query then
		count = result.getNumber(query, "count")
		result.free(query)
	end

	return count
end

function Player.getBestiaryFinished(self) --Return table with monster ID of all finished monsters
	local playerId = self:getGuid()
	local query = db.storeQuery("SELECT `monster_id` FROM `bestiary_killcount` WHERE `player_id` = " .. playerId.. " AND `finished` = 1")
	local finishedMonsters = {}
	
	if query then
		repeat
			local monsterID = result.getNumber(query, "monster_id")
			table.insert(finishedMonsters, monsterID)
		until not result.next(query)

		result.free(query)
	end
	return finishedMonsters
end

function Player.getCharmPoints(self)
	local cp = self:getStorageValue(Bestiary.Storage.PLAYER_CHARM_POINTS)
	if cp == nil or cp < 0 then
		cp = 0
		self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_POINTS, cp)
	end
	return cp
end

function Player.addCharmPoints(self, amount)
	self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_POINTS, self:getCharmPoints() + amount)
end

function Player.setCharmPoints(self, value)
	self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_POINTS, value)
end

function Player.getCharmUnlockedRunesBit(self)
	return math.max(self:getStorageValue(Bestiary.Storage.PLAYER_CHARM_RUNE_BIT), 0)
end

function Player.hasCharmUnlockedRuneBit(self, charmRuneObj, input) 
	if not input then
		input = self:getCharmUnlockedRunesBit()
	end
	return not (bit.band(input, Bestiary.CharmsBinaries[charmRuneObj.id]) == 0)
end

function Player.setCharmUnlockedRuneBit(self, value) 
	self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_RUNE_BIT, value)
end

function Player.getCharmUsedRunesBit(self)
	local c = math.max(self:getStorageValue(Bestiary.Storage.PLAYER_CHARM_RUNE_USED_BIT), 0)
	return c
end

function Player.hasCharmUsedRuneBit(self, charmRuneObj, input) 
	if type(charmRuneObj) == "string" then
		charmRuneObj = Bestiary.CharmsNames[charmRuneObj]
		if not charmRuneObj then
			return false
		end
		charmRuneObj = Bestiary.Charms[charmRuneObj]
	elseif type(charmRuneObj) == "number" then
		charmRuneObj = Bestiary.Charms[charmRuneObj]
	end
	if not input then
		input = self:getCharmUsedRunesBit()
	end
	return not bit.band(input, Bestiary.CharmsBinaries[charmRuneObj.id]) == 0
end

function Player.setCharmUsedRuneBit(self, value) 
	self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_RUNE_USED_BIT, value)
end

function Player.getCharmUsedRuneBitAll(self, input)
	if not input then
		input = self:getCharmUsedRunesBit()
	end
	return Bestiary.bitSet(input)
end

function Player.resetCharmRuneCreature(self, charmRuneObj, creatureID)
	self:setCharmUsedRuneBit(Bestiary.bitToggle(self:getCharmUsedRunesBit(), charmRuneObj.id, false))
	self:setStorageValue(charmRuneObj.storageMonster, 0)
end

function Player.setCharmRuneCreature(self, charmRuneObj, creatureID)
	self:setCharmUsedRuneBit(Bestiary.bitToggle(self:getCharmUsedRunesBit(), charmRuneObj.id, true))
	self:setStorageValue(charmRuneObj.storageMonster, creatureID)
end

function Player.getCharmRuneCreature(self, charmRuneObj)
	return math.max(self:getStorageValue(charmRuneObj.storageMonster), 0)
end

function Player.getCharmRuneSlotExpansion(self)
	return math.max(self:getStorageValue(Bestiary.Storage.PLAYER_CHARM_SLOT_EXPANSION), 0) == 1
end

function Player.setCharmRuneSlotExpansion(self, onOff)
	self:setStorageValue(Bestiary.Storage.PLAYER_CHARM_SLOT_EXPANSION, onOff and 1 or 0)
end

function Player.addBestiaryKill(self, monsterId) --MonsterID can be Name

	if type(monsterId) == "string" then
		monsterId = Bestiary.MonstersName[monsterId]
		if not monsterId then
			return
		end
	end
	local plId = self:getGuid()
	local curCount = self:getBestiaryCountByMonster(monsterId)
	local monster = Bestiary.Monsters[monsterId]
	if curCount == 0 then
		db.query("INSERT INTO `bestiary_killcount` (`player_id`, `monster_id`, `count`) VALUES (" .. plId .. ", " .. monsterId .. ", 1);")
		self:sendTextMessage(MESSAGE_STATUS_SMALL, 'You unlocked details for creature "'..monster.name..'" ')
		return
	end

	curCount = curCount + 1
	status = Bestiary.GetKillStatus(monster, curCount)
	db.query('UPDATE `bestiary_killcount` SET `count` = ' .. curCount .. ',`finished` = '.. ((status == Bestiary.KillStatus.FINISHED) and 1 or 0) .. ' WHERE `player_id` = ' .. plId .. " AND `monster_id` = "..monsterId)


    if curCount == monster.checkFirst or curCount == monster.checkSecond then
    	self:sendTextMessage(MESSAGE_STATUS_SMALL, 'You unlocked details for creature "'..target:getName()..'" ')
    elseif curCount == monster.toKill then
    	self:sendTextMessage(MESSAGE_STATUS_SMALL, 'You unlocked full details for creature "'..target:getName()..'" ')
		self:addCharmPoints(monster.CharmsPoints)
	end	
end


function Player.getCharmFromTarget(self, target)
	local bestiaryEntry = Bestiary.MonstersName[target:getName()]
	if not bestiaryEntry then
		return nil
	end
	local usedRunes = self:getCharmUsedRuneBitAll()
	if #usedRunes == 0 then
		return nil
	end
	for i = 1, #usedRunes do
		local thisCharm = Bestiary.Charms[usedRunes[i]]
		local thisCharmCreature  = self:getCharmRuneCreature(thisCharm)
		if bestiaryEntry == thisCharmCreature then
			return thisCharm
		end
	end
	return nil
end


Bestiary.bitToggle = function(input, id, on)  -- to add, we use |, which means OR, which in turns make sue that the final number has the flags which both of the left sided and right sided has
	print(on)
	if on then
		return bit.bor(input, Bestiary.CharmsBinaries[id])
	else
		local negateFlag = bit.bnot(Bestiary.CharmsBinaries[id])
		return bit.band(input,negateFlag)
	end
end

Bestiary.bitSet = function(input)  
	local i = 0
	local rtn = {}
	repeat
		if (bit.band(input, 1)) == 1 then
			table.insert(rtn, i)
		end
		input = bit.rshift(input, 1)
		i = i + 1
	until input == 0
    return rtn;
end


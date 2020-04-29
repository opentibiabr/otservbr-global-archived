Bestiary = {}

Bestiary.Credits = {
	Developer = "fernando mieza (flyckks), gpedro, lbaah, Ticardo (Rick), DudZ",
	Version = "1.1",
	lastUpdate = "01/04/2020 - 12:00",
	todo = {
		"Add modifiers for the runes implementation",
		"Add correct monster locations in the bestiary",
		"Fix monster occurency"
	}
}

Bestiary.Config = {
	PremiumRunesAmount = 6,
	FreeRunesAmount = 3,
	ResetMonsterPriceModifierXLevel = 100,
	EnabledRunes = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
	Multiplicator = 0.05, --TODO implement this variable
	Probability = 0.05 -- TODO implement this variable
}

dofile("data/modules/scripts/bestiary/assets.lua")

Bestiary.S_Packets = {
	SendBestiaryData = 0xd5,
	SendBestiaryOverview = 0xd6,
	SendBestiaryMonsterData = 0xd7,
	SendBestiaryCharmsData = 0xd8,
	SendBestiaryTracker = 0xd9
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
	local text = ""
	local monsterIDs = {}
	local search = msg:getByte()
	if search == 1 then
		local monsterAmount = msg:getU16()
		for i = 1, monsterAmount do
			table.insert(monsterIDs, msg:getU16())
		end
	else
		local raceName = msg:getString()

		local race = Bestiary.findRaceByName(raceName)
		if not race then
			print("> [Bestiary]: race was not found: " .. raceName .. " | search " .. search)
			return true
		end
		monsterIDs = race.monsters
		text = race.name
	end
	local msg = NetworkMessage()
	msg:addByte(Bestiary.S_Packets.SendBestiaryOverview)
	msg:addString(text) -- race name
	msg:addU16(#monsterIDs) -- monster count
	creaturesKilled = player:getBestiaryKillCountByMonsterIDs(monsterIDs)
	for i = 1, #monsterIDs do
		msg:addU16(monsterIDs[i]) -- monster name
		if creaturesKilled[monsterIDs[i]] ~= nil then
			msg:addU16(Bestiary.GetKillStatus(Bestiary.Monsters[monsterIDs[i]], creaturesKilled[monsterIDs[i]])) -- monster kill count (starts by 1)
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
				msg:addByte(0) -- Não Tem criatura selecionada
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
		local thisCharmCreature = player:getCharmRuneCreature(thisCharm)
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
		player:popupFYI('You sucessfully unlocked "' .. thisCharm.name .. '" for ' .. thisCharm.points .. " charm points.")
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
				message =
					"Creature has been set!\n\nYou are Premium player, so you benefit from up to " ..
					limitRunes .. " runes!\nCharm Expansion allow you to set creatures to all runes at once!"
			end
		else
			limitRunes = Bestiary.Config.FreeRunesAmount
			message =
				"Creature has been set!\n\nYou are not a Premium player, so you can only benefit from up to " ..
				limitRunes ..
					" runes!\nPremium players can hold up to " ..
						Bestiary.Config.PremiumRunesAmount .. " creatures at once.\nCharm Expansion allow you to set creatures to all runes at once!"
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

	print("> [Bestiary]: Trying to buy rune: " .. runeID)
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
	return player:getLevel() * Bestiary.Config.ResetMonsterPriceModifierXLevel
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
	local killCounter = player:getBestiaryKillCount(Bestiary.MonstersName[bestiaryMonster.name])

	local currentLevel = Bestiary.GetKillStatus(bestiaryMonster, killCounter)

	local msg = NetworkMessage()
	msg:addByte(Bestiary.S_Packets.SendBestiaryMonsterData)
	msg:addU16(monsterId)
	msg:addString(race)

	msg:addByte(currentLevel) -- Progess

	msg:addU32(killCounter) -- kill count
	msg:addU16(bestiaryMonster.FirstUnlock) -- max kill first phase
	msg:addU16(bestiaryMonster.SecondUnlock) -- max kill second phase
	msg:addU16(bestiaryMonster.toKill) -- max kill third phase

	msg:addByte(bestiaryMonster.Stars) -- Difficult
	msg:addByte(bestiaryMonster.Occurrence) -- Occurency
	local monsterLoot = monster:getLoot()
	msg:addByte(#monsterLoot)
	if #monsterLoot > 0 then
		for i = 1, #monsterLoot do
			local loot = monsterLoot[i]
			local item = ItemType(loot.itemId)
			if item then
				local type = 0 -- TODO 0 = normal loot   /  1 = special event loot
				local difficult = Bestiary.calculateDifficult(loot.chance)

				msg:addItemId(currentLevel > 1 and loot.itemId or 0)
				msg:addByte(difficult)
				msg:addByte(type)
				if currentLevel > 1 then
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
				bestiaryCreatureFinishingKeys = bestiaryCreatureFinishingKeys .. Bestiary.CreatureEncryptionKeys[Bestiary.CreatureEncryptionOrder[b]]:sub(i, i)
			end
		end
		msg:addU16(1) --locations
		msg:addString(bestiaryCreatureFinishingKeys)
	end

	if currentLevel > 3 then
		-- charm things
		msg:addByte(0)
		msg:addByte(0)
	end

	msg:sendToPlayer(player)
end

Bestiary.getMonsterElements = function(monster)
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

Bestiary.calculateDifficult = function(chance)
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

function onRecvbyte(player, msg, byte)
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
	end
end

function Player.getBestiaryKillCount(self, monsterID)
	return math.max(self:getStorageValue(Bestiary.Storage.PLAYER_BESTIARY_MONSTER + monsterID), 0)
end

function Player.addBestiaryKillCount(self, monsterID)
	self:setStorageValue(Bestiary.Storage.PLAYER_BESTIARY_MONSTER + monsterID, self:getBestiaryKillCount(monsterID) + 1)
end

function Player.setBestiaryKillCount(self, monsterID, value)
	self:setStorageValue(Bestiary.Storage.PLAYER_BESTIARY_MONSTER + monsterID, value)
end

function Player.getBestiaryRaceUnlocked(self, raceObject)
	local count = 0
	for i = 1, #raceObject.monsters do
		if self:getBestiaryKillCount(raceObject.monsters[i]) > 0 then
			count = count + 1
		end
	end
	return count
end

function Player.getBestiaryKillCountByMonsterIDs(self, monsterTables)
	local raceMonsters = {}
	for i = 1, #monsterTables do
		local thisKilled = self:getBestiaryKillCount(monsterTables[i])
		if thisKilled > 0 then
			raceMonsters[monsterTables[i]] = thisKilled
		end
	end
	return raceMonsters
end

function Player.getBestiaryFinished(self)
	local finishedMonsters = {}
	for i, monster in pairs(Bestiary.Monsters) do
		local thisKilled = self:getBestiaryKillCount(i)
		if thisKilled >= monster.toKill then
			table.insert(finishedMonsters, i)
		end
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

function Player.addBestiaryKill(self, monsterID) --MonsterID can be Name
	if type(monsterID) == "string" then
		monsterID = Bestiary.MonstersName[monsterID]
		if not monsterID then
			return
		end
	end
	local plId = self:getGuid()
	local curCount = self:getBestiaryKillCount(monsterID)
	local monster = Bestiary.Monsters[monsterID]
	if curCount == 0 then
		self:sendBestiaryEntryChanged(monsterID)
		self:setBestiaryKillCount(monsterID, 1)
		self:sendTextMessage(MESSAGE_STATUS_DEFAULT, 'You unlocked details for the creature "' .. monster.name .. '"')
		return
	end

	curCount = curCount + 1
	status = Bestiary.GetKillStatus(monster, curCount)
	self:setBestiaryKillCount(monsterID, curCount)

	if curCount == monster.FirstUnlock or curCount == monster.SecondUnlock then
		self:sendTextMessage(MESSAGE_STATUS_DEFAULT, 'You unlocked details for the creature "' .. monster.name .. '"')
		self:sendBestiaryEntryChanged(monsterID)
	elseif curCount == monster.toKill then
		self:sendTextMessage(MESSAGE_STATUS_DEFAULT, 'You unlocked details for the creature "' .. monster.name .. '"')
		self:addCharmPoints(monster.CharmsPoints)
		self:sendBestiaryEntryChanged(monsterID)
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
		local thisCharmCreature = self:getCharmRuneCreature(thisCharm)
		if bestiaryEntry == thisCharmCreature then
			return thisCharm
		end
	end
	return nil
end

function Player.sendBestiaryEntryChanged(self, monsterID)
	if self:getClient().version < 1200 then
		return
	end
	local msg = NetworkMessage()
	msg:addByte(Bestiary.S_Packets.SendBestiaryTracker)
	msg:addU16(monsterID)
	msg:sendToPlayer(self)
end

Bestiary.bitToggle = function(input, id, on) -- to add, we use |, which means OR, which in turns make sue that the final number has the flags which both of the left sided and right sided has
	if on then
		return bit.bor(input, Bestiary.CharmsBinaries[id])
	else
		local negateFlag = bit.bnot(Bestiary.CharmsBinaries[id])
		return bit.band(input, negateFlag)
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
	return rtn
end

-- Functions from The Forgotten Server
local foodCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)

function Player.feed(self, food)
	local condition = self:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition then
		condition:setTicks(condition:getTicks() + (food * 1000))
	else
		local vocation = self:getVocation()
		if not vocation then
			return nil
		end

		foodCondition:setTicks(food * 1000)
		foodCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, vocation:getHealthGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, vocation:getHealthGainTicks() * 1000)
		foodCondition:setParameter(CONDITION_PARAM_MANAGAIN, vocation:getManaGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_MANATICKS, vocation:getManaGainTicks() * 1000)

		self:addCondition(foodCondition)
	end
	return true
end

function Player.getClosestFreePosition(self, position, extended)
	if self:getGroup():getAccess() and self:getAccountType() >= ACCOUNT_TYPE_GOD then
		return position
	end
	return Creature.getClosestFreePosition(self, position, extended)
end

function Player.getDepotItems(self, depotId)
	return self:getDepotChest(depotId, true):getItemHoldingCount()
end

function Player.hasFlag(self, flag)
	return self:getGroup():hasFlag(flag)
end

function Player.isPremium(self)
	return self:getPremiumDays() > 0 or configManager.getBoolean(configKeys.FREE_PREMIUM)
end

function Player.isPromoted(self)
	local vocation = self:getVocation()
	local promotedVocation = vocation:getPromotion()
	promotedVocation = promotedVocation and promotedVocation:getId() or 0

	return promotedVocation == 0 and vocation:getId() ~= promotedVocation
end

function Player.sendCancelMessage(self, message)
	if type(message) == "number" then
		message = Game.getReturnMessage(message)
	end
	return self:sendTextMessage(MESSAGE_STATUS_SMALL, message)
end

function Player.isUsingOtClient(self)
	return self:getClient().os >= CLIENTOS_OTCLIENT_LINUX
end

function Player.sendExtendedOpcode(self, opcode, buffer)
	if not self:isUsingOtClient() then
		return false
	end

	local networkMessage = NetworkMessage()
	networkMessage:addByte(0x32)
	networkMessage:addByte(opcode)
	networkMessage:addString(buffer)
	networkMessage:sendToPlayer(self)
	networkMessage:delete()
	return true
end

APPLY_SKILL_MULTIPLIER = true
local addSkillTriesFunc = Player.addSkillTries
function Player.addSkillTries(...)
	APPLY_SKILL_MULTIPLIER = false
	local ret = addSkillTriesFunc(...)
	APPLY_SKILL_MULTIPLIER = true
	return ret
end

local addManaSpentFunc = Player.addManaSpent
function Player.addManaSpent(...)
	APPLY_SKILL_MULTIPLIER = false
	local ret = addManaSpentFunc(...)
	APPLY_SKILL_MULTIPLIER = true
	return ret
end

-- Functions From OTServBR-Global
function Player.getCookiesDelivered(self)
	local storage, amount = {
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.SIMONTHEBEGGAR, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.MARKWIN, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.ARIELLA,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.HAIRYCLES, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.DJINN, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.AVARTAR,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.ORCKING, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.LORBAS, STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.WYDA,
		STORAGE.WHATAFOOLISHQUEST.COOKIEDELIVERY.HJAERN
	}, 0
	for i = 1, #storage do
		if self:getStorageValue(storage[i]) == 1 then
			amount = amount + 1
		end
	end
	return amount
end

function Player.allowMovement(self, allow)
	return self:setStorageValue(STORAGE.blockMovementStorage, allow and -1 or 1)
end

function Player.checkGnomeRank(self)
	local points = self:getStorageValue(Storage.BigfootBurden.Rank)
	local questProgress = self:getStorageValue(Storage.BigfootBurden.QuestLine)
	if points >= 30 and points < 120 then
		if questProgress <= 25 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 26)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			self:addAchievement('Gnome Little Helper')
		end
	elseif points >= 120 and points < 480 then
		if questProgress <= 26 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 27)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			self:addAchievement('Gnome Little Helper')
			self:addAchievement('Gnome Friend')
		end
	elseif points >= 480 and points < 1440 then
		if questProgress <= 27 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 28)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			self:addAchievement('Gnome Little Helper')
			self:addAchievement('Gnome Friend')
			self:addAchievement('Gnomelike')
		end
	elseif points >= 1440 then
		if questProgress <= 29 then
			self:setStorageValue(Storage.BigfootBurden.QuestLine, 30)
			self:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			self:addAchievement('Gnome Little Helper')
			self:addAchievement('Gnome Friend')
			self:addAchievement('Gnomelike')
			self:addAchievement('Honorary Gnome')
		end
	end
	return true
end

function Player.addFamePoint(self)
	local points = self:getStorageValue(SPIKE_FAME_POINTS)
	local current = math.max(0, points)
	self:setStorageValue(SPIKE_FAME_POINTS, current + 1)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received a fame point.")
end

function Player.getFamePoints(self)
	local points = self:getStorageValue(SPIKE_FAME_POINTS)
	return math.max(0, points)
end

function Player.removeFamePoints(self, amount)
	local points = self:getStorageValue(SPIKE_FAME_POINTS)
	local current = math.max(0, points)
	self:setStorageValue(SPIKE_FAME_POINTS, current - amount)
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		local town = targetPlayer:getTown()
		if town and town:getId() ~= TOWNS_LIST.DAWNPORT or town:getId() ~= TOWNS_LIST.DAWNPORT_TUTORIAL then -- Blocking transfer to Dawnport
			targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
		end
	else
		if not playerExists(target) then
			return false
		end

		local query_town = db.storeQuery('SELECT `town_id` FROM `players` WHERE `name` = ' .. db.escapeString(target) ..' LIMIT 1;')
		if query_town ~= false then
			local town = result.getDataInt(query_town, "town_id")
			if town then
				local town_id = Town(town) and Town(town):getId()
				if town_id and town_id  == TOWNS_LIST.DAWNPORT or town_id == TOWNS_LIST.DAWNPORT_TUTORIAL then -- Blocking transfer to Dawnport
					return false
				end
			end
			result.free(consulta)
			db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
		end
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.hasAllowMovement(self)
	return self:getStorageValue(STORAGE.blockMovementStorage) ~= 1
end

function Player.hasRookgaardShield(self)
	-- Wooden Shield, Studded Shield, Brass Shield, Plate Shield, Copper Shield
	return self:getItemCount(2512) > 0
		or self:getItemCount(2526) > 0
		or self:getItemCount(2511) > 0
		or self:getItemCount(2510) > 0
		or self:getItemCount(2530) > 0
end


function Player.isSorcerer(self)
	return table.contains({VOCATION.ID.SORCERER, VOCATION.ID.MASTER_SORCERER}, self:getVocation():getId())
end

function Player.isDruid(self)
	return table.contains({VOCATION.ID.DRUID, VOCATION.ID.ELDER_DRUID}, self:getVocation():getId())
end

function Player.isKnight(self)
	return table.contains({VOCATION.ID.KNIGHT, VOCATION.ID.ELITE_KNIGHT}, self:getVocation():getId())
end

function Player.isPaladin(self)
	return table.contains({VOCATION.ID.PALADIN, VOCATION.ID.ROYAL_PALADIN}, self:getVocation():getId())
end

function Player.isMage(self)
	return table.contains({VOCATION.ID.SORCERER, VOCATION.ID.MASTER_SORCERER, VOCATION.ID.DRUID, VOCATION.ID.ELDER_DRUID},
		self:getVocation():getId())
end

-- Impact Analyser
function Player.sendHealingImpact(self, healAmmount)
	local msg = NetworkMessage()
	msg:addByte(0xCC) -- DEC: 204
	msg:addByte(0) -- 0 = healing / 1 = damage (boolean)
	msg:addU32(healAmmount) -- unsigned int
	msg:sendToPlayer(self)
end

function Player.sendDamageImpact(self, damage)
	local msg = NetworkMessage()
	msg:addByte(0xCC) -- DEC: 204
	msg:addByte(1) -- 0 = healing / 1 = damage (boolean)
	msg:addU32(damage) -- unsigned int
	msg:sendToPlayer(self)
end

-- Loot Analyser
function Player.sendLootStats(self, item)
	local msg = NetworkMessage()
	msg:addByte(0xCF) -- loot analyser bit
	msg:addItem(item, self) -- item userdata
	msg:addString(getItemName(item:getId()))
	msg:sendToPlayer(self)
end

-- Supply Analyser
function Player.sendWaste(self, item)
	local msg = NetworkMessage()
	msg:addByte(0xCE) -- waste bit
	msg:addItemId(item) -- itemId
	msg:sendToPlayer(self)
end

local ACCOUNT_STORAGES = {}
function Player.getAccountStorage(self, accountId, key, forceUpdate)
	local accountId = self:getAccountId()
	if ACCOUNT_STORAGES[accountId] and not forceUpdate then
		return ACCOUNT_STORAGES[accountId]
	end

	local query = db.storeQuery("SELECT `key`, MAX(`value`) as value FROM `player_storage` WHERE `player_id` IN (SELECT `id` FROM `players` WHERE `account_id` = ".. accountId ..") AND `key` = ".. key .." GROUP BY `key` LIMIT 1;")
	if query ~= false then
		local value = result.getDataInt(query, "value")
		ACCOUNT_STORAGES[accountId] = value
		result.free(query)
		return value
	end
	return false
end

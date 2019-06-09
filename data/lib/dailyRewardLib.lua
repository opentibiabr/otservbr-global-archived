-- Global virtual tables
staminaRegen = {}
soulRegen = {}

function string.diff(self)
    local format = {
        {'day', self / 60 / 60 / 24},
        {'hour', self / 60 / 60 % 24},
        {'minute', self / 60 % 60},
        {'second', self % 60}
    }

    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('second') then
        local a, b = ret:find(' and ')
        ret = ret:sub(b+1)
    end
    return ret
end

function Game.getLastServerSave()
	return retrieveGlobalStorage(DailyReward.storages.lastServerSave)
end

function updateGlobalStorage(key, value)
	db.query("INSERT INTO `global_storage` (`key`, `value`) VALUES (".. key ..", ".. value ..") ON DUPLICATE KEY UPDATE `value` = ".. value)
end

function retrieveGlobalStorage(key)
	local resultId = db.storeQuery("SELECT `value` FROM `global_storage` WHERE `key` = " .. key)
	if resultId ~= false then
			local val = result.getNumber(resultId, "value")
			result.free(resultId)
			return val
	end
	return 1
end

function Player.getCollectionTokens(self)
	return math.max(self:getStorageValue(DailyReward.storages.collectionTokens), 1)
end

function Player.setCollectionTokens(self, value)
	self:setStorageValue(DailyReward.storages.collectionTokens, value)
end

function Player.getDayStreak(self)
	return math.max(self:getStorageValue(DailyReward.storages.currentDayStreak), 0)
end

function Player.setDayStreak(self, value)
	self:setStorageValue(DailyReward.storages.currentDayStreak, value)
end

function Player.getStreakLevel(self)
	return math.max(self:getStorageValue(DailyReward.storages.currentStreakLevel), 0)
end

function Player.setStreakLevel(self, value)
	self:setStorageValue(DailyReward.storages.currentStreakLevel, value)
end

function Player.setNextRewardTime(self, value)
		self:setStorageValue(DailyReward.storages.nextRewardTime, value)
end

function Player.getNextRewardTime(self)
	return math.max(self:getStorageValue(DailyReward.storages.nextRewardTime), 0)
end

function Player.isRestingAreaBonusActive(self)
	local levelStreak = self:getStreakLevel()
	if levelStreak > 1 then
		return true
	else
		return false
	end
end

local function regenStamina(id, amountStamina, delay)
    local staminaEvent = staminaRegen[id]
    local player = Player(id)
    if not player then
        stopEvent(staminaEvent)
        staminaRegen[id] = nil
        return false
    end
    local actualStamina = player:getStamina()
    if actualStamina > 2400 and actualStamina < 2520 then
        delay = 1 * 60 * 1000 -- Stamina verde 12 mins
    elseif actualStamina == 2520 then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are no longer refilling stamina, because your stamina is already full.")
        stopEvent(staminaEvent)
        staminaRegen[id] = nil
        return false
    end
    player:setStamina(actualStamina + 1)
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "One minute of stamina has been refilled.")
    stopEvent(staminaEvent)
    staminaRegen[id] = addEvent(regenStamina, delay, id, amountStamina, delay)
    return true
end

local function regenSoul(id, soulAmount, delay)
		local soulEvent = soulRegen[id]
    local player = Player(id)
    if not player then
        stopEvent(soulEvent)
        soulRegen[id] = nil
        return false
    end
    local currentSoul = player:getSoul()
		local maxSoul = 100
    if currentSoul >= maxSoul then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are no longer regenerating soul because you have reached the max soul amount.")
        stopEvent(staminaEvent)
        soulRegen[id] = nil
        return false
    end
    player:addSoul(soulAmount)
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "One soul point has been restored.")
    stopEvent(soulEvent)
    soulRegen[id] = addEvent(regenStamina, delay, id, soulAmount, delay)
    return true
end


local DAILY_REWARD_HP_REGENERATION = 2
local DAILY_REWARD_MP_REGENERATION = 3
local DAILY_REWARD_STAMINA_REGENERATION = 4
local DAILY_REWARD_DOUBLE_HP_REGENERATION = 5
local DAILY_REWARD_DOUBLE_MP_REGENERATION = 6
local DAILY_REWARD_SOUL_REGENERATION = 7
local DAILY_REWARD_FIRST = 2
local DAILY_REWARD_LAST = 7

function Player.getActiveDailyRewardBonusesName(self)
	local msg = ""
	local streakLevel = self:getStreakLevel()
	if streakLevel >= 2 then
		if streakLevel > 7 then
			streakLevel = 7
		end
		for i = DAILY_REWARD_FIRST, streakLevel do
			if i ~= streakLevel then
					msg = msg .. "" .. DailyReward.strikeBonuses[i].text .. ", "
			else
					msg = msg .. "" .. DailyReward.strikeBonuses[i].text .. "."
			end
		end
	end
	return msg
end

function Player.getDailyRewardBonusesCount(self)
  local count = 1
  local streakLevel = self:getStreakLevel()
  if streakLevel > 2 then
    if streakLevel > 7 then
      streakLevel = 7
    end
    for i = DAILY_REWARD_FIRST, streakLevel do
      count = count + 1
    end
  else
    count = 0
  end
	return count
end

function Player.isBonusActiveById(self, bonusId)
  local streakLevel = self:getStreakLevel()
  local bonus = "locked"
  if streakLevel > 2 then
    if streakLevel > 7 then
      streakLevel = 7
    end
    if streakLevel >= bonusId then
      bonus = "unlocked"
    end
  end
	return bonus
end

function Player.loadDailyRewardBonuses(self)
	local streakLevel = self:getStreakLevel()
	-- Stamina regeneration
	if streakLevel >= DAILY_REWARD_STAMINA_REGENERATION then
		local staminaEvent = staminaRegen[self:getId()]
		if self:getStamina() < 2520 then
			if not staminaEvent then
				local delay = 1
				if self:getStamina() > 2400 and self:getStamina() <= 2520 then
					delay = 1
				end
				staminaRegen[self:getId()] = addEvent(regenStamina, delay * 60 * 1000, self:getId(), 1, delay * 60 * 1000)
			end
		end
	end
	-- Soul regeneration
	if streakLevel >= DAILY_REWARD_SOUL_REGENERATION then
		local soulEvent = soulRegen[self:getId()]
		if not soulEvent then
			local delay = 1
			soulRegen[self:getId()] = addEvent(regenSoul, delay * 60 * 1000, self:getId(), 1, delay * 60 * 1000)
		end
	end
	--[[ Message for testing
				print(string.format("> Player: %s, streak level: %d, active bonuses: %s", self:getName(), streakLevel, self:getActiveDailyRewardBonusesName()))
	]]--
end

function Player.disableDailyRewardBonuses(self)
	local staminaEvent, soulEvent = staminaRegen[self:getId()], soulRegen[self:getId()]
	if staminaEvent then
		stopEvent(staminaEvent)
		staminaRegen[self:getId()] = nil
	end
	if soulEvent then
		stopEvent(soulEvent)
		soulRegen[self:getId()] = nil
	end
	if self:isRestingAreaBonusActive() then
		self:sendTextMessage(MESSAGE_STATUS_SMALL, "You are not longer receiving daily reward bonuses.")
	end
end

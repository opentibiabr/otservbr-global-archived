DailyRewardSystem = {
  Developer = "Westwol",
  Version = "1.1",
  lastUpdate = "04/06/2019 - 01:00"
}

local ServerPackets = {
  ShowDialog = 0xED, -- universal
  DailyRewardCollectionState = 0xDE, -- undone
  OpenRewardWall = 0xE2, -- Done
  CloseRewardWall = 0xE3, -- is it necessary?
  DailyRewardBasic = 0xE4, -- Done
  DailyRewardHistory = 0xE5, -- Done
  RestingAreaState = 0xA9 -- unodne
}

local ClientPackets = {
  OpenRewardWall = 0xD8,
  OpenRewardHistory = 0xD9,
  SelectReward = 0xDA,
}

--[[-- Constants
Please do not edit any of the next constants:
]]

--[[ Overall ]]--
local DAILY_REWARD_COUNT = 7
local REWARD_FROM_SHRINE = 0
local REWARD_FROM_PANEL = 1

--[[ Bonuses ]] --
local DAILY_REWARD_NONE = 1
local DAILY_REWARD_HP_REGENERATION = 2
local DAILY_REWARD_MP_REGENERATION = 3
local DAILY_REWARD_STAMINA_REGENERATION = 4
local DAILY_REWARD_DOUBLE_HP_REGENERATION = 5
local DAILY_REWARD_DOUBLE_MP_REGENERATION = 6
local DAILY_REWARD_SOUL_REGENERATION = 7

--[[ Reward Types ]] --

-- Server Types
local DAILY_REWARD_TYPE_ITEM = 1
local DAILY_REWARD_TYPE_STORAGE = 2
local DAILY_REWARD_TYPE_PREY_REROLL = 3
local DAILY_REWARD_TYPE_XP_BOOST = 4

-- Client Types
local DAILY_REWARD_SYSTEM_SKIP = 1
local DAILY_REWARD_SYSTEM_TYPE_ONE = 1
local DAILY_REWARD_SYSTEM_TYPE_TWO = 2
local DAILY_REWARD_SYSTEM_TYPE_OTHER = 1
local DAILY_REWARD_SYSTEM_TYPE_PREY_REROLL = 2
local DAILY_REWARD_SYSTEM_TYPE_XP_BOOST = 3

--[[ Account Status ]] --
local DAILY_REWARD_STATUS_FREE = 0
local DAILY_REWARD_STATUS_PREMIUM = 1

DailyReward = {
  testMode = false,
  serverTimeThreshold = (24 * 60 * 60), -- Counting down 24hours from last server save

  storages = {
    -- Player
      currentDayStreak = 14897,
      currentStreakLevel = 14898,
      nextRewardTime = 14899,
      collectionTokens = 14901,
      staminaBonus = 14902,
    -- Global
      lastServerSave = 14110,
      avoidDouble = 13412,
      notifyReset = 13413
  },

  strikeBonuses = {
  -- day
    [1] = {text = "No bonus for first day"},
    [2] = {text = "Allow Hit Point Regeneration"},
    [3] = {text = "Allow Mana Regeneration"},
    [4] = {text = "Stamina Regeneration"},
    [5] = {text = "Double Hit Point Regeneration"},
    [6] = {text = "Double Mana Regeneration"},
    [7] = {text = "Soul Points Regeneration"}
  },

  rewards = {
  -- day
    [1] = {
      type = DAILY_REWARD_TYPE_ITEM,
      systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
      freeAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 5
      },
      premiumAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 10
      }
    },
    [2] = {
      type = DAILY_REWARD_TYPE_ITEM,
      systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
      freeAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 5
      },
      premiumAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 10
      }
    },
    [3] = {
      type = DAILY_REWARD_TYPE_PREY_REROLL,
      systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
      freeAccount = {
        rerollCount = 1
      },
      premiumAccount = {
        rerollCount = 2
      }
    },
    [4] = {
      type = DAILY_REWARD_TYPE_ITEM,
      systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
      freeAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 10
      },
      premiumAccount = {
        items = {7618, 7588, 7620, 7589, 8472, 2290, 2266, 2310, 2277, 2301, 2265},
        itemsToPick = 20
      }
    },
    [5] = {
      type = DAILY_REWARD_TYPE_PREY_REROLL,
      systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
      freeAccount = {
        rerollCount = 1
      },
      premiumAccount = {
        rerollCount = 2
      }
    },
    [6] = {
      type = DAILY_REWARD_TYPE_ITEM,
      systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
      freeAccount = {
        items = {32124, 32125, 32126, 32127, 32128, 32129},
        itemsToPick = 1
      },
      premiumAccount = {
        items = {32124, 32125, 32126, 32127, 32128, 32129},
        itemsToPick = 2
      },
	  itemCharges = 50
    },
    [7] = {
      type = DAILY_REWARD_TYPE_XP_BOOST,
      systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
      freeAccount = {
        xpminutes = 10
      },
      premiumAccount = {
        xpminutes = 30
      }
    }
-- Storage reward template
    --[[[5] = {
      type = DAILY_REWARD_TYPE_STORAGE,
      systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
      freeCount = 1,
      premiumCount = 2,
      freeAccount = {
        things = {
          [1] = {
              name = "task boost",
              id = 1, -- this number can't be repeated
              quantity = 1,
              storages = {
                          {storageId = 23454, value = 1},
                          {storageId = 45141, value = 2},
                          {storageId = 45141, value = 3}
                        }
          }
        }
      },
      premiumAccount = {
        things = {
          [1] = {
              name = "task boostss",
              id = 2, -- this number can't be repeated
              quantity = 1,
              storages = {
                          {storageId = 23454, value = 1}
                        }
          },
          [2] = {
              name = "another task boost",
              id = 3, -- this number can't be repeated
              quantity = 2,
              storages = {
                          {storageId = 23454, value = 1},
                          {storageId = 45141, value = 2},
                          {storageId = 45141, value = 3}
                        }
          }
        }
      }
    },]]
  }
}

function onRecvbyte(player, msg, byte)
if (byte == ClientPackets.OpenRewardWall) then
  DailyReward.loadDailyReward(player:getId(), REWARD_FROM_PANEL)
elseif (byte == ClientPackets.OpenRewardHistory) then
  player:sendRewardHistory()
elseif (byte == ClientPackets.SelectReward) then
  player:selectDailyReward(msg)
end
end


-- Core functions
DailyReward.insertHistory = function(playerId, dayStreak, description)
  return db.query(string.format("INSERT INTO `daily_reward_history`(`player_id`, `daystreak`, `timestamp`, `description`) VALUES (%s, %s, %s, %s)", playerId, dayStreak, os.time(), db.escapeString(description)))
end

DailyReward.retrieveHistoryEntries = function(playerId)

  local player = Player(playerId)
  if not player then
    return false
  end

  local entries = {}
  local resultId = db.storeQuery("SELECT * FROM `daily_reward_history` WHERE `player_id` = " .. player:getGuid() .. " ORDER BY `timestamp` DESC LIMIT 15;")
  if resultId ~= false then
    repeat
      local entry = {
        description = result.getDataString(resultId, "description"),
        timestamp = result.getDataInt(resultId, "timestamp"),
        daystreak = result.getDataInt(resultId, "daystreak"),
      }
      table.insert(entries, entry)
    until not result.next(resultId)
    result.free(resultId)
  end
  return entries
end

DailyReward.loadDailyReward = function(playerId, source)
  local player = Player(playerId)
  if not player then
    return false
  end
  if source ~= 0 then
    source = REWARD_FROM_SHRINE
  else
    source = REWARD_FROM_PANEL
  end

  if player:getClient().os == CLIENTOS_NEW_WINDOWS then
    player:sendCollectionResource(player:getCollectionTokens())
    player:sendDailyReward()
    player:sendOpenRewardWall(source)
    player:sendDailyRewardCollectionState(false)
  else
    player:sendCancelMessage("The current client does not have support, download the latest version.")
  end
  return true
end

DailyReward.pickedReward = function(playerId)
  local player = Player(playerId)

  if not player then
    return false
  end

  -- Reset day streak to 0 when reaches last reward
  if player:getDayStreak() ~= 6 then
    player:setDayStreak(player:getDayStreak() + 1)
  else
    player:setDayStreak(0)
  end

  player:setStreakLevel(player:getStreakLevel() + 1)
  player:setStorageValue(DailyReward.storages.avoidDouble, Game.getLastServerSave())
  player:setNextRewardTime(Game.getLastServerSave() + DailyReward.serverTimeThreshold)
  player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
  return true
end

DailyReward.isShrine = function(source)
  if source ~= 0 then
    return false
  else
    return true
  end
end

function Player.iterateTest(self)
    local dailyTable = DailyReward.rewards[5]
    local reward = dailyTable.premiumAccount

    for i = 1, #reward.things do
      for j = 1, #reward.things[i].storages do
        self:setStorageValue(reward.things[i].storages[j].storageId, reward.things[i].storages[j].value)
      end
    end
end

DailyReward.isRewardTaken = function(playerId)
  local player = Player(playerId)
  if not player then
    return false
  end
  local playerStorage = player:getStorageValue(DailyReward.storages.avoidDouble)
  if playerStorage == Game.getLastServerSave() then
    return true
  end
  return false
end

DailyReward.updateDailyRewardStats = function(playerId, zone)
  local player = Player(playerId)

  if not player then
    return false
  end

  local normal, protected = 0, 1
  local disabled, active = 0, 1

  if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
    if player:isRestingAreaBonusActive() then
      player:loadDailyRewardBonuses()
      --print(string.format("> %s loaded daily reward bonuses.", player:getName()))
      player:sendRestingAreaState(protected, active)
    else
      player:sendRestingAreaState(protected, disabled)
    end
  else
    player:disableDailyRewardBonuses()
    player:sendRestingAreaState(normal, player:isRestingAreaBonusActive())
  end

end

DailyReward.init = function(playerId)
  local player = Player(playerId)

  if not player then
    return false
  end

  local rewardTime = player:getNextRewardTime() + DailyReward.serverTimeThreshold + 60 -- 1 minutes timegrace
  local nextServerSave = Game.getLastServerSave() + DailyReward.serverTimeThreshold

  if rewardTime < nextServerSave then
    if player:getStorageValue(DailyReward.storages.notifyReset) ~= Game.getLastServerSave() then
      player:setStreakLevel(0)
	  player:setStorageValue(DailyReward.storages.notifyReset, Game.getLastServerSave())
	  if player:getLastLoginSaved() > 0 then -- message wont appear at first character login
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You just lost your daily reward streak.")
      end
    end
  end

  DailyReward.updateDailyRewardStats(playerId)
end

DailyReward.processReward = function(playerId, source)
  DailyReward.pickedReward(playerId)
  DailyReward.loadDailyReward(playerId, source)
  DailyReward.updateDailyRewardStats(playerId)
  return true
end

function Player.sendOpenRewardWall(self, shrine)
  local msg = NetworkMessage()
  msg:addByte(ServerPackets.OpenRewardWall) -- initial packet
  msg:addByte(shrine) -- isPlayer taking bonus from reward shrine (1) - taking it from a instant bonus reward (0)
  if DailyReward.testMode then
    msg:addU32(0)
  else
    msg:addU32(self:getNextRewardTime())
  end
  msg:addByte(self:getDayStreak()) -- current reward? day = 0, day 1, ... this should be resetted to 0 every week imo
  local dailyReward_taken = 0 -- 0 / 1 / 2
  msg:addByte(dailyReward_taken) -- state (player already took reward? but just make sure noone wpe)
  if dailyReward_taken ~= 0 then
    msg:addString("Sorry, you have already taken your daily reward or you are unable to collect it.")
  end
  msg:addU32(0) -- timeLeft to pickUp reward without loosing streak // this should be 0 if reward has been already picked
  msg:addU16(self:getStreakLevel()) -- day strike
  msg:addU16(24) -- unknown
  msg:sendToPlayer(self)
end

function Player.sendCollectionResource(self, value)
local msg = NetworkMessage()
msg:addByte(0xEE) -- resource byte
msg:addByte(0x14)
msg:addU64(value)
msg:sendToPlayer(self)
end

function Player.selectDailyReward(self, msg)
  local playerId = self:getId()

  if DailyReward.isRewardTaken(playerId) and not DailyReward.testMode then
    self:sendError("You have already collected your daily reward.")
    return false
  end

  local source = msg:getByte() -- 1 -> shrine / 0 -> tibia panel
  if not DailyReward.isShrine(source) then
    if self:getCollectionTokens() < 1 then
      self:sendError("You do not have enough collection tokens to proceed.")
      return false
    end
    self:setCollectionTokens(self:getCollectionTokens() - 1)
  end

  local dailyTable = DailyReward.rewards[self:getDayStreak() + 1]
  if not dailyTable then
    self:sendError("Something went wrong and we cannot process this request.")
    return false
  end

-- Items as reward
  if (dailyTable.type == DAILY_REWARD_TYPE_ITEM) then

    local items = {}

    -- Creating items table
    local columnsPicked = msg:getByte() -- Columns picked
    for i = 1, columnsPicked do
      local spriteId = msg:getU16()
      local count = msg:getByte()
      items[i] = {spriteId = spriteId, count = count}
    end

    -- Verifying if items if player is picking the correct amount
    local counter = 0
    for k, v in ipairs(items) do
      counter = counter + v.count
    end

    if self:isPremium() then
      count = dailyTable.premiumAccount.itemsToPick
    else
      count = dailyTable.freeAccount.itemsToPick
    end

    if counter > count then
      self:sendError("Something went wrong here, please restart this dialog.")
      return false
    end

    -- Adding items to store inbox
    local inbox = self:getSlotItem(CONST_SLOT_STORE_INBOX)
    if inbox and inbox:getEmptySlots() < columnsPicked then
      self:sendError("You do not have enough space in your store inbox.")
      return false
    end

    local description = ""
    for k, v in ipairs(items) do
        local item = Game.getItemIdByClientId(v.spriteId)
		if dailyTable.itemCharges then
			for i = 1, v.count do
				inbox:addItem(item:getId(), dailyTable.itemCharges) -- adding charges for each item
			end
		else
			inbox:addItem(item:getId(), v.count) -- adding single item w/o charges
		end
        if k ~= columnsPicked then
          description = description .. "" .. v.count .. "x " .. getItemName(item:getId()) .. ", "
        else
          description = description .. "" .. v.count .. "x " .. getItemName(item:getId()) .. "."
        end
    end

    -- Registering history
    DailyReward.insertHistory(self:getGuid(), self:getDayStreak(), "Claimed reward no. " .. self:getDayStreak() + 1 .. ". Picked items: " .. description)
    DailyReward.processReward(playerId, source)
  end

  local reward = nil
  if self:isPremium() then
    reward = dailyTable.premiumAccount
  else
    reward = dailyTable.freeAccount
  end

  if (dailyTable.type == DAILY_REWARD_TYPE_STORAGE) then
    local description = ""
    for i = 1, #reward.things do
      for j = 1, #reward.things[i].storages do
        self:setStorageValue(reward.things[i].storages[j].storageId, reward.things[i].storages[j].value)
      end
      if i ~= #reward.things then
        description = description .. reward.things[i].name .. ", "
      else
        description = description .. reward.things[i].name .. "."
      end
    end
    DailyReward.insertHistory(self:getGuid(), self:getDayStreak(), "Claimed reward no. " .. self:getDayStreak() + 1 .. ". Picked reward: " .. description)
    DailyReward.processReward(playerId, source)
  end

  if (dailyTable.type == DAILY_REWARD_TYPE_XP_BOOST) then

      --[[local window = ModalWindow {
          title = 'Warning',
          message = 'You still have 20 minutes XP Boost from a previous daily reward left. If you claim your daily reward now, you will lose this remaining time.'
      }
      window:addButton('Ok', function(button, choice)
        DailyReward.insertHistory(self:getGuid(), self:getDayStreak(), "Claimed reward no. " .. self:getDayStreak() + 1 .. ". Picked reward: XP Bonus for " .. reward.xpminutes .. " minutes.")
        DailyReward.processReward(playerId, source)
      end)
      window:addButton('Cancel')
      window:sendToPlayer(self)]]

    self:setExpBoostStamina(self:getExpBoostStamina() + (reward.xpminutes * 60))
    self:setStoreXpBoost(50)
    DailyReward.insertHistory(self:getGuid(), self:getDayStreak(), "Claimed reward no. " .. self:getDayStreak() + 1 .. ". Picked reward: XP Bonus for " .. reward.xpminutes .. " minutes.")
	DailyReward.processReward(playerId, source)
  end

  if (dailyTable.type == DAILY_REWARD_TYPE_PREY_REROLL) then
    self:setPreyBonusRerolls(self:getPreyBonusRerolls() + reward.rerollCount)
    DailyReward.insertHistory(self:getGuid(), self:getDayStreak(), "Claimed reward no. " .. self:getDayStreak() + 1 .. ". Picked reward: " .. reward.rerollCount .. "x Prey bonus reroll(s)")
    DailyReward.processReward(playerId, source)
  end

return true
end

function Player.sendError(self, error)
  local msg = NetworkMessage()
  msg:addByte(ServerPackets.ShowDialog)
  msg:addByte(0x14)
  msg:addString(error)
  msg:sendToPlayer(self)
end

function Player.sendRestingAreaState(self, zone, state)
  local msg = NetworkMessage()
  if self:getClient().os == CLIENTOS_NEW_WINDOWS then
    msg:addByte(ServerPackets.RestingAreaState)
    msg:addByte(zone) -- [1 if protection zone, 0 if not]
    msg:addByte(state) -- [inactive = 0, active = 1]
    if state == 1 then
      msg:addString("Within Resting Area")
    else
      msg:addString("Resting Area (no active bonus)")
    end
    msg:sendToPlayer(self)
  end
end

function Player.sendDailyRewardCollectionState(self, state)
  local msg = NetworkMessage()
  msg:addByte(ServerPackets.DailyRewardCollectionState)
  msg:addByte(state)
  msg:sendToPlayer(self)
end

function Player.sendRewardHistory(self)
  local msg = NetworkMessage()
  msg:addByte(ServerPackets.DailyRewardHistory)

  local entries = DailyReward.retrieveHistoryEntries(self:getId())
  if #entries == 0 then
    self:sendError("You don't have any entries yet.")
    return false
  end

  msg:addByte(#entries)
  for k, entry in ipairs(entries) do
    msg:addU32(entry.timestamp)
    msg:addByte(0) -- (self:isPremium() and 0 or 0)
    msg:addString(entry.description)
    msg:addU16(entry.daystreak + 1)
  end
  msg:sendToPlayer(self)
end

function Player.readDailyReward(self, msg, currentDay, state)
  local dailyTable = DailyReward.rewards[currentDay]
  local type, systemType = dailyTable.type, dailyTable.systemType
  local rewards = nil
  if (state == DAILY_REWARD_STATUS_FREE) then
    rewards = dailyTable.freeAccount
  else
    rewards = dailyTable.premiumAccount
  end
  msg:addByte(systemType)
  if (systemType == 1) then
    if (type == DAILY_REWARD_TYPE_ITEM) then
      msg:addByte(rewards.itemsToPick)
      msg:addByte(#rewards.items)
      for i = 1, #rewards.items do
        local itemId = rewards.items[i]
        local itemType = ItemType(itemId)
        local itemName = itemType:getArticle() .. " " .. getItemName(itemId)
        local itemWeight = itemType:getWeight()
        msg:addItemId(itemId)
        msg:addString(itemName)
        msg:addU32(itemWeight)
      end
    end
  elseif (systemType == 2) then
    if (type == DAILY_REWARD_TYPE_STORAGE) then
      msg:addByte(#rewards.things)
      for i = 1, #rewards.things do
          msg:addByte(DAILY_REWARD_SYSTEM_TYPE_OTHER) -- type
          msg:addU16(rewards.things[i].id * 100)
          msg:addString(rewards.things[i].name)
          msg:addByte(rewards.things[i].quantity)
      end
    elseif (type == DAILY_REWARD_TYPE_PREY_REROLL) then
      msg:addByte(DAILY_REWARD_SYSTEM_SKIP)
      msg:addByte(DAILY_REWARD_SYSTEM_TYPE_PREY_REROLL)
      msg:addByte(rewards.rerollCount)
    elseif (type == DAILY_REWARD_TYPE_XP_BOOST) then
      msg:addByte(DAILY_REWARD_SYSTEM_SKIP)
      msg:addByte(DAILY_REWARD_SYSTEM_TYPE_XP_BOOST)
      msg:addU16(rewards.xpminutes)
    end
  end
end

function Player.sendDailyReward(self)
local msg = NetworkMessage()
msg:addByte(ServerPackets.DailyRewardBasic)
msg:addByte(DAILY_REWARD_COUNT)
for currentDay = 1, DAILY_REWARD_COUNT do
    self:readDailyReward(msg, currentDay, DAILY_REWARD_STATUS_FREE) -- Free rewards
    self:readDailyReward(msg, currentDay, DAILY_REWARD_STATUS_PREMIUM) -- Premium rewards
end
-- Resting area bonuses
local maxBonus = 7
msg:addByte(maxBonus - 1)
for i = 2, maxBonus do
  msg:addString(DailyReward.strikeBonuses[i].text)
  msg:addByte(i)
end
msg:addByte(1) -- Unknown
msg:sendToPlayer(self)
end

local items = {}
local function sendItemChoose(player, items, current)

  local playerId = player:getId()

  local dailyTable = DailyReward.rewards[player:getDayStreak() + 1]
  if not dailyTable then
    self:sendError("Something went wrong and we cannot process this request.")
    return false
  end

  if player:isPremium() then
    rewards = dailyTable.premiumAccount
  else
    rewards = dailyTable.freeAccount
  end

  local window = ModalWindow {
    title = 'Daily Reward Wall',
    message = 'Please choose '.. rewards.itemsToPick ..' items of the list.'
  }

  if not items.table then
    items.table = {} -- empty table
    for i = 1, #rewards.items do
      local itemId = rewards.items[i]
      local itemType = ItemType(itemId)
      local itemName = itemType:getArticle() .. " " .. getItemName(itemId)
      items.table[i] = {
        id = i,
        itemId = itemId,
        itemName = itemName,
        amount = 0
      }
    end
  else
    items.table = items.table
  end

  -- Adding choices
  for i = 1, #items.table do
      local id = items.table[i].itemId
      local name = items.table[i].itemName
      local itemId = items.table[i].id
      local amount = items.table[i].amount
      local choice = window:addChoice(name .. " : " .. amount)
      choice.id = id
  end

  local currentCount = 0
  for i = 1, #items.table do
    local count = items.table[i].amount
    currentCount = currentCount + count
  end

  local remainingItems = rewards.itemsToPick - currentCount

  window:addButton('<', function(button, choice)
    items.table[choice.id].amount = math.max(0, items.table[choice.id].amount - 1)
    sendItemChoose(player, items, choice)
  end)

  window:addButton('|>>', function(button, choice)
    items.table[choice.id].amount = math.max(0, items.table[choice.id].amount + remainingItems)
    sendItemChoose(player, items, choice)
  end)


  window:addButton('Confirm', function(button, choice)

  if currentCount ~= rewards.itemsToPick then
    sendItemChoose(player, items, choice)
    return false
  end

  local descount, totalCap = 0, 0
  for i = 1, #items.table do
    local item = items.table[i]
    local count = item.amount
    if count ~= 0 then
      descount = descount + 1
      totalCap = totalCap + ItemType(item.itemId):getWeight(count)
    end
  end

  if player:getFreeCapacity() < totalCap then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough capacity to claim the reward.")
    return false
  end

  local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
  if inbox and inbox:getEmptySlots() < descount then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please make sure you have free slots in your store inbox.")
    return false
  end

  local description = ""
  local j = 1
  for i = 1, #items.table do
    local item = items.table[i]
    local count = item.amount
    if count ~= 0 then
      inbox:addItem(item.itemId, count)
      if j ~= descount then
        description = description .. "" .. item.amount .. "x " .. getItemName(item.itemId) .. ", "
      else
        description = description .. "" .. item.amount .. "x " .. getItemName(item.itemId) .. "."
      end
      j = j + 1
    end
  end
  player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have claimed " .. description)
  DailyReward.insertHistory(player:getGuid(), player:getDayStreak(), "Claimed reward no. " .. player:getDayStreak() + 1 .. ". Picked items: " .. description)
  DailyReward.pickedReward(playerId)
end)
window:addButton('Abort')
window:sendToPlayer(player)
end

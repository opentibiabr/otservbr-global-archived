-- Capacity imbuement store
local STORAGE_CAPACITY_IMBUEMENT = 42154

local titles = {
	{storageID = 14960, title = " Scout"},
	{storageID = 14961, title = " Sentinel"},
	{storageID = 14962, title = " Steward"},
	{storageID = 14963, title = " Warden"},
	{storageID = 14964, title = " Squire"},
	{storageID = 14965, title = " Warrior"},
	{storageID = 14966, title = " Keeper"},
	{storageID = 14967, title = " Guardian"},
	{storageID = 14968, title = " Sage"},
	{storageID = 14969, title = " Tutor"},
	{storageID = 14970, title = " Senior Tutor"},
	{storageID = 14971, title = " King"},
}

local function getTitle(uid)
	local player = Player(uid)
	if not player then return false end

	for i = #titles, 1, -1 do
		if player:getStorageValue(titles[i].storageID) == 1 then
			return titles[i].title
		end
	end

	return false
end

function Player:onBrowseField(position)
	if hasEventCallback(EVENT_CALLBACK_ONBROWSEFIELD) then
		return EventCallback(EVENT_CALLBACK_ONBROWSEFIELD, self, position)
	else
		return true
	end
	return true
end

function Player:onLook(thing, position, distance)
	local ret = EventCallback(EVENT_CALLBACK_ONLOOK, self, thing, position, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, ret)
end

function Player:onLookInBattleList(creature, distance)
	local ret = EventCallback(EVENT_CALLBACK_ONLOOKINBATTLELIST, self, creature, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, ret)
end

function Player:onLookInTrade(partner, item, distance)
	local description = "You see " .. item:getDescription(distance)
	local ret = hasEventCallback(EVENT_CALLBACK_ONLOOKINTRADE) and EventCallback(EVENT_CALLBACK_ONLOOKINTRADE, self, partner, item, distance, description) or description
	self:sendTextMessage(MESSAGE_INFO_DESCR, ret)
end

function Player:onLookInShop(itemType, count, description)
	local description = "You see " .. description
	local ret = hasEventCallback(EVENT_CALLBACK_ONLOOKINSHOP) and EventCallback(EVENT_CALLBACK_ONLOOKINSHOP, self, itemType, count, description) or description
	self:sendTextMessage(MESSAGE_INFO_DESCR, ret)
end

function Player:onMoveItem(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if hasEventCallback(EVENT_CALLBACK_ONMOVEITEM) then
		return EventCallback(EVENT_CALLBACK_ONMOVEITEM, self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	else
		return true
	end
end

function Player:onItemMoved(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if hasEventCallback(EVENT_CALLBACK_ONITEMMOVED) then
		EventCallback(EVENT_CALLBACK_ONITEMMOVED, self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	end
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	if hasEventCallback(EVENT_CALLBACK_ONMOVECREATURE) then
		return EventCallback(EVENT_CALLBACK_ONMOVECREATURE, self, creature, fromPosition, toPosition)
	else
		return true
	end
end

function Player:onReportRuleViolation(targetName, reportType, reportReason, comment, translation)
	if hasEventCallback(EVENT_CALLBACK_ONREPORTRULEVIOLATION) then
		EventCallback(EVENT_CALLBACK_ONREPORTRULEVIOLATION, self, targetName, reportType, reportReason, comment, translation)
	end
end

function Player:onReportBug(message, position, category)
	if hasEventCallback(EVENT_CALLBACK_ONREPORTBUG) then
		return EventCallback(EVENT_CALLBACK_ONREPORTBUG, self, message, position, category)
	else
		return true
	end
end

function Player:onTurn(direction)
	if hasEventCallback(EVENT_CALLBACK_ONTURN) then
		return EventCallback(EVENT_CALLBACK_ONTURN, self, direction)
	else
		return true
	end
end

function Player:onTradeRequest(target, item)
	if hasEventCallback(EVENT_CALLBACK_ONTRADEREQUEST) then
		return EventCallback(EVENT_CALLBACK_ONTRADEREQUEST, self, target, item)
	else
		return true
	end
end

function Player:onTradeAccept(target, item, targetItem)
	if hasEventCallback(EVENT_CALLBACK_ONTRADEACCEPT) then
		return EventCallback(EVENT_CALLBACK_ONTRADEACCEPT, self, target, item, targetItem)
	else
		return true
	end
end

function Player:onTradeCompleted(target, item, targetItem, isSuccess)
	if hasEventCallback(EVENT_CALLBACK_ONTRADECOMPLETED) then
		EventCallback(EVENT_CALLBACK_ONTRADECOMPLETED, self, target, item, targetItem, isSuccess)
	end
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

local function useStaminaXp(player)
	local staminaMinutes = player:getExpBoostStamina() / 60
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseXpStamina[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseXpStamina[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseXpStamina[playerId] = currentTime + 60
	end
	player:setExpBoostStamina(staminaMinutes * 60)
end

function Player:onGainExperience(source, exp, rawExp)
	if not source or source:isPlayer() then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Experience Stage Multiplier
	local expStage = getRateFromTable(experienceStages, self:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
	exp = exp * expStage
	baseExp = rawExp * expStage
	if Game.getStorageValue(GlobalStorage.XpDisplayMode) > 0 then
		displayRate = expStage
	else
		displayRate = 1
	end

	-- Prey Bonus
	for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
		if (self:getPreyCurrentMonster(slot) == source:getName()
		and self:getPreyBonusType(slot) == CONST_BONUS_XP_BONUS) then
			exp = exp + math.floor(exp * (self:getPreyBonusValue(slot) / 100))
			break
		end
		if (self:getPreyTimeLeft(slot) / 60) > 0 then
			preyTimeLeft(self, slot) -- slot consumption, outside of the mosnter check
		end
	end

	-- Store Bonus
	useStaminaXp(self) -- Use store boost stamina

	local Boost = self:getExpBoostStamina()
	local stillHasBoost = Boost > 0
	local storeXpBoostAmount = stillHasBoost and self:getStoreXpBoost() or 0

	self:setStoreXpBoost(storeXpBoostAmount)

	if (storeXpBoostAmount > 0) then
		exp = exp + (baseExp * (storeXpBoostAmount/100)) -- Exp Boost
	end

	-- Stamina Bonus
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)
		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
			self:setStaminaXpBoost(150)
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5 --TODO destroy loot of people with 840- stamina
			self:setStaminaXpBoost(50)
		else
			self:setStaminaXpBoost(100)
		end
	end
			
	-- Boosted creature
	if source:getName():lower() == BoostedCreature.name:lower() then
		exp = exp * 2
	end

	-- Event scheduler
	if SCHEDULE_EXP_RATE ~= 100 then
		exp = (exp * SCHEDULE_EXP_RATE)/100
	end
	self:setBaseXpGain(displayRate * 100)
	return hasEventCallback(EVENT_CALLBACK_ONGAINEXPERIENCE) and EventCallback(EVENT_CALLBACK_ONGAINEXPERIENCE, self, source, exp, rawExp) or exp
end

function Player:onLoseExperience(exp)
	return hasEventCallback(EVENT_CALLBACK_ONLOSEEXPERIENCE) and EventCallback(EVENT_CALLBACK_ONLOSEEXPERIENCE, self, exp) or exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return hasEventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES) and EventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES, self, skill, tries) or tries
	end

	-- Event scheduler skill rate
	if SCHEDULE_SKILL_RATE ~= 100 then
		tries = (tries * SCHEDULE_SKILL_RATE)/100
	end

	local skillRate = configManager.getNumber(configKeys.RATE_SKILL)
	local magicRate = configManager.getNumber(configKeys.RATE_MAGIC)

	if(skill == SKILL_MAGLEVEL) then -- Magic getLevel
		tries = tries * getRateFromTable(magicLevelStages, self:getMagicLevel(), magicRate)
		return hasEventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES) and EventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES, self, skill, tries) or tries
	end

	tries = tries * getRateFromTable(skillsStages, self:getEffectiveSkillLevel(skill), skillRate)
	return hasEventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES) and EventCallback(EVENT_CALLBACK_ONGAINSKILLTRIES, self, skill, tries) or tries
end

function Player:onRemoveCount(item)
	self:sendWaste(item:getId())
end

function Player:onRequestQuestLog()
	self:sendQuestLog()
end

function Player:onRequestQuestLine(questId)
	self:sendQuestLine(questId)
end

function Player:onStorageUpdate(key, value, oldValue, currentFrameTime)
	self:updateStorage(key, value, oldValue, currentFrameTime)
end

function Player:canBeAppliedImbuement(imbuement, item)
	local categories = {}
	local slots = ItemType(item:getId()):getImbuingSlots()
	if slots > 0 then
		for slot = 0, slots - 1 do
			local duration = item:getImbuementDuration(slot)
			if duration > 0 then
				local imbue = item:getImbuement(slot)
				local catid = imbue:getCategory().id
				table.insert(categories, catid)
			end
		end
	end

	if isInArray(categories, imbuement:getCategory().id) then
		return false
	end

	if imbuement:isPremium() and self:getPremiumDays() < 1 then
		return false
	end

	if self:getStorageValue(Storage.ForgottenKnowledge.Tomes) > 0 then
		imbuable = true
	else
		return false
	end

	if not self:canImbueItem(imbuement, item) then
		return false
	end

	return true
end

function Player:onApplyImbuement(imbuement, item, slot, protectionCharm)
	for _, pid in pairs(imbuement:getItems()) do
		if self:getItemCount(pid.itemid) < pid.count then
			self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED, "You don't have all necessary items.")
			return false
		end
	end

	if item:getImbuementDuration(slot) > 0 then
		self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ERROR, "An error ocurred, please reopen imbuement window.")
		return false
	end
	local base = imbuement:getBase()
	local price = base.price + (protectionCharm and base.protection or 0)

	local chance = protectionCharm and 100 or base.percent
	if math.random(100) > chance then -- failed attempt
		self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED, "Oh no!\n\nThe imbuement has failed. You have lost the astral sources and gold you needed for the imbuement.\n\nNext time use a protection charm to better your chances.")
		-- Removing items
		for _, pid in pairs(imbuement:getItems()) do
			self:removeItem(pid.itemid, pid.count)
		end
		-- Removing money
		self:removeMoneyNpc(price)
		-- Refreshing shrine window
		local nitem = Item(item.uid)
		self:sendImbuementPanel(nitem)
		return false
	end

	-- Removing items
	for _, pid in pairs(imbuement:getItems()) do
		if not self:removeItem(pid.itemid, pid.count) then
			self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED, "You don't have all necessary items.")
			return false
		end
	end

	if not self:removeMoneyNpc(price) then
		self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED, "You don't have enough money " ..price.. " gps.")
		return false
	end

	if not item:addImbuement(slot, imbuement:getId()) then
		self:sendImbuementResult(MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED, "Item failed to apply imbuement.")
		return false
	end

	-- Update item
	local nitem = Item(item.uid)
	self:sendImbuementPanel(nitem)
	return true
end

function Player:clearImbuement(item, slot)
	local slots = ItemType(item:getId()):getImbuingSlots()
	if slots < slot then
		self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_ERROR, "Sorry, not possible.")
		return false
	end

	if item:getTopParent() ~= self or item:getParent() == self then
		self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_ERROR,
			"An error occurred while applying the clearing charm to the item.")
		return false
	end

	-- slot is not used
	local info = item:getImbuementDuration(slot)
	if info == 0 then
		self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_ERROR,
			"An error occurred while applying the clearing charm to the item.")
		return false
	end

	local imbuement = item:getImbuement(slot)
	if not self:removeMoneyNpc(imbuement:getBase().removecust) then
		self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_ERROR,
			"You don't have enough money " ..imbuement:getBase().removecust.. " gps.")
		return false
	end

	if not item:cleanImbuement(slot) then
		self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_ERROR,
			"An error occurred while applying the clearing charm to the item.")
		return false
	end

	-- Update item
	local nitem = Item(item.uid)
	self:sendImbuementResult(MESSAGEDIALOG_CLEARING_CHARM_SUCCESS,
		"Congratulations! You have successfully applied the clearing charm to your item.");
	self:sendImbuementPanel(nitem)

	return true
end

function Player:onCombat(target, item, primaryDamage, primaryType, secondaryDamage, secondaryType)
	if not item or not target then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local slots = ItemType(item:getId()):getImbuingSlots()
	if slots > 0 then
		for i = 0, slots - 1 do
			local imbuement = item:getImbuement(i)
			if imbuement then
				local percent = imbuement:getElementDamage()
				local totalDmg = primaryDamage --store it for damage adjustment
				if percent and percent > 0 then
					if primaryDamage ~= 0 then
						local factor = percent / 100
						secondaryType = imbuement:getCombatType()
						primaryDamage = totalDmg * (1 - factor)
						secondaryDamage = totalDmg * (factor)
					end
				end
			end
		end
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

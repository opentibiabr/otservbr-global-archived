function Player.sendTibiaTime(self, hours, minutes)
	local msg = NetworkMessage()
	msg:addByte(0xEF)
	msg:addByte(hours)
	msg:addByte(minutes)
	msg:sendToPlayer(self)
	msg:delete()
	return true
end

local function onMovementRemoveProtection(cid, oldPosition, time)
    local player = Player(cid)
    if not player then
        return true
    end

    local playerPosition = player:getPosition()
    if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
        player:setStorageValue(Storage.combatProtectionStorage, 0)
        return true
    end

    addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
	end

    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

    local playerId = player:getId()

	DailyReward.init(playerId)

    player:loadSpecialStorage()

    --[[-- Maintenance mode
    if (player:getGroup():getId() < 2) then
        return false
    else

    end--]]

    if (player:getGroup():getId() >= 4) then
        player:setGhostMode(true)
    end

    -- Stamina
    nextUseStaminaTime[playerId] = 1

    -- EXP Stamina
    nextUseXpStamina[playerId] = 1

	-- Prey Small Window
	if player:getClient().version > 1110 then
		for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
			player:sendPreyData(slot)
		end
	end	 

    -- New Prey
    nextPreyTime[playerId] = {
        [CONST_PREY_SLOT_FIRST] = 1,
        [CONST_PREY_SLOT_SECOND] = 1,
        [CONST_PREY_SLOT_THIRD] = 1
    }

    if (player:getAccountType() == ACCOUNT_TYPE_TUTOR) then
        local msg = [[:: Tutor Rules
            1 *> 3 Warnings you lose the job.
            2 *> Without parallel conversations with players in Help, if the player starts offending, you simply mute it.
            3 *> Be educated with the players in Help and especially in the Private, try to help as much as possible.
            4 *> Always be on time, if you do not have a justification you will be removed from the staff.
            5 *> Help is only allowed to ask questions related to tibia.
            6 *> It is not allowed to divulge time up or to help in quest.
            7 *> You are not allowed to sell items in the Help.
            8 *> If the player encounters a bug, ask to go to the website to send a ticket and explain in detail.
            9 *> Always keep the Tutors Chat open. (required).
            10 *> You have finished your schedule, you have no tutor online, you communicate with some CM in-game or ts and stay in the help until someone logs in, if you can.
            11 *> Always keep a good Portuguese in the Help, we want tutors who support, not that they speak a satanic ritual.
            12 *> If you see a tutor doing something that violates the rules, take a print and send it to your superiors. "
            - Commands -
            Mute Player: / mute nick, 90. (90 seconds)
            Unmute Player: / unmute nick.
            - Commands -]]
        player:popupFYI(msg)
    end

 	-- OPEN CHANNELS
	if table.contains({"Rookgaard", "Dawnport"}, player:getTown():getName())then
		player:openChannel(3) -- world chat
		player:openChannel(6) -- advertsing rook main
	else
		player:openChannel(3) -- world chat
		player:openChannel(5) -- advertsing main
	end

    -- Rewards
    local rewards = #player:getRewardList()
    if(rewards > 0) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
    end

    -- Update player id
    local stats = player:inBossFight()
    if stats then
        stats.playerId = player:getId()
    end

 	if player:getStorageValue(Storage.combatProtectionStorage) < 1 then
        player:setStorageValue(Storage.combatProtectionStorage, 1)
        onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end

	-- Set Client XP Gain Rate
	if Game.getStorageValue(GlobalStorage.XpDisplayMode) > 0 then
		displayRate = Game.getExperienceStage(player:getLevel())
		else
		displayRate = 1
	end
	local staminaMinutes = player:getStamina()
	local storeBoost = player:getExpBoostStamina()
	player:setStoreXpBoost(storeBoost > 0 and 50 or 0)
	if staminaMinutes > 2400 and player:isPremium() and storeBoost > 0 then
		player:setBaseXpGain(displayRate*2*100) -- Premium + Stamina boost + Store boost
		player:setStaminaXpBoost(150)
	elseif staminaMinutes > 2400 and player:isPremium() and storeBoost <= 0 then
		player:setBaseXpGain(displayRate*1.5*100) -- Premium + Stamina boost
		player:setStaminaXpBoost(150)
	elseif staminaMinutes <= 2400 and staminaMinutes > 840 and player:isPremium() and storeBoost > 0 then
		player:setBaseXpGain(displayRate*1.5*100) -- Premium + Store boost
		player:setStaminaXpBoost(100)
	elseif staminaMinutes > 840 and storeBoost > 0 then
		player:setBaseXpGain(displayRate*1.5*100) -- FACC + Store boost
		player:setStaminaXpBoost(100)
	elseif staminaMinutes <= 840 and storeBoost > 0 then
		player:setBaseXpGain(displayRate*1*100) -- ALL players low stamina + Store boost
		player:setStaminaXpBoost(50)
	elseif staminaMinutes <= 840 then
		player:setBaseXpGain(displayRate*0.5*100) -- ALL players low stamina
		player:setStaminaXpBoost(50)
	end

	if player:getClient().version > 1110 then
		local worldTime = getWorldTime()
		local hours = math.floor(worldTime / 60)
		local minutes = worldTime % 60
		player:sendTibiaTime(hours, minutes)
	end
	
	if player:getStorageValue(Storage.isTraining) == 1 then -- redefinir storage de exercise weapon
		player:setStorageValue(Storage.isTraining,0)
	end
    return true
end

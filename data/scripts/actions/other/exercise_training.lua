local exerciseWeapons = {
	-- MELE
	[32124] = { skill = SKILL_SWORD },
	[32384] = { skill = SKILL_SWORD },
	[40114] = { skill = SKILL_SWORD },
	[40120] = { skill = SKILL_SWORD },
	[32385] = { skill = SKILL_AXE },
	[32125] = { skill = SKILL_AXE },
	[40115] = { skill = SKILL_AXE },
	[40121] = { skill = SKILL_AXE },
	[32386] = { skill = SKILL_CLUB },
	[32126] = { skill = SKILL_CLUB },
	[40116] = { skill = SKILL_CLUB },
	[40122] = { skill = SKILL_CLUB },
	-- ROD
	[32128] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE, allowFarUse = true },
	[32388] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE, allowFarUse = true },
	[40118] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE, allowFarUse = true },
	[40124] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE, allowFarUse = true },
	-- RANGE
	[32127] = { skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW, allowFarUse = true },
	[32387] = { skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW, allowFarUse = true },
	[40117] = { skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW, allowFarUse = true },
	[40123] = { skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW, allowFarUse = true },
	-- WAND
	[32129] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE, allowFarUse = true },
	[32389] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE, allowFarUse = true },
	[40119] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE, allowFarUse = true },
	[40125] = { skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE, allowFarUse = true }
}

local exerciseTraining = Action()
local houseDummies = {32143, 32144, 32145, 32146, 32147, 32148}
local freeDummies = {32142, 32149}

local maxAllowedOnADummy = configManager.getNumber(configKeys.MAX_ALLOWED_ON_A_DUMMY)
local magicLevelRate = configManager.getNumber(configKeys.RATE_MAGIC)
local skillLevelRate = configManager.getNumber(configKeys.RATE_SKILL)

for weaponId, weapon in pairs(exerciseWeapons) do
	exerciseTraining:id(weaponId)
	if weapon.allowFarUse then
		exerciseTraining:allowFarUse(true)
	end
end

local function leaveTraining(playerId)
	if onExerciseTraining[playerId] then
		stopEvent(onExerciseTraining[playerId].event)
		onExerciseTraining[playerId] = nil
	end

	local player = Player(playerId)
	if player then
		player:setTraining(false)
	end
	return
end

local function exerciseEvent(playerId, tilePosition, weaponId, dummyId)
	local player = Player(playerId)
	if not player then
		leaveTraining(playerId)
		return
	end

	if player:isTraining() == 0 then
		player:sendTextMessage(MESSAGE_FAILURE, "Your training has stopped.")
		leaveTraining(playerId)
		return
	end

	if not Tile(tilePosition):getItemById(dummyId) then
		player:sendTextMessage(MESSAGE_FAILURE, "Someone has moved the dummy, the training has stopped.")
		leaveTraining(playerId)
		return
	end

	local playerPosition = player:getPosition()
	if not getTilePzInfo(playerPosition) then
		player:sendTextMessage(MESSAGE_FAILURE, "You are no longer in a protection zone, the training has stopped.")
		leaveTraining(playerId)
		return
	end

	if player:getItemCount(weaponId) <= 0 then
		player:sendTextMessage(MESSAGE_FAILURE, "You need the training weapon in the backpack, the training has stopped.")
		leaveTraining(playerId)
		return
	end

	local weapon = player:getItemById(weaponId, true)
	if not weapon:isItem() or not weapon:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
		player:sendTextMessage(MESSAGE_FAILURE, "The selected item is not a training weapon, the training has stopped.")
		leaveTraining(playerId)
		return
	end

	local weaponCharges = weapon:getAttribute(ITEM_ATTRIBUTE_CHARGES)
	if not weaponCharges or weaponCharges <= 0 then
		weapon:remove(1) -- ??
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon has disappeared.")
		leaveTraining(playerId)
		return
	end

	local isMagic = false
	local bonusDummy = isInArray(houseDummies, weaponId) or nil
	local skillToTraining = skillsStages or nil
	local skillRateDefault = skillLevelRate
	local skillLevel = player:getSkillLevel(exerciseWeapons[weaponId].skill)

	if exerciseWeapons[weaponId].skill == SKILL_MAGLEVEL then
		skillToTraining = magicLevelStages or nil
		skillRateDefault = magicLevelRate
		skillLevel = player:getBaseMagicLevel()
		isMagic = true
	end

	local expRate = getRateFromTable(skillToTraining, skillLevel, skillRateDefault)
	if bonusDummy then bonusDummy = 1.1 else bonusDummy = 1 end

	if isMagic then
		player:addManaSpent(math.ceil(500 * expRate) * bonusDummy)
	else
		player:addSkillTries(exerciseWeapons[weaponId].skill, (7 * expRate) * bonusDummy)
	end

	weapon:setAttribute(ITEM_ATTRIBUTE_CHARGES, (weaponCharges - 1))
	tilePosition:sendMagicEffect(CONST_ME_HITAREA)

	if exerciseWeapons[weaponId].effect then
		playerPosition:sendDistanceEffect(tilePosition, exerciseWeapons[weaponId].effect)
	end

	if weapon:getAttribute(ITEM_ATTRIBUTE_CHARGES) <= 0 then
		weapon:remove(1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon has disappeared.")
		leaveTraining(playerId)
		return
	end

	local vocation = player:getVocation()
	onExerciseTraining[playerId].event = addEvent(exerciseEvent, vocation:getAttackSpeed(), playerId, tilePosition, weaponId, dummyId)
	return
end

function exerciseTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playerId = player:getId()
	local targetId = target:getId()

	if target:isItem() and (isInArray(houseDummies, targetId) or isInArray(freeDummies, targetId)) then
		if onExerciseTraining[playerId] then
			player:sendTextMessage(MESSAGE_FAILURE, "You are already training.")
			return true
		end

		local playerPos = player:getPosition()
		if not exerciseWeapons[item.itemid].allowFarUse and (playerPos:getDistance(target:getPosition()) > 1) then
			player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
			return true
		end

		if not getTilePzInfo(playerPos) then
			player:sendTextMessage(MESSAGE_FAILURE, "You need to be in a protection zone.")
			return true
		end

		local playersOnDummy = 0
		local targePos = target:getPosition()
		for _, playerTraining in pairs(onExerciseTraining) do
			if playerTraining.dummyPos == targePos then
				playersOnDummy = playersOnDummy + 1
			end

			if playersOnDummy == maxAllowedOnADummy then
				player:sendTextMessage(MESSAGE_FAILURE, "That exercise dummy is busy.")
				return true
			end
		end

		local vocation = player:getVocation()
		onExerciseTraining[playerId] = {}
		onExerciseTraining[playerId].event = addEvent(exerciseEvent, vocation:getAttackSpeed(), playerId, target:getPosition(), item.itemid, targetId)
		onExerciseTraining[playerId].dummyPos = target:getPosition()
		player:sendTextMessage(MESSAGE_FAILURE, "You started training.")
		player:setTraining(true)
		return true
	end

	return
end

exerciseTraining:register()

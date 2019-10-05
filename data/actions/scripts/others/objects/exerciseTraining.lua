-- https://github.com/opentibiabr/OTServBR-Global
local weapons = {
	[32384] = {skill = SKILL_SWORD},
	[32385] = {skill = SKILL_AXE},
	[32386] = {skill = SKILL_CLUB},
	[32387] = {skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW},
	[32388] = {skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE},
	[32389] = {skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE},
	[32124] = {skill = SKILL_SWORD},
	[32125] = {skill = SKILL_AXE},
	[32126] = {skill = SKILL_CLUB},
	[32127] = {skill = SKILL_DISTANCE, effect = CONST_ANI_SIMPLEARROW},
	[32128] = {skill = SKILL_MAGLEVEL, effect = CONST_ANI_SMALLICE},
	[32129] = {skill = SKILL_MAGLEVEL, effect = CONST_ANI_FIRE}
}
local dummies = {
	houseDummies = {32143, 32144, 32145, 32146, 32147, 32148},
	freeDummies = {32142, 32149}
}
local rates = { 
	skill = configManager.getNumber(configKeys.RATE_SKILL),
	magic = configManager.getNumber(configKeys.RATE_MAGIC)
}
local exhaustion = {
	time = 30, --seconds
	storage = 38
}
local function startTraining(playerId, startPosition, itemId, dummyPosition, bonusDummy)
	
	local player = Player(playerId)
	if player == nil then -- se o player não existir precisamos parar o treino
		stopEvent(training)
		return false
	end

	local playerPosition = player:getPosition()
	if not startPosition:getDistance(playerPosition) == 0 and not getTilePzInfo(playerPosition) then -- se o player se mover ou não estiver em pz, paramos o treino
		stopEvent(training)
		player:setStorageValue(Storage.isTraining, 0)
		player:addStorageValue(exhaustion.storage, os.time() + exhaustion.time)
	end

	local exerciseWeapon = player:getItemById(itemId,true)
	if player:getItemCount(itemId) < 1 then -- se o player não tiver mais uma exercise weapon, paramos o treino
		stopEvent(training)
		player:setStorageValue(Storage.isTraining, 0)
	end
	
	if not exerciseWeapon:isItem() or not exerciseWeapon:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then -- realmente precisamos disso se já verificamos se o player tem o itemId?
		return false
	end
	local exerciseCharges = exerciseWeapon:getAttribute(ITEM_ATTRIBUTE_CHARGES)
	if exerciseCharges < 1 then
		-- ao terminar as cargas, paramos o treino e removemos a exercise weapon
		exerciseWeapon:remove(1)
		stopEvent(training)
		player:setStorageValue(Storage.isTraining, 0)
	end

	local playerVocation = player:getVocation() -- melhor passar apenas uma vez ao iniciar o treino para evitar checar todas as vezes?
	if weapons[itemId].skill == SKILL_MAGLEVEL then
		if not bonusDummy then
			player:addManaSpent(math.ceil(500*rates.magic))
		else
			player:addManaSpent(math.ceil(500*rates.magic)*1.1) -- 10%
		end
	else
		if not bonusDummy then
			player:addSkillTries(weapons[itemId].skill, 1*rates.skill)
		else
			player:addSkillTries(weapons[itemId].skill, (1*rates.skill)*1.1) -- 10%
		end
	end
	playerPosition:sendMagicEffect(CONST_ME_HITAREA)

	if weapons[itemId].effect then
		playerPosition:sendDistanceEffect(dummyPosition, weapons[itemId].effect)
	end
	exerciseWeapon:setAttribute(ITEM_ATTRIBUTE_CHARGES, exerciseCharges-1))
	local training = addEvent(starTraining, playerVocation:getAttackSpeed(), playerId, startPosition, itemId, dummyPosition)
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(exhaustion.storage) >= os.time() then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "This exercise dummy can only be used after a 30 second cooldown.")
		return false
	end

	local startPosition = player:getPosition()
	if player:getStorageValue(Storage.isTraining) == 1 then
		return false
	end
	if target:isItem() then
		if isInArray(dummies.houseDummies,target:getId()) then
			if not weapons[item.itemid].effect and (startPosition:getDistance(target:getPosition()) > 1) then
				stopEvent(training)
				return true
			end
			startTraining(player:getId(), startPosition, item.itemid, target:getPosition(), true)
			player:setStorageValue(Storage.isTraining, 1)
		elseif isInArray(dummies.freeDummies, target:getId()) then
			if not weapons[item.itemid].effect and (startPosition:getDistance(target:getPosition()) > 1) then
				stopEvent(training)
				return true
			end
			startTraining(player:getId(), startPosition, item.itemid, target:getPosition(), false)
			player:setStorageValue(Storage.isTraining, 1)
		end
	end
	return true
end
-- https://github.com/opentibiabr/OTServBR-Global

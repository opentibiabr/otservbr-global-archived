-- Functions from The Forgotten Server
function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return RETURNVALUE_NOERROR
end

function Creature:onTargetCombat(target)
	return RETURNVALUE_NOERROR
end

function Creature:onHear(speaker, words, type)
end

-- Functions from OTServBR-Global
function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return true
end

local function removeCombatProtection(cid)
	local player = Player(cid)
	if not player then
		return true
	end

	local time = 0
	if player:isMage() then
		time = 10
	elseif player:isPaladin() then
		time = 20
	else
		time = 30
	end

	player:setStorageValue(Storage.combatProtectionStorage, 2)
	addEvent(function(cid)
		local player = Player(cid)
		if not player then
			return
		end

		player:setStorageValue(Storage.combatProtectionStorage, 0)
		player:remove()
	end, time * 1000, cid)
end

-- Increase Stamina when Attacking Trainer
local staminaBonus = {
	target = 'Training Monk',
	period = 120000, -- time on miliseconds
	bonus = 1, -- gain stamina
	events = {}
}

local function addStamina(name)
	local player = Player(name)
	if not player then
		staminaBonus.events[name] = nil
	else
		local target = player:getTarget()
		if not target or target:getName() ~= staminaBonus.target then
			staminaBonus.events[name] = nil
		else
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You gain a stamina point.")
			player:setStamina(player:getStamina() + staminaBonus.bonus)
			staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
		end
	end
end

picIf = {}
function Creature:onTargetCombat(target)
	if not self then
		return true
	end

	if not picIf[target.uid] then
		if target:isMonster() then
			target:registerEvent("RewardSystemSlogan")
			picIf[target.uid] = {}
		end
	end

	if target:isPlayer() then
		if self:isMonster() then
			local protectionStorage = target:getStorageValue(Storage.combatProtectionStorage)

			if target:getIp() == 0 then -- If player is disconnected, monster shall ignore to attack the player
				if target:isPzLocked() then return true end
				if protectionStorage <= 0 then
					addEvent(removeCombatProtection, 30 * 1000, target.uid)
					target:setStorageValue(Storage.combatProtectionStorage, 1)
				elseif protectionStorage == 1 then
					self:searchTarget()
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end

				return true
			end

			if protectionStorage >= os.time() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	if ((target:isMonster() and self:isPlayer() and target:getType():isPet() and target:getMaster() == self)
	or (self:isMonster() and target:isPlayer() and self:getType():isPet() and self:getMaster() == target)) then
		return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
	end

	if PARTY_PROTECTION ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			local party = self:getParty()
			if party then
				local targetParty = target:getParty()
				if targetParty and targetParty == party then
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end
			end
		end
	end

	if ADVANCED_SECURE_MODE ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			if self:hasSecureMode() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	if self:isPlayer() then
		if target and target:getName() == staminaBonus.target then
			local name = self:getName()
			if not staminaBonus.events[name] then
				staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
			end
		end
	end

	return true
end

function Creature:onDrainHealth(attacker, typePrimary, damagePrimary,
				typeSecondary, damageSecondary, colorPrimary, colorSecondary)
	if (not self) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	if (not attacker) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	-- New prey => Bonus damage
	if (attacker:isPlayer()) then
		if (self:isMonster() and not self:getMaster()) then
			for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
				if (attacker:getPreyCurrentMonster(slot) == self:getName()
				and attacker:getPreyBonusType(slot) == CONST_BONUS_DAMAGE_BOOST) then
					damagePrimary = damagePrimary + math.floor(damagePrimary * (attacker:getPreyBonusValue(slot) / 100))
					break
				end
			end
		end
	-- New prey => Damage reduction
	elseif (attacker:isMonster()) then
		if (self:isPlayer()) then
			for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
				if (self:getPreyCurrentMonster(slot) == attacker:getName()
				and self:getPreyBonusType(slot) == CONST_BONUS_DAMAGE_REDUCTION) then
					damagePrimary = damagePrimary - math.floor(damagePrimary * (self:getPreyBonusValue(slot) / 100))
					break
				end
			end
		end
	end
	return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
end

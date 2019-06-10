__picif = {}
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
			player:setStamina(player:getStamina() + staminaBonus.bonus)
			staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
		end
	end
end

function Creature:onTargetCombat(target)
	if not self then
		return true
	end

	if not __picif[target.uid] then
		if target:isMonster() then
			target:registerEvent("RewardSystemSlogan")
			__picif[target.uid] = {}
		end
	end

	if target:isPlayer() then
		if self:isMonster() then
			local protectionStorage = target:getStorageValue(Storage.combatProtectionStorage)

			if target:getIp() == 0 then -- If player is disconnected, monster shall ignore to attack the player
			    if target:isPzLocked() then end
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

	if ((target:isMonster() and self:isPlayer() and target:getType():isPet() and target:getMaster() == self) or (self:isMonster() and target:isPlayer() and self:getType():isPet() and self:getMaster() == target)) then
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

function Creature:onDrainHealth(attacker, typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary)
	if (not self) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	if (not attacker) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	-- Imbuement Defense
	if self:isPlayer() then
		for slot = 1, 10 do
			local item = self:getSlotItem(slot)
			if item and item:getType():getImbuingSlots() > 0 then
				for i = 1, item:getType():getImbuingSlots() do
					local slotEnchant = item:getSpecialAttribute(i)
					if (slotEnchant and type(slotEnchant) == 'string') then
						local percentDamage, enchantPercent = 0, item:getImbuementPercent(slotEnchant)
						local typeEnchant = item:getImbuementType(i) or ""

						reductPrimary, reductSecondary = false, false
						if (typeEnchant == "absorbPercentFire") then
							-- reduct fire damage
							if typePrimary == COMBAT_FIREDAMAGE then
								reductPrimary = true
							end

							if typeSecondary == COMBAT_FIREDAMAGE then
								reductSecondary = true
							end
						elseif (typeEnchant == "absorbPercentEarth" and typePrimary == COMBAT_EARTHDAMAGE) then
							-- reduct earth damage
							if typePrimary == COMBAT_EARTHDAMAGE then
								reductPrimary = true
							end

							if typeSecondary == COMBAT_EARTHDAMAGE then
								reductSecondary = true
							end
						elseif (typeEnchant == "absorbPercentIce" and typePrimary == COMBAT_ICEDAMAGE) then
							-- reduct ice damage
							if typePrimary == COMBAT_ICEDAMAGE then
								reductPrimary = true
							end

							if typeSecondary == COMBAT_ICEDAMAGE then
								reductSecondary = true
							end
						elseif (typeEnchant == "absorbPercentEnergy" and typePrimary == COMBAT_ENERGYDAMAGE) then
							-- reduct energy damage
							if typePrimary == COMBAT_ENERGYDAMAGE then
								reductPrimary = true
							end

							if typeSecondary == COMBAT_ENERGYDAMAGE then
								reductSecondary = true
							end
						elseif (typeEnchant == "absorbPercentDeath" and typePrimary == COMBAT_DEATHDAMAGE) then
							-- reduct death damage
							if typePrimary == COMBAT_DEATHDAMAGE then
								reductPrimary = true
							end

							if typeSecondary == COMBAT_DEATHDAMAGE then
								reductSecondary = true
							end
						end

						if reductPrimary then
							damagePrimary = damagePrimary - (damagePrimary * enchantPercent/100)
						end

						if reductSecondary then
							damageSecondary = damageSecondary - (damageSecondary * enchantPercent/100)
						end

						if (typeEnchant ~= "" and typeEnchant == "skillShield" or typeEnchant:find("absorb") and (reductPrimary or reductSecondary)) then
							useStaminaImbuing(self:getId(), item:getUniqueId())
						end
					end
				end
			end
		end
	end

	if (attacker:isPlayer()) then
		if (self:isMonster() and not self:getMaster()) then
			for i = 1, 3 do
				if (attacker:isActive(i-1)) then
					local bonusInfo = attacker:getBonusInfo(i-1)
					if (bonusInfo.Type == 0 and bonusInfo.Name == self:getName()) then
						damagePrimary = damagePrimary + math.floor(damagePrimary * (bonusInfo.Value/100))
						break
					end
				end
			end
		end
	elseif (attacker:isMonster()) then
		if (self:isPlayer()) then
			for i = 1, 3 do
				if (self:isActive(i-1)) then
					local bonusInfo = self:getBonusInfo(i-1)
					if (bonusInfo.Type == 1 and bonusInfo.Name == attacker:getName()) then
						damagePrimary = damagePrimary - math.floor(damagePrimary * (bonusInfo.Value/100))
						return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
					end
				end
			end
		end
	end

	return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
end

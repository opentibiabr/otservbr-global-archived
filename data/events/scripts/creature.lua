-- Functions from The Forgotten Server
function Creature:onChangeOutfit(outfit)
	if hasEventCallback(EVENT_CALLBACK_ONCHANGEMOUNT) then
		if not EventCallback(EVENT_CALLBACK_ONCHANGEMOUNT, self, outfit.lookMount) then
			return false
		end
	end
	if hasEventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT) then
		return EventCallback(EVENT_CALLBACK_ONCHANGEOUTFIT, self, outfit)
	else
		return true
	end
end

function Creature:onAreaCombat(tile, isAggressive)
	if hasEventCallback(EVENT_CALLBACK_ONAREACOMBAT) then
		return EventCallback(EVENT_CALLBACK_ONAREACOMBAT, self, tile, isAggressive)
	else
		return RETURNVALUE_NOERROR
	end
end

function Creature:onHear(speaker, words, type)
	if hasEventCallback(EVENT_CALLBACK_ONHEAR) then
		EventCallback(EVENT_CALLBACK_ONHEAR, self, speaker, words, type)
	end
end

-- Functions from OTServBR-Global
function Creature:onTargetCombat(target)
	if hasEventCallback(EVENT_CALLBACK_ONTARGETCOMBAT) then
		return EventCallback(EVENT_CALLBACK_ONTARGETCOMBAT, self, target)
	else
		return RETURNVALUE_NOERROR
	end
end

-- Need create in Callback Function
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

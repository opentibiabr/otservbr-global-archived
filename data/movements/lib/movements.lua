local conditionHaste = Condition(CONDITION_HASTE, 10)
local conditionSkill = Condition(CONDITION_ATTRIBUTES, 10)

function onEquipWeaponImbuement(player, item)
	local weaponType = item:getType()
    for i = 1, weaponType:getImbuingSlots() do
   	local slotEnchant = item:getSpecialAttribute(i)
        if (slotEnchant) then
        	local skillValue = item:getImbuementPercent(slotEnchant)
        	local typeEnchant = item:getImbuementType(i) or ""
				if (typeEnchant == "skillSword") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_SWORD, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "skillAxe") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_AXE, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "skillClub") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_CLUB, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "skillDist") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_DISTANCE, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "skillShield") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_SHIELD, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "criticalhit") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCEPERCENT, 10)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGEPERCENT, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "hitpointsleech") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_CHANCEPERCENT, 100)
					conditionSkill:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNTPERCENT, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
				elseif (typeEnchant == "magiclevelpoints") then
					conditionSkill:setParameter(CONDITION_PARAM_TICKS, -1)
					conditionSkill:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, skillValue)
					player:addCondition(conditionSkill)
                --c:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -> Icone verde de buff.
            end
        end
    end
	return true
end

function onDeEquipWeaponImbuement(player, item)
	player:removeCondition(CONDITION_HASTE, 10)
	player:removeCondition(CONDITION_ATTRIBUTES, 10)
	return true
end


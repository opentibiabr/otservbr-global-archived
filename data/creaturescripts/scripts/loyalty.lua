local loyalty_condition = Condition(CONDITION_ATTRIBUTES)
loyalty_condition:setParameter(CONDITION_PARAM_TICKS, -1)
loyalty_condition:setParameter(CONDITION_PARAM_SUBID, 10)
loyalty_condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 115)

local parameters = {
	CONDITION_PARAM_STAT_MAGICPOINTSPERCENT, CONDITION_PARAM_SKILL_MELEEPERCENT, CONDITION_PARAM_SKILL_FISTPERCENT,
	CONDITION_PARAM_SKILL_DISTANCEPERCENT, CONDITION_PARAM_SKILL_SHIELDPERCENT, CONDITION_PARAM_SKILL_FISHINGPERCENT
}

function onLogin(player)
	local attr_value = 100 + math.floor(player:getLoyalty() / 360) * 0.05
	for key, attr_key in pairs(parameters) do
		loyalty_condition:setParameter(attr_key, attr_value)
	end
	player:addCondition(loyalty_condition)
	return true
end

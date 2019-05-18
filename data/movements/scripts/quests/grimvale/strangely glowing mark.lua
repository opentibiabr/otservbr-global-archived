local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 22000)
condition:setFormula(0.7, -56, 0.7, -56)
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if item.itemid == 24732 then
		if player:getExhaustion(199990) >= 1 then
			return true
		end
		player:addHealth(200, true, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The mythic fires beneath your feet heal you.')
		player:setExhaustion(199990, 60)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	elseif item.itemid == 24733 then
		if player:getExhaustion(199991) >= 1 then
			return true
		end
		player:addCondition(condition)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		player:setExhaustion(199991, 60)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The mythic fires beneath your feet gave you speed.')
	end
	return true
end

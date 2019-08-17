local condition = Condition(CONDITION_DROWN)
condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -20)
condition:setParameter(CONDITION_PARAM_TICKS, -1)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 2000)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then
		return true
	end
	if player:getCondition(CONDITION_DROWN,CONDITIONID_COMBAT) == nil then
		player:addCondition(condition)
	end
	if player:getStorageValue(Storage.DrowningSpeed) > os.time() then
		if player:getStorageValue(Storage.DrowningSpeed) < 1 then
			player:changeSpeed(600)
			player:setStorageValue(Storage.DrowningSpeed,1)
		end
	end

	if(math.random(1, 10) == 1) then
		position:sendMagicEffect(CONST_ME_BUBBLES)
	end
	return true
end

local underWater = {5405, 5406, 5407, 5408, 5409, 5410, 5743, 5744, 5764, 9671, 9672, 9673, 10019}

function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player == nil then
		return true
	end
	local ppos = player:getPosition()
	if(isInArray(underWater, getThingfromPos({x = ppos.x, y = ppos.y, z = ppos.z, stackpos = 0}).itemid)) then
		return true
	else
		player:removeCondition(CONDITION_DROWN)
		if player:getStorageValue(Storage.DrowningSpeed) == 1 then
			player:changeSpeed(600 * (-1))
			player:setStorageValue(Storage.DrowningSpeed,0)
		end
	end
	return true
end

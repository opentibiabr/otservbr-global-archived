local mechanical_rod = Action()

function mechanical_rod.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local config = {
	targetId = target.itemid,
	waterIds = {629,630,631,632,633,634,4597,4598,4599,4600,4601,4602,4609,4610,4611,4612,4613,4614,7236,9582,13988,13989},
	lootTrash = {3119,3123,3264,3409,3578},
	lootCommon = {3035,3051,3052,3580,236,237},
	lootRare = {3026, 3029, 3032, 7158, 7159},
	lootVeryRare = {281, 282, 9303},
	useWorms = true,
}

	if not table.contains(config.waterIds, config.targetId) then
		return false
	end

	if config.targetId == 9582 then
		local owner = target:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
		if owner ~= 0 and owner ~= player.uid then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are not the owner.")
			return true
		end

		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		target:remove()

		local rareChance = math.random(100)
		if rareChance == 1 then
			player:addItem(config.lootVeryRare[math.random(#config.lootVeryRare)], 1)
		elseif rareChance <= 3 then
			player:addItem(config.lootRare[math.random(#config.lootRare)], 1)
		elseif rareChance <= 10 then
			player:addItem(config.lootCommon[math.random(#config.lootCommon)], 1)
		else
			player:addItem(config.lootTrash[math.random(#config.lootTrash)], 1)
		end
		return true
	end

	if config.targetId ~= 7236 then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	end

	if config.targetId == 622 or config.targetId == 13989 then
		return true
	end

	player:addSkillTries(SKILL_FISHING, 1)
	if math.random(100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if config.useWorms and not player:removeItem("nail", 1) then
			return true
		end

		if config.targetId == 13988 then
			target:transform(config.targetId + 1)
			target:decay()

			if math.random(100) >= 97 then
				player:addItem(13992, 1)
				return true
			end
		elseif config.targetId == 7236 then
			target:transform(config.targetId + 1)
			target:decay()

			local rareChance = math.random(100)
			if rareChance == 1 then
				player:addItem(7158, 1)
				return true
			elseif rareChance <= 4 then
				player:addItem(3580, 1)
				return true
			elseif rareChance <= 10 then
				player:addItem(7159, 1)
				return true
			end
		end
		player:addItem("mechanical fish", 1)
	end
	return true
end

mechanical_rod:id(9306)
mechanical_rod:register()

-- Prey slots consumption
local function preyTimeLeft(player, slot)
	local timeLeft = player:getPreyTimeLeft(slot) / 60
	local monster = player:getPreyCurrentMonster(slot)
	if (timeLeft > 0) then
		local playerId = player:getId()
		local currentTime = os.time()
		local timePassed = currentTime - nextPreyTime[playerId][slot]
		if timePassed >= 59 then
			timeLeft = timeLeft - 1
			nextPreyTime[playerId][slot] = currentTime + 60
		else
			timeLeft = timeLeft - 0
		end
		-- Expiring prey as there's no timeLeft
		if (timeLeft < 1) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your %s's prey has expired.", monster:lower()))
			player:setPreyCurrentMonster(slot, "")
		end
		-- Setting new timeLeft
		player:setPreyTimeLeft(slot, timeLeft * 60)
	else
		-- Expiring prey as there's no timeLeft
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Your %s's prey has expired.", monster:lower()))
		player:setPreyCurrentMonster(slot, "")
	end
	return player:sendPreyData(slot)
end

local BONUS_RATE = 3

function onKill(player, target, lastHit)
    -- monster verify
    if not target:isMonster() or target:getMaster() then
        return true
    end
    for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
        if (player:getPreyCurrentMonster(slot) == target:getName() and player:getPreyBonusType(slot) == CONST_BONUS_IMPROVED_LOOT) then
            preyTimeLeft(player, slot) -- slot consumption
            local probability = math.random(0, 100)
            if (probability < player:getPreyBonusValue(slot)) then
                target:registerEvent('bonusPreyLootDeath')
                player:sendTextMessage(MESSAGE_HEALED, "You get extra loot due your active prey.")
                target:say("Improved loot", TALKTYPE_MONSTER_SAY)
                break
            end
        end
    end
    return true
end
 
function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if not creature then
        return true
    end
    if not creature:getType():getLoot() then
        return true
    end

    local tc = 0
    for i, k in pairs(creature:getType():getLoot()) do
        tc = tc + k.chance
    end
    for i = 1, BONUS_RATE - 1 do
        for i, k in pairs(creature:getType():getLoot()) do
            if math.random() < k.chance/tc then
                local item = corpse:addItem(k.itemId,math.random(k.maxCount) or k.subType)
            end
        end
    end
    return true
end

local setting = {
	storage = Storage.CupCake,
	exaust = 600 -- Is in seconds (600 = 10 minutes)
}

local lemon = Condition(CONDITION_ATTRIBUTES)
lemon:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
lemon:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

function onUse(player, item, fromPos, itemEx, toPos)
	if player:getStorageValue(setting.storage) <= os.time() then
		if (item.itemid == 31719) then
			doPlayerAddMana(getPlayerMaxMana(cid))
			player:say("Mmmm.",TALKTYPE_ORANGE_1)
			player:removeItem(item.uid, 1)
			player:setStorageValue(setting.storage, os.time() + setting.exhaust)
		elseif (item.itemid == 31720) then
			player:addHealth(getCreatureMaxHealth(cid))
			player:say("Mmmm.",TALKTYPE_ORANGE_1)
			player:removeItem(item.uid, 1)
			player:setStorageValue(setting.storage, os.time() + setting.exhaust)
		elseif (item.itemid == 31721) then
			player:say("Mmmm.",TALKTYPE_ORANGE_1)
			player:addCondition(lemon)
			player:removeItem(item.uid, 1)
			player:setStorageValue(setting.storage, os.time() + setting.exhaust)
		end
	else
		player:sendCancelMessage("You are full or you've already eaten a dish within 10 minutes.")
	end
	return true
end

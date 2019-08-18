local config = {
	exhaust = 600 --Exhaust is in seconds 600 equals 10min
}

local lemon = Condition(CONDITION_ATTRIBUTES)
	lemon:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	lemon:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getStorageValue(Storage.CupCakes) <= os.time()) then
		if (item.itemid == 31719) then
			player:addMana(player:getMaxMana() - player:getMana())
			player:say("Mmmm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:remove(1)
			player:setStorageValue(Storage.CupCakes, os.time() + config.exhaust)
		elseif (item.itemid == 31720) then
			player:addHealth(player:getMaxHealth() - player:getHealth())
			player:say("Mmmm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:remove(1)
			player:setStorageValue(Storage.CupCakes, os.time() + config.exhaust)
		elseif (item.itemid == 31721) then
			player:say("Mmmm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(lemon)
			item:remove(1)
			player:setStorageValue(Storage.CupCakes, os.time() + config.exhaust)
		end
	else
		player:sendCancelMessage("You are full or you've already eaten a dish within 10 minutes.")
	end
	return true
end

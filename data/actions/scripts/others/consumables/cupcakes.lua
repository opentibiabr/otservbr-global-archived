local config = {
	exhaust = 600, --Exhaust is in seconds 600 equals 10min
	cupcakeIDs = {
		31719, -- blueberry cupcake
		31720, -- strawberry cupcake
		31721 -- lemon cupcake
	}
}

local lemon = Condition(CONDITION_ATTRIBUTES)
	lemon:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	lemon:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.CupCakes) > os.time() then
		player:sendCancelMessage("You are full or you've already eaten a dish within 10 minutes.")
		return true
	end

	if not config.cupcakeIDs[item.itemid] then
		return true
	end

	if (item.itemid == 31719) then
		player:addMana(player:getMaxMana() - player:getMana())
	end

	if (item.itemid == 31720) then
		player:addHealth(player:getMaxHealth() - player:getHealth())
	end

	if (item.itemid == 31721) then
		player:addCondition(lemon)
	end

	player:say("Mmmm.",TALKTYPE_MONSTER_SAY)
	fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
	item:remove(1)
	player:setStorageValue(Storage.CupCakes, os.time() + config.exhaust)

	return true
end

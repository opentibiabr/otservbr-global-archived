local config = {
	exhaust = 600 --Exhaust is in seconds 600 equals 10min
}

local chilliConCarniphila = Condition(CONDITION_HASTE)
	chilliConCarniphila:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	chilliConCarniphila:setParameter(CONDITION_PARAM_SPEED, 80)

local svargrondSalmonFilet = Condition(CONDITION_ATTRIBUTES)
	svargrondSalmonFilet:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	svargrondSalmonFilet:setParameter(CONDITION_PARAM_SKILL_FISHING, 30)

local tropicalMarinatedTiger = Condition(CONDITION_ATTRIBUTES)
	tropicalMarinatedTiger:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	tropicalMarinatedTiger:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)

local delicatessenSalad = Condition(CONDITION_ATTRIBUTES)
	delicatessenSalad:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	delicatessenSalad:setParameter(CONDITION_PARAM_SKILL_MELEE, 3)

local roastedWyvernWings = Condition(CONDITION_ATTRIBUTES)
	roastedWyvernWings:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	roastedWyvernWings:setParameter(CONDITION_PARAM_SKILL_SHIELD, 7)

local carrotPie = Condition(CONDITION_ATTRIBUTES)
	carrotPie:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	carrotPie:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 7)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getStorageValue(Storage.HirelingFood) <= os.time()) then
		if (item.itemid == 35172) then
			player:say("Chomp.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(roastedWyvernWings)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35173) then
			player:say("Yummm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(carrotPie)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35174) then
			player:say("Munch.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(tropicalMarinatedTiger)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35175) then
			player:say("Munch.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(delicatessenSalad)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35176) then
			player:say("Yummm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(chilliConCarniphila)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35177) then
			player:say("Mmmmm.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			player:addCondition(svargrondSalmonFilet)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35178) then
			player:addHealth(player:getMaxHealth()  * 0.3)
			player:say("Munch.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35179) then
			player:addMana(player:getMaxMana() * 0.3)
			player:say("Chomp.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		elseif (item.itemid == 35180) then
			player:say("Blurg.",TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
			item:remove(1)
			player:setStorageValue(Storage.HirelingFood, os.time() + config.exhaust)
		end
	else
		player:sendCancelMessage("You are full or you've already eaten a dish within 10 minutes.")
	end
	return true
end

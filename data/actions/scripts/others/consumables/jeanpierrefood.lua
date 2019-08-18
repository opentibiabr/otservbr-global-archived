local conditions = {
	CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY,
	CONDITION_PARALYZE, CONDITION_DRUNK, CONDITION_DROWN,
	CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED,
	CONDITION_BLEEDING
}
local condition_shield = Condition(CONDITION_ATTRIBUTES)
	Condition.setParameter(condition_shield, CONDITION_PARAM_SUBID, 3)
	Condition.setParameter(condition_shield, CONDITION_PARAM_BUFF_SPELL, 1)
	Condition.setParameter(condition_shield, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_shield, CONDITION_PARAM_SKILL_SHIELD, 10)
	Condition.setParameter(condition_shield, CONDITION_PARAM_FORCEUPDATE, true)
local condition_ml = Condition(CONDITION_ATTRIBUTES)
	Condition.setParameter(condition_ml, CONDITION_PARAM_SUBID, 4)
	Condition.setParameter(condition_ml, CONDITION_PARAM_BUFF_SPELL, 1)
	Condition.setParameter(condition_ml, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_ml, CONDITION_PARAM_STAT_MAGICPOINTS, 5)
	Condition.setParameter(condition_ml, CONDITION_PARAM_FORCEUPDATE, true)
local condition_melee = Condition(CONDITION_ATTRIBUTES)
	Condition.setParameter(condition_melee, CONDITION_PARAM_SUBID, 5)
	Condition.setParameter(condition_melee, CONDITION_PARAM_BUFF_SPELL, 1)
	Condition.setParameter(condition_melee, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_melee, CONDITION_PARAM_SKILL_MELEE, 10)
	Condition.setParameter(condition_melee, CONDITION_PARAM_FORCEUPDATE, true)
local condition_dist = Condition(CONDITION_ATTRIBUTES)
	Condition.setParameter(condition_dist, CONDITION_PARAM_SUBID, 6)
	Condition.setParameter(condition_dist, CONDITION_PARAM_BUFF_SPELL, 1)
	Condition.setParameter(condition_dist, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_dist, CONDITION_PARAM_SKILL_DISTANCE, 10)
	Condition.setParameter(condition_dist, CONDITION_PARAM_FORCEUPDATE, true)
local condition_f = Condition(CONDITION_ATTRIBUTES)
	Condition.setParameter(condition_f, CONDITION_PARAM_SUBID, 6)
	Condition.setParameter(condition_f, CONDITION_PARAM_BUFF_SPELL, 1)
	Condition.setParameter(condition_f, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_f, CONDITION_PARAM_SKILL_FISHING, 50)
	Condition.setParameter(condition_f, CONDITION_PARAM_FORCEUPDATE, true)
local condition_speed = Condition(CONDITION_HASTE)
	Condition.setParameter(condition_speed, CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	Condition.setParameter(condition_speed, CONDITION_PARAM_SPEED, 600)
local combat_i = Combat()
	Combat.setParameter(combat_i, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
	Combat.setParameter(combat_i, COMBAT_PARAM_AGGRESSIVE, 0)
local condition_i = Condition(CONDITION_INVISIBLE)
	Condition.setParameter(condition_i, CONDITION_PARAM_TICKS, 600000)
	Combat.addCondition(combat_i, condition_i)
local condition_light = Condition(CONDITION_LIGHT)
	condition_light:setParameter(CONDITION_PARAM_LIGHT_LEVEL, 14)
	condition_light:setParameter(CONDITION_PARAM_LIGHT_COLOR, 154)
	condition_light:setParameter(CONDITION_PARAM_TICKS, 60*60*1000)

local iid = {[9992] = 0, [9993] = 1, [9994] = 2, [9995] = 3, [9996] = 4, [9997] = 5, [9998] = 6, [9999] = 7, [10000] = 8, [10001] = 9, [12540] = 10, [12542] = 11, [12543] = 12, [12544] = 13}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local cid = player:getId()
	if player:getStorageValue(Storage.JeanPierreFood + iid[item.itemid]) > os.time() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full or you've already eaten a dish within 10 minutes.")
		return true
	end
	player:setStorageValue(Storage.JeanPierreFood + iid[item.itemid],os.time() + 600)

	if item.itemid == 9992 then
		item:remove(1)
		player:addHealth(player:getMaxHealth() - player:getHealth())
		player:say("Gulp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your health has been refilled.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9993 then
		item:remove(1)
		for i = 1, #conditions do
			player:removeCondition(conditions[i])
		end
		player:say("Chomp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel better body condition.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9994 then
		item:remove(1)
		player:addCondition(condition_shield)
		player:say("Chomp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel less vulnerable.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9995 then
		item:remove(1)
		player:addCondition(condition_ml)
		player:say("Chomp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel smarter.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9996 then
		item:remove(1)
		player:say("Slurp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't really know what this did to you, but suddenly you feel very happy.")
		fromPosition:sendMagicEffect(CONST_ME_HEARTS)
		return true
	elseif item.itemid == 9997 then
		item:remove(1)
		player:addCondition(condition_melee)
		player:say("Yum.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel stronger.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9998 then
		item:remove(1)
		player:addCondition(condition_speed)
		player:say("Munch.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your speed has been increased.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 9999 then
		item:remove(1)
		player:addMana(player:getMaxMana() - player:getMana())
		player:say("Chomp.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your mana has been refilled.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 10000 then
		item:remove(1)
		player:addCondition(condition_dist)
		player:say("Mmmm.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel more focused.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 10001 then
		item:remove(1)
		player:addCondition(condition_f)
		player:say("Smack.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You felt fishing inspiration.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 12540 then
		item:remove(1)
		player:setStorageValue(Storage.DrowningSpeed,os.time() + 86400)
		player:say("Yum.", TALKTYPE_MONSTER_SAY)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Underwater walking speed increased.")
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 12542 then
		if math.random(1,5) == 5 then
			item:remove(1)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You take the last gulp from the large bowl. No leftovers!")
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You take a gulp from the large bowl, but there's still some blackjack in it.")
		end
		player:addHealth(player:getMaxHealth() - player:getHealth())
		player:say("Gulp.", TALKTYPE_MONSTER_SAY)
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 12543 then
		item:remove(1)
		local c = {condition_shield,condition_ml,condition_melee,condition_dist,condition_speed}
		local r = math.random(1,4)
		if r == 1 then
			player:addCondition(c[math.random(1, #c)])
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel stronger, but you have no idea what was increased.")
		elseif r == 2 then
			player:addCondition(condition_light)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You feel enlightened.")
		elseif r == 3 then
			player:addCondition(condition_i)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You became invisible.")
		elseif r == 4 then
			player:addHealth(player:getMaxHealth() - player:getHealth())
			player:addMana(player:getMaxMana() - player:getMana())
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your vitality has been restored.")
		end
			player:say("Smack.", TALKTYPE_MONSTER_SAY)
			fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		return true
	elseif item.itemid == 12544 then
	local ring = player:getSlotItem(CONST_SLOT_RING)
	local r_t = { -- missing Blister Ring
		[2211] = 2208,
		[2212] = 2209,
		[6301] = 6300,
		[2215] = 2213,
		[2204] = 2167,
		[2205] = 2168,
		[2164] = 2164,
		[2203] = 2166,
		[18528] = 18408,
		[2216] = 2214,
		[13826] = 13825,
		[2202] = 2165,
		[26188] = 26187,
		[26186] = 26185,
		[26190] = 26189,
		[2210] = 2207,
		[2206] = 2169}
		if(ring.itemid == 0) then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "No ring equipped.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		return true
		end

	if r_t[ring.itemid] ~= nil then
		item:remove(1)
		if ring.itemid == r_t[ring.itemid] then
			r_m_am = 20
		else
			r_m_am = 1
		end

		for i = 1, 10 do
			player:addItem(r_t[ring.itemid], r_m_am)
		end
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Your ring has been multiplied.")
		player:say("Slurp!", TALKTYPE_MONSTER_SAY)
		return true
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "This ring cannot be multiplied.")
		fromPosition:sendMagicEffect(CONST_ME_POFF)	 
		return true
		end
	end
end

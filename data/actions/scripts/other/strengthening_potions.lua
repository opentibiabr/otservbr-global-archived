local berserker = Condition(CONDITION_ATTRIBUTES)
berserker:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserker:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserker:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 30 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)

local config = {
	[7439] = berserker,
	[7440] = mastermind,
	[7443] = bullseye
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	if item.itemid == 7440 then
		if not player:isMage() then
			player:say('Only sorcerers and druids may drink this fluid.', TALKTYPE_MONSTER_SAY)
			return true
		end
	end

	player:addAchievementProgress('Potion Addict', 100000)
	player:addCondition(useItem)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)

	item:remove(1)
	return true
end

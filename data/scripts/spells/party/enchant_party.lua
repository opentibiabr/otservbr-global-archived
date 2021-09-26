local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 3)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 2 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 1)

local baseMana = 120

local spell = Spell("instant")

function spell.onCastSpell(creature, var, isHotkey)
	local position = creature:getPosition()

	local party = creature:getParty()
	if not party then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local membersList = party:getMembers()
	membersList[#membersList + 1] = party:getLeader()
	if membersList == nil or type(membersList) ~= 'table' or #membersList <= 1 then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local affectedList = {}
	for _, targetPlayer in ipairs(membersList) do
		if targetPlayer:getPosition():getDistance(position) <= 36 then
			affectedList[#affectedList + 1] = targetPlayer
		end
	end

	local tmp = #affectedList
	if tmp <= 1 then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local mana = math.ceil((0.9 ^ (tmp - 1) * baseMana) * tmp)
	if creature:getMana() < mana then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if not combat:execute(creature, var) then
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	creature:addMana(-(mana - baseMana), FALSE)
	creature:addManaSpent((mana - baseMana))

	for _, targetPlayer in ipairs(affectedList) do
		targetPlayer:addCondition(condition)
	end

	return true
end

spell:name("Enchant Party")
spell:words("utori mas sio")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:id(129)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(32)
spell:mana(120)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
